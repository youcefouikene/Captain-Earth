/*import 'package:flutter/material.dart';
import 'dart:async';
import 'DechetModel.dart';


class EuropeInteractiveGame extends StatefulWidget {
  const EuropeInteractiveGame({Key? key}) : super(key: key);

  @override
  State<EuropeInteractiveGame> createState() => _EuropeInteractiveGameState();
}

class _EuropeInteractiveGameState extends State<EuropeInteractiveGame> {
  //var player = AudioCache();
  List<DechetModel> ? listDechets;
  List<DechetModel> ? listPoubelles;
  int ? score;
  bool ? gameOver;
  int currentIndex = 0;
  bool showImage  = false;//boolean pour gerer l'apparition de +1 ou  -1 selon le score 

  void handleAccept() {
    setState(() {
      currentIndex++;
    });
  }

  initGame(){
    gameOver = false;
    score = 0;

    listDechets = [   
      // Organic
      DechetModel( name: 'orange', value: '1', img: 'assets/dechets/orange.png',),
      DechetModel( name: 'steak', value: '1', img: 'assets/dechets/steak.png',),
      DechetModel( name: 'mais', value: '1', img: 'assets/dechets/mais.png',),
      DechetModel( name: 'poisson', value: '1', img: 'assets/dechets/poisson.png',),
      DechetModel( name: 'fromage', value: '1', img: 'assets/dechets/fromage.png',),
      // Paper
      DechetModel( name: 'feuillePapier1', value: '2', img: 'assets/dechets/feuillePapier1.png',),
      DechetModel( name: 'feuillePapier2', value: '2', img: 'assets/dechets/feuillePapier2.png',),
      DechetModel( name: 'journal', value: '2', img: 'assets/dechets/journal.png',),
      DechetModel( name: 'carton', value: '2', img: 'assets/dechets/carton.png',),
      // Glass
      DechetModel( name: 'bouteilleVerre1_coca', value: '3', img: 'assets/dechets/bouteilleVerre1_coca.png',),
      DechetModel( name: 'bouteilleVerre2', value: '3', img: 'assets/dechets/bouteilleVerre2.png',),
      DechetModel( name: 'verre1', value: '3', img: 'assets/dechets/verre1.png',),
      DechetModel( name: 'verre2', value: '3', img: 'assets/dechets/verre2.png',),
      DechetModel( name: 'bouteilleVerre3', value: '3', img: 'assets/dechets/bouteilleVerre3.png',),
      // Plastic
      DechetModel( name: 'bouteillePlastique', value: '4', img: 'assets/dechets/bouteillePlastique2.png',),
      DechetModel( name: 'plaquePlastique', value: '4', img: 'assets/dechets/plaquePlastique.png',),
      DechetModel( name: 'cd', value: '4', img: 'assets/dechets/cd.png',),
      DechetModel( name: 'bouteillePlastique2', value: '4', img: 'assets/dechets/bouteillePlastique2.png',),
      DechetModel( name: 'sachet', value: '4', img: 'assets/dechets/sachet.png'),
    ];

    // Les poubelles
    listPoubelles =[
      //organic poubelle
      DechetModel(name: 'Organic', img: 'assets/dechets/red.png', value: '1'),
      DechetModel(name: 'Paper', img: 'assets/dechets/blue.png', value: '2'),
      DechetModel(name: 'Glass', img: 'assets/dechets/green.', value: '3'),
      DechetModel(name: 'Plastic', img: 'assets/dechets/yellow.png', value:'4'),
    ];

    listDechets!.shuffle();
  }

  @override
  void initState() {
    super.initState();
    initGame();
  }

  @override
  Widget build(BuildContext context) {
    if (currentIndex == listDechets!.length ) gameOver = true;
    
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
                padding: const EdgeInsets.all(15),
              child: Text.rich(
                TextSpan(
                  children: [
                    TextSpan(
                      text: 'Score',
                      style: Theme.of(context).textTheme.subtitle1,
                    ),
                    TextSpan(
                      text: '$score',
                      style: Theme.of(context)
                        .textTheme
                        .headline2
                        !.copyWith(color: Colors.teal),
                    ),
                  ],
                ),
              ),
            ),

            if(!gameOver!)
              Padding(
                    padding: EdgeInsets.fromLTRB(0.0, 10.0, 800, 0.0),
                    child: Stack(
                    children: [
                       if (showImage)
                       Image.network('https://st2.depositphotos.com/1439888/12407/i/600/depositphotos_124076524-stock-photo-golden-number-1-on-star.jpg'), ],
                    ),
                    ),
              Row(
                children: [
                  const Spacer(),
                
                  Container(
                    margin: EdgeInsets.all(8),
                    child: Draggable<DechetModel>(
                      data: listDechets![currentIndex],
                      childWhenDragging: Container(),
                      feedback: CircleAvatar(
                        backgroundColor: Colors.white,
                        backgroundImage: AssetImage(listDechets![currentIndex].img),
                        radius: 50,
                      ),
                      child: CircleAvatar(
                        backgroundColor: Colors.white,
                        backgroundImage: AssetImage(listDechets![currentIndex].img),
                        radius: 30,
                      ),
                    ),
                  ),
                  const Spacer(flex: 2,),
                  Column(
                    children: listPoubelles!.map((item){
                      return DragTarget<DechetModel>(
                          onAccept: (receivedItem){
                            if(item.value == receivedItem.value){
                              setState(() {
                                //listDechets!.remove(receivedItem);
                                handleAccept();
                              });
                              score = score !+ 1; 
                              item.accepting = false;
                              // player.play('true.wav');
                               showImage = true; 
                               Timer(const Duration(seconds: 1), () {
                                setState(() {
                                  showImage = false;
                                   });
                                   });

                            } else {
                              setState(() {
                                score = score !- 1;
                                item.accepting = false;
                                // player.play('false.wav');
                              });
                            }
                          },
                        onWillAccept: (receivedItem){
                            setState(() {
                              item.accepting = true;
                            });
                            return true;
                        },
                        onLeave: (receivedItem){
                          setState(() {
                            item.accepting = false;
                          });
                        },
                        builder: (context, acceptedItems, rejectedItems) =>
                          Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              color: item.accepting
                                ? Colors.grey[400] : Colors.grey[200],
                            ),
                            alignment: Alignment.center,
                            height: MediaQuery.of(context).size.width / 6.5,
                            width: MediaQuery.of(context).size.width / 3,
                            margin: EdgeInsets.all(8),
                            child: Text(
                              item.name,
                              style: Theme.of(context).textTheme.headline6,
                            ),
                          ),
                      );
                    }).toList(),
                  ),
                  Spacer(),
                  
                  ],
              ),
            if(gameOver!)
              Center(
                child: Column(
                  children: [
                    const Padding(
                      padding: EdgeInsets.all(8),
                      child: Text(
                        'Game Over',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8),
                      child: Text(
                        'Your Score Is : $score',
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
    );
  }
}
*/

