import 'package:flutter/material.dart';
import 'package:projet_2cp/backend/progress_controllers.dart';
import 'package:projet_2cp/backend/local_progress/local_progress.dart';
import 'package:projet_2cp/progress/progress.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:audioplayers/audioplayers.dart';

final player = AudioPlayer();
final player1 = AudioPlayer();
final player2 = AudioPlayer();

late bool clickRight;
List<int> choices = [0, 1, 2, 3];
bool didAnswer = false;

int maxLeavesOceanieStation = 54; // OceaniaQuizzes(12 Questions) * 2 + Mini jeu 30
int maxLeavesAsieStation = 48; // AsiaQuizzes(9 Questions) * 2 + Mini jeu 30
int maxLeavesAfriqueStation = 48; // AfriqueQuizzes (12 Questions) * 2 + Mini jeu 24
int maxLeavesEuropeStation =  60; // EuropeQuizzes (15 Questions) * 2 + Mini jeu 30
int maxLeavesAmeriqueNordStation = 48; // Amerique de nord Quizzes (9 Questions) * 2 + Mini jeu 30
int maxLeavesAmeriqueSudStation = 54; // Amerique de sud Quizzes (12 Questions) * 2 + Mini jeu 30
int maxLeavesTotal = 312;

int max(int x, int y) => x > y ? x : y;

void dataUpdator(BuildContext context, StationProgress stationProgress,
    GameProgress gameProgress, int leaves, int stars) async {
  if (stars > gameProgress.stars) {
    //! Changes
    int previousStars = gameProgress.stars;
    gameProgress.stars = stars;
    userProgress.stars = userProgress.stars - previousStars + stars;
    stationProgress.stars = stationProgress.stars - previousStars + stars;

    if (userProgress.currentStation == 5 &&
        (userProgress.stations[5].stars / 2 >= 2)) {
      //? If Last Game in the last station
      userProgress.trophy = 1;
    } else if (userProgress.currentStation < 5 &&
        ((stationProgress.stars / 2) >= 2)) {
      //! else if we passed the condition of getting 2 stars for the station to pass to the next station
      userProgress.currentStation++;
    }
  }
  if (gameProgress.leaves < leaves) {
    gameProgress.leaves = leaves;
  }
  userProgress.leaves += leaves;
  stationProgress.leaves += leaves;

  //! Updates
  LocalProgress.updateUser(userProgress);
  LocalProgress.updateCurrentStation(stationProgress);
  LocalProgress.updateCurrentGame(gameProgress);

  SharedPreferences prefs = await SharedPreferences.getInstance();
}

/*
void playQqs(sound1, sound2,bool stop ) {
  player1.play(
    AssetSource('sounds/questions/$sound1.mp3',),
  );

  player2.play(
    AssetSource('sounds/stations/$sound2.mp3',),
  );

  player1.setVolume(0.7);
  player2.setVolume(0.2);

  player2.onPlayerStateChanged.listen((state) {
      // Restart the audio from the beginning
      player2.play(
        AssetSource('sounds/stations/$sound2.mp3',),

      );

  });
  if(stop){
    player2.setVolume(0.2);
    void stopAudio() async {
      await player2.stop();
      await player1.stop();
    }
  }
}
*/

// void playQqs(sound1, sound2) {
//   player1.play(
//     AssetSource('sounds/questions/$sound1.mp3',),
//   );
//   player2.play(
//     AssetSource('sounds/stations/$sound2.mp3',),
//   );

//   player1.setVolume(0.7);

//   player2.onPlayerStateChanged.listen((state) {
//       // Restart the audio from the beginning
//       player2.play(
//         AssetSource('sounds/stations/$state.mp3',),
//       );
//   });
//   player2.setVolume(0.2);
// }

void playQqs(sound) {
  player.play(
    AssetSource(
      'sounds/questions/$sound.mp3',
    ),
  );
  player.setVolume(0.8);
}

void playQqsBackground(sound) {
  player.play(
    AssetSource(
      'sounds/stations/$sound.mp3',
    ),
  );
  player.setVolume(0.8);
}

void playSound() async {
  await player.play(AssetSource('sound.mp3'));
}

void loop() {
  player.setReleaseMode(ReleaseMode.loop);
}
/*
class MyAudioPlayer {
  AudioPlayer audioPlayer = AudioPlayer();
 void playAudio() async {
  AudioCache cache = AudioCache();
  AudioPlayer audioPlayer = await cache.loop("assets/audio/my_audio_file.mp3");
  audioPlayer.setReleaseMode(ReleaseMode.LOOP);
}

  void stopAudio() async {
    await audioPlayer.stop();
  }
}
 */
