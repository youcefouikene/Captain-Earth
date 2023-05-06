// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:firebase_database/firebase_database.dart';
// import 'package:firebase_core/firebase_core.dart';
// import 'package:firebase_storage/firebase_storage.dart';
// import 'userInfos.dart';
// import 'dart:io';
//
// final databaseReference = FirebaseDatabase.instance.reference();
//
//
// DatabaseReference saveUser(UserInfos cUser){
//   var id = databaseReference.child('Users/').push();
//   id.set(cUser.toJson());
//   return id;
// }
//
// Future<UserInfos?> checkExistence(String email) async {
//   List<UserInfos> cUser = [];
//   DataSnapshot dataSnapshot = ( await databaseReference.child('Users/').orderByChild('email').equalTo(email).once()).snapshot;
//   if(dataSnapshot.value != null){
//     Map<String, dynamic> map = Map<String, dynamic>.from(dataSnapshot.value as dynamic);
//     for (var entry in map.entries) {
//       UserInfos ccUser = createUser(entry.value);
//       ccUser.setUId(entry.key);
//       ccUser.setId(databaseReference.child('Users/' + entry.key));
//       cUser.add(ccUser);
//     }
//     return cUser[0];
//   }
//   else
//   {
//     return null;
//   }
// }
//
// Future updateScore(int score, String userId) async {
//   await FirebaseDatabase.instance.ref('Users/' + userId).update({
//     "score": score,
//   });
// }
//
// Future updateImage(String image, String userId) async {
//   await FirebaseDatabase.instance.ref('Users/' + userId).update({
//     "image": image,
//   });
// }
//
// Future updateStage(int stage, String userId) async {
//   await FirebaseDatabase.instance.ref('Users/' + userId).update({
//     "currentStage": stage,
//   });
// }
//
// Future updateIle(int ile, String userId) async {
//   await FirebaseDatabase.instance.ref('Users/' + userId).update({
//     "currentIle": ile,
//   });
// }
//
// Future <void> uploadPic(String filePath, String fileName, User user) async {
//   File file = File(filePath);
//   try {
//     await FirebaseStorage.instance.ref().child("profile/${user.uid}").delete();
//     await FirebaseStorage.instance.ref().child("profile/${user.uid}").putFile(file);
//   } on FirebaseException catch (e){
//     print(e);
//   }
// }
//
// Future <String?> getPdp(User user) async {
//   String? image;
//   await FirebaseStorage.instance.ref().child("profile/${user.uid}").getDownloadURL().then((value){
//     // if(value != null){
//     //     image = Image.network(value.toString());
//     // }
//     print("this is the image");
//     if(value != null){
//       image = value;
//     }
//
//   });
//   return image;
// }