import 'dart:async';
import 'package:flutter/material.dart';
import '../Screens/DechetModel.dart';

class EuropeInteractiveGame extends StatefulWidget {
  const EuropeInteractiveGame({Key? key}) : super(key: key);

  @override
  State<EuropeInteractiveGame> createState() => _EuropeInteractiveGameState();
}

class _EuropeInteractiveGameState extends State<EuropeInteractiveGame> {
  //var player = AudioCache();
  List<DechetModel> ? listDechets;
  List<DechetModel> ? listPoubelles;
  
  int ? score;
  bool ? gameOver;
  
  bool showImagePVert  = false;
  bool showImagePRouge  = false;
  bool showImagePJaune = false;
  bool showImagePBleu  = false;

  bool showImageMVert = false;
  bool showImageMRouge  = false;
  bool showImageMJaune = false;
  bool showImageMBleu  = false;
  int choix=-1;
  var tabPathBonus=[
    "assets/bonnus/+1rouge.png",
    "assets/bonnus/+1bleu.png",
    "assets/bonnus/+1vert.png",
    "assets/bonnus/+1jaune.png",
    "assets/bonnus/-1rouge.png",
    "assets/bonnus/-1bleu.png",
    "assets/bonnus/-1vert.png",
    "assets/bonnus/-1jaune.png",
     ];

  int currentIndex = 0;

  // AudioPlayer audioPlayer = AudioPlayer();
  //int correctSoundId;
  //int wrongSoundId;

  // Future<void> loadAudioFiles() async {
  //   String correctSound = "path/to/correct_sound.mp3";
  //   String wrongSound = "path/to/wrong_sound.mp3";
  //   correctSoundId = await audioPlayer?.setUrl(correctSound);
  //   wrongSoundId = await audioPlayer?.setUrl(wrongSound);
  // }

