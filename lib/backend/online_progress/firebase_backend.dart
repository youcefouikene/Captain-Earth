import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../progress_controllers.dart';
import '../../data/initializedThemes.dart';

class OnlineProgress {
  static final db = FirebaseFirestore.instance;

  static Future<UserCredential?> signInWithGooglee() async {
    //!Signing In with google
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
    if (googleUser == null) return null;

    final GoogleSignInAuthentication googleAuth =
        await googleUser.authentication;
    final OAuthCredential credential = GoogleAuthProvider.credential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );
    return await FirebaseAuth.instance.signInWithCredential(credential);
  }

  static void signOutWithGooglee() {
    //!Sign Out
    FirebaseAuth.instance.signOut();
  }

  static Future<void> createParent(String parentName) async {
    dynamic parentRef = db.collection("Parents").doc();
    final parentData = <String, dynamic>{
      "parentName": parentName,
      "onlineDate": DateTime.now().toString()
    };
    await parentRef.set(parentData);
  }

  static Future<List<String>> getParentsNames() async {
    QuerySnapshot data = await db.collection("Parents").get();
    List parents = [for (var i in data.docs) i.data() as Map<String, dynamic>];
    List<String> p = List.generate(
      parents.length,
      (index) => parents[index]['parentName'],
    );
    p.sort((a, b) => a.compareTo(b));
    return p;
  }

  static Future<String> getParentOnlineDate(String parentName) async {
    QuerySnapshot data = await db
        .collection("Parents")
        .where("parentName", isEqualTo: parentName)
        .get();

    List onlineDate = [
      for (var i in data.docs) i.data() as Map<String, dynamic>
    ];
    return onlineDate[0]['onlineDate'];
  }

  static void updateParent(String parentName, String date) async {
    dynamic id;
    await db
        .collection("Parents")
        .where("parentName", isEqualTo: parentName)
        .get()
        .then((querySnapshot) {
      for (var element in querySnapshot.docs) {
        id = element.id;
      }
    });
    await db.collection('Parents').doc(id).update({'onlineDate': date});
  }

  static Future<void> createChild(String parent, ChildProgress childProgress) async {
    dynamic refChild = db.collection("Children").doc();
    await refChild.set(
      {
        'child': childProgress.childName,
        'password': childProgress.password,
        'parent': childProgress.parent,
        'age': childProgress.age,
        'avatar': childProgress.avatar,
        'trophie': childProgress.trophie,
        'badge': childProgress.badge,
        'stars': childProgress.stars,
        'theme': childProgress.theme,
        'game': childProgress.game,
      },
    );
    int i = 0;
    int j = 0;
    while (i < initThemesProgress.length) {
      ThemeProgress theme = childProgress.themes[i];
      dynamic themeRef = db.collection("Themes").doc();
      await themeRef.set(
        {
          'theme': theme.themeName,
          'child': childProgress.childName,
          'parent': parent,
          'themeIndex': theme.themeIndex,
          'stars': theme.stars,
        },
      );
      j = 0;
      while (j < theme.games.length) {
        GameProgress game = childProgress.themes[i].games[j];
        dynamic gameRef = db.collection("Games").doc();
        gameRef.set(
          {
            'game': game.gameName,
            'theme': theme.themeName,
            'child': childProgress.childName,
            'parent': parent,
            'gameIndex': game.gameIndex,
            'stars': game.stars,
          },
        );
        j++;
      }
      i++;
    }
  }

  //! **********/
  //!
  //! GETTER ***/
  //!        ***/
  //! **********/

  static Future<List<ChildProgress>> getChildren(String parent) async {
    //Returns a List of maps containing util's children data
    QuerySnapshot data = await db
        .collection("Children")
        .where("parent", isEqualTo: parent)
        .get();

    List childs = [for (var i in data.docs) i.data() as Map<String, dynamic>];

    return List.generate(
      childs.length,
      (index) => ChildProgress(
        childName: childs[index]['child'],
        password: childs[index]['password'],
        parent: childs[index]['parent'],
        age: childs[index]['age'],
        avatar: childs[index]['avatar'],
        trophie: childs[index]['trophie'],
        stars: childs[index]['stars'],
        badge: childs[index]['badge'],
        theme: childs[index]['theme'],
        game: childs[index]['game'],
        themes: [],
      ),
    );
  }

  static Future<List<ThemeProgress>> getThemes(
      String parent, String child) async {
    QuerySnapshot data = await db
        .collection("Themes")
        .where("parent", isEqualTo: parent)
        .where("child", isEqualTo: child)
        .get();

    List themes = [for (var i in data.docs) i.data() as Map<String, dynamic>];
    List<ThemeProgress> th = List.generate(
      themes.length,
      (index) => ThemeProgress(
        themeName: themes[index]['theme'],
        parent: themes[index]['parent'],
        child: themes[index]['child'],
        themeIndex: themes[index]['themeIndex'],
        stars: themes[index]['stars'],
        games: [],
      ),
    );
    th.sort((a, b) => a.themeIndex.compareTo(b.themeIndex));
    return th;
  }

  static Future<List<GameProgress>> getGames(
      String parent, String child, String theme) async {
    QuerySnapshot data = await db
        .collection("Games")
        .where("parent", isEqualTo: parent)
        .where("child", isEqualTo: child)
        .where("theme", isEqualTo: theme)
        .get();

    List games = [for (var i in data.docs) i.data() as Map<String, dynamic>];
    List<GameProgress> res = List.generate(
      games.length,
      (index) => GameProgress(
        gameName: games[index]['game'],
        parent: games[index]['parent'],
        child: games[index]['child'],
        theme: games[index]['theme'],
        gameIndex: games[index]['gameIndex'],
        stars: games[index]['stars'],
      ),
    );
    res.sort(((a, b) => a.gameIndex.compareTo(b.gameIndex)));
    return res;
  }

  static void updateTheme(ThemeProgress themeProgress) async {
    dynamic id;
    await db
        .collection("Themes")
        .where("parent", isEqualTo: themeProgress.parent)
        .where("child", isEqualTo: themeProgress.child)
        .where("theme", isEqualTo: themeProgress.themeName)
        .get()
        .then((querySnapshot) {
      for (var element in querySnapshot.docs) {
        id = element.id;
      }
    });
    await db
        .collection('Themes')
        .doc(id)
        .update({'stars': themeProgress.stars});
  }

  static void updateGame(GameProgress gameProgress) async {
    // Updating the number of stars of the game
    dynamic id;
    await db
        .collection("Games")
        .where("parent", isEqualTo: gameProgress.parent)
        .where("child", isEqualTo: gameProgress.child)
        .where("theme", isEqualTo: gameProgress.theme)
        .where("game", isEqualTo: gameProgress.gameName)
        .get()
        .then((querySnapshot) {
          for (var element in querySnapshot.docs) {
            id = element.id;
          }
        });
    await db.collection('Games').doc(id).update({'stars': gameProgress.stars});
  }

  static void updateChild(ChildProgress childProgress) async {
    // updating child information that includes ( stars/trophies/badges/theme/game )
    dynamic id;
    await db
        .collection("Children")
        .where("parent", isEqualTo: childProgress.parent)
        .where("child", isEqualTo: childProgress.childName)
        .get()
        .then((querySnapshot) {
      for (var element in querySnapshot.docs) {
        id = element.id;
      }
    });
    await db.collection('Children').doc(id).update({
      'stars': childProgress.stars,
      'trophie': childProgress.trophie,
      'badge': childProgress.badge,
      'theme': childProgress.theme,
      'game': childProgress.game,
    });
  }

  String getOnlineDate() {
    return 'Date';
  }
}
