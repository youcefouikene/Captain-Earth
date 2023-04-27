import 'package:flutter/material.dart';
import '../../data/dechetModel.dart';
import '../../widgets.dart';

class ThrowGarbage extends StatefulWidget {
  const ThrowGarbage({Key? key}) : super(key: key);

  @override
  State<ThrowGarbage> createState() => _ThrowGarbageState();
}

class _ThrowGarbageState extends State<ThrowGarbage> {
  late List<DechetModel> listDechets;
  late List<DechetModel> listPoubelles;
  //var player = AudioCache();

  late int echec;
  late bool gameOver;

  int choix=-1;

  String choixBonus = "";
  String plusOrMinus = "";

  late int currentIndex;
  int totalScore = 509;

  IconData  _icone=Icons.music_note;
  Color col= const Color.fromRGBO(232,69,96,1);

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
    totalScore = 509;
    gameOver = false;
    echec = 0;
    currentIndex = 0;

    listDechets = myDechetList;
    listPoubelles = myPoubelleList;

    listDechets.shuffle();
  }

  @override
  void initState() {
    super.initState();
    initGame();
  }

  @override
  Widget build(BuildContext context) {
    if ( currentIndex == (myDechetList.length ) ) {
      gameOver = true;
    }

    return Scaffold(
      body: Container(
        height: double.infinity,
        padding: const EdgeInsets.all(16),
        decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/images/europe background.png'),
              fit: BoxFit.cover,
            )
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if(gameOver)

              Padding(
                padding: const EdgeInsets.only(top: (86/360)*100,  ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children:[
                    WinningBox(
                        pourcentage1: 286/800,
                        pourcentage2: 250/360,
                        pourcentageFont: 40/800,
                        pourcentageRaduis: 43/800,
                        score: totalScore,
                        stars: (echec <= 3) ? 3 : ( echec <= 6) ? 2 : ( echec <= 12) ? 1 : 0,
                        station: 'station 04'
                    ),

                    const SizedBox(width: 28,),

                    (echec <= 3) ? const Image(image: AssetImage('assets/avatar/Captain jumping.png')) : (echec <= 12) ? const Image(image: AssetImage('assets/avatar/Captain good.png')) : const Image(image: AssetImage('assets/avatar/Captain crying.png'))
                  ],
                ),
              ),

            if(!gameOver)
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    children: [
                      InkWell(
                        onTap: () {
                          setState((){
                            if(_icone==Icons.music_note){
                              _icone=Icons.music_off;
                            }else{
                              _icone=Icons.music_note;
                            }},
                          );
                        },
                        onHover: (value){
                          if(value){
                            setState(() {
                              col=const Color.fromRGBO(192, 36, 97, 1);
                            });
                          }else{
                            setState(() {
                              col= const Color.fromRGBO(232,69,96,1) ;
                            });
                          } },
                        child: CustomContainer(
                          colorTop:const  Color.fromRGBO(232,69,96,1),
                          widthContainer: MediaQuery.of(context).size.width * 0.04875,
                          heightContainer: MediaQuery.of(context).size.width * 0.04875,
                          icon: _icone,
                        ),
                      ),
                      SizedBox(height: MediaQuery.of(context).size.height*(18/360),),
                      InkWell(
                        onTap: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (_) {
                                return const Map();//aller au map car quand on clique sur le button
                              },
                            ),
                          );
                        },
                        onHover: (value){
                          if(value){
                            setState(() {
                              col=const Color.fromRGBO(192, 36, 97, 1);
                            });
                          }else{
                            setState(() {
                              col= const Color.fromRGBO(232,69,96,1) ;
                            });
                          }
                        },
                        child: CustomContainer(
                          colorTop:const Color.fromRGBO(232,69,96,1),
                          widthContainer: MediaQuery.of(context).size.width * 0.04875,//56.0,
                          heightContainer: MediaQuery.of(context).size.width * 0.04875,//56.0,
                          icon:Icons.map_outlined,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(width: (64/800) * MediaQuery.of(context).size.width,),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Column(
                        children: [
                          PointBar(score: totalScore),
                          Container(
                            margin: const EdgeInsets.all(6),
                            child: Draggable<DechetModel>(
                              data: listDechets[currentIndex],
                              childWhenDragging: Container(),
                              feedback: Image.asset(
                                listDechets[currentIndex].img,
                                fit: BoxFit.cover,
                              ),
                              child: Image.asset(
                                listDechets[currentIndex].img,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ],
                      ),
                      const Spacer(),
                      Row(
                        children: listPoubelles.reversed.map((item){
                          return DragTarget<DechetModel>(
                              onAccept: (receivedItem){
                                if(item.value == receivedItem.value){
                                  setState(() {
                                    handleAccept();
                                    totalScore++;
                                    choixBonus = item.value;
                                    plusOrMinus = "plus";
                                  });
                                  item.accepting = false;
                                  //await audioPlayer.play(correctSoundId);

                                } else {
                                  setState(() {
                                    echec++;
                                    item.accepting = false;
                                    choixBonus = item.value;
                                    plusOrMinus = "minus";
                                    //await audioPlayer.play(wrongSoundId);
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
                                    width: (135/800)*MediaQuery.of(context).size.width,
                                    padding: EdgeInsets.only(left: (42/800)*MediaQuery.of(context).size.width ),
                                    child: Image.asset(
                                      item.img,
                                      fit: BoxFit.cover,
                                    ),
                                  )
                          );
                        }).toList(),
                      ),
                    ],
                  ),

                  SizedBox(width: (64/800) * MediaQuery.of(context).size.width,),

                  SizedBox(
                    width:60,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Positioned(
                          right:MediaQuery.of(context).size.width*(31.69/800),
                          top: MediaQuery.of(context).size.height * (29.98/360),
                          child:InkWell(
                            onTap: () {
                              // On va changer le code aprési
                            },
                            onHover: (value){
                              if(value){
                                setState(() {
                                  col=const Color.fromRGBO(192, 36, 97, 1);
                                });
                              }else{
                                setState(() {
                                  col= const Color.fromRGBO(232,69,96,1) ;
                                });
                              }
                            },
                            child: CustomContainer(
                              colorTop:const  Color.fromRGBO(232,69,96,1),
                              widthContainer: MediaQuery.of(context).size.width * 0.04875,
                              heightContainer: MediaQuery.of(context).size.width * 0.04875,
                              icon:Icons.question_mark,
                            ),
                          ),
                        ),
                        const SizedBox(height: 30,),
                        IndicationThrowGarbage(choix: choixBonus, plusOrMinus: plusOrMinus,),
                      ],
                    ),
                  ),
                ],
              )

          ],
        ),
      ),
    );
  }
}