  void handleAccept() {
    setState(() {
      currentIndex++;
    });
  }

  initGame(){
    gameOver = false;
    score = 0;

    listDechets = [   
      // Organic
      DechetModel( name: 'orange', value: '1', img: 'assets/dechets/orange.png',),
      DechetModel( name: 'steak', value: '1', img: 'assets/dechets/steak.png',),
      DechetModel( name: 'mais', value: '1', img: 'assets/dechets/mais.png',),
      DechetModel( name: 'poisson', value: '1', img: 'assets/dechets/poisson.png',),
      DechetModel( name: 'fromage', value: '1', img: 'assets/dechets/fromage.png',),
      // Paper
      DechetModel( name: 'feuillePapier1', value: '2', img: 'assets/dechets/feuillePapier1.png',),
      DechetModel( name: 'feuillePapier2', value: '2', img: 'assets/dechets/feuillePapier2.png',),
      DechetModel( name: 'journal', value: '2', img: 'assets/dechets/journal.png',),
      DechetModel( name: 'carton', value: '2', img: 'assets/dechets/carton.png',),
      // Glass
      DechetModel( name: 'bouteilleVerre1_coca', value: '3', img: 'assets/dechets/bouteilleVerre1_coca.png',),
      DechetModel( name: 'bouteilleVerre2', value: '3', img: 'assets/dechets/bouteilleVerre2.png',),
      DechetModel( name: 'verre1', value: '3', img: 'assets/dechets/verre1.png',),
      DechetModel( name: 'verre2', value: '3', img: 'assets/dechets/verre2.png',),
      DechetModel( name: 'bouteilleVerre3', value: '3', img: 'assets/dechets/bouteilleVerre3.png',),
      // Plastic
      DechetModel( name: 'bouteillePlastique', value: '4', img: 'assets/dechets/bouteillePlastique2.png',),
      DechetModel( name: 'plaquePlastique', value: '4', img: 'assets/dechets/plaquePlastique.png',),
      DechetModel( name: 'cd', value: '4', img: 'assets/dechets/cd.png',),
      DechetModel( name: 'bouteillePlastique2', value: '4', img: 'assets/dechets/bouteillePlastique2.png',),
      DechetModel( name: 'sachet', value: '4', img: 'assets/dechets/sachet.png'),
    ];

    // Les poubelles
    listPoubelles =[
      //organic poubelle
      DechetModel(name: 'Organic', img: 'assets/dechets/poubelle-organique.png', value: '1'),
      DechetModel(name: 'Paper', img: 'assets/dechets/poubelle-papier.png', value: '2'),
      DechetModel(name: 'Glass', img: 'assets/dechets/poubelle-verre.', value: '3'),
      DechetModel(name: 'Plastic', img: 'assets/dechets/poubelle-plastique.png', value:'4'),
    ];

    listDechets!.shuffle();
  }

  @override
  void initState() {
    super.initState();
    initGame();
  }

  @override
  Widget build(BuildContext context) {
    if (currentIndex == listDechets!.length ) gameOver = true;
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
                padding: const EdgeInsets.all(15),
              child: Text.rich(
                TextSpan(
                  children: [
                    TextSpan(
                      text: 'Score',
                      style: Theme.of(context).textTheme.subtitle1,
                    ),
                    TextSpan(
                      text: '$score',
                      style: Theme.of(context)
                        .textTheme
                        .headline2
                        !.copyWith(color: Colors.teal),
                    ),
                  ],
                ),
              ),
            ),

            if(!gameOver!)
              Padding(
                padding: EdgeInsets.fromLTRB(0.0, 10.0, 800, 0.0),
                child: Stack(
                    children: [
                      if (choix!=-1)
                      Image.asset(tabPathBonus[choix]), 
                      
                      ],
                    ),
                    ),
              Row(
                children: [
                  const Spacer(),
                  
                  // 
                  // ListView.builder(
                  //   itemCount:1,
                  //   itemBuilder: (context, index) {
                  //     final item = listDechets![index];
                  //     return Container(
                  //       margin: EdgeInsets.all(8),
                  //       child: Draggable<DechetModel>(
                  //         data: item,
                  //         childWhenDragging: Container(),
                  //         feedback: CircleAvatar(
                  //           backgroundColor: Colors.white,
                  //           backgroundImage: AssetImage(item.img),
                  //           radius: 50,
                  //         ),
                  //         child: CircleAvatar(
                  //           backgroundColor: Colors.white,
                  //           backgroundImage: AssetImage(item.img),
                  //           radius: 30,
                  //         ),
                  //       ),
                  //     );
                  //   },
                  // ),
                  
                  Container(
                    margin: EdgeInsets.all(8),
                    child: Draggable<DechetModel>(
                      data: listDechets![currentIndex],
                      childWhenDragging: Container(),
                      feedback: CircleAvatar(
                        backgroundColor: Colors.white,
                        backgroundImage: AssetImage(listDechets![currentIndex].img),
                        radius: 50,
                      ),
                      child: CircleAvatar(
                        backgroundColor: Colors.white,
                        backgroundImage: AssetImage(listDechets![currentIndex].img),
                        radius: 30,
                      ),
                    ),
                  ),
                  const Spacer(flex: 2,),
                  Column(
                    children: listPoubelles!.map((item){
                      return DragTarget<DechetModel>(
                          onAccept: (receivedItem){
                            if(item.value == receivedItem.value){
                              setState(() {
                                //listDechets!.remove(receivedItem);
                                handleAccept();
                              });
                              score = score !+ 1;
                              item.accepting = false;
                              // player.play('true.wav');
                              switch (item.value){
                                //organic
                                case '1':
                                showImagePRouge=true;
                                choix=0;
                                Timer(const Duration(seconds: 1), () {
                                setState(() {
                                  showImagePRouge=false;
                                  choix=-1;
                                });
                              });
                                break;
                                //paper
                                case '2':
                                choix=1;
                                showImagePBleu=true;
                                Timer(const Duration(seconds: 1), () {
                                setState(() {
                                showImagePBleu=false;
                                choix=-1;

                                });
                              });
                                break;
                                //glass
                                case '3':
                                choix=2;
                                showImagePVert=true;
                                Timer(const Duration(seconds: 1), () {
                                setState(() {
                                showImagePVert=false;
                                choix=-1;

                                });
                              });
                                break;
                                //plastic
                                case '4':
                                choix=3;
                                showImagePJaune=true;
                                Timer(const Duration(seconds: 1), () {
                                setState(() {
                                showImagePJaune=false;
                                choix=-1;
                                });
                              });
                                break;
                            }
                            } else {
                              setState(() {
                                score = score !- 1;
                                item.accepting = false;
                                // player.play('false.wav');
                                switch (item.value){
                                //organic
                                case '1':
                                choix=4;
                                showImageMRouge=true;
                                Timer(const Duration(seconds: 1), () {
                                setState(() {
                                  showImageMRouge=false;
                                  choix=-1;
                                });
                              });
                                break;
                                //paper
                                case '2':
                                choix=5;
                                showImageMBleu=true;
                                Timer(const Duration(seconds: 1), () {
                                setState(() {
                                showImageMBleu=false;
                                choix=-1;

                                });
                              });
                                break;
                                //glass
                                case '3':
                                choix=6;
                                showImageMVert=true;
                                Timer(const Duration(seconds: 1), () {
                                setState(() {
                                showImageMVert=false;
                                choix=-1;

                                });
                              });
                                break;
                                //plastic
                                case '4':
                                choix=7;
                                showImageMJaune=true;
                                Timer(const Duration(seconds: 1), () {
                                setState(() {
                                showImageMJaune=false;
                                choix=-1;

                                });
                              });
                                break;
                            }
                              });
                            }
                          },
                        onWillAccept: (receivedItem){
                            setState(() {
                              item.accepting = true;
                            });
                            return true;
                        },
                        onLeave: (receivedItem){
                          setState(() {
                            item.accepting = false;
                          });
                        },
                        builder: (context, acceptedItems, rejectedItems) =>
                          Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              color: item.accepting
                                ? Colors.grey[400] : Colors.grey[200],
                            ),
                            alignment: Alignment.center,
                            height: MediaQuery.of(context).size.width / 6.5,
                            width: MediaQuery.of(context).size.width / 3,
                            margin: EdgeInsets.all(8),
                            child: Text(
                              item.name,
                              style: Theme.of(context).textTheme.headline6,
                            ),
                          ),
                      );
                    }).toList(),
                  ),
                  Spacer(),
                  ],
              ),
            if(gameOver!)
              Center(
                child: Column(
                  children: [
                    const Padding(
                      padding: EdgeInsets.all(8),
                      child: Text(
                        'Game Over',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8),
                      child: Text(
                        'Your Score Is : $score',
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
    );
  }
}






