import 'dart:math';
import 'package:flutter/material.dart';
import 'package:projet_2cp/constants.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:projet_2cp/constants.dart';
import 'package:projet_2cp/settings.dart';
class TrohpyPage extends StatefulWidget {
  final int choixTrophe;
  TrohpyPage(this.choixTrophe,{super.key});

  @override
  State<TrohpyPage> createState() => _TrohpyPageState();
}

class _TrohpyPageState extends State<TrohpyPage> {


       IconData  _icone=Icons.music_note; 

       AudioPlayer player = AudioPlayer();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    backgroundPlayerMap.playMusic();
  }

  @override
  void dispose() {
    player.stop();
    super.dispose();
  }

  Future<void> playAudio() async {
    await player.play(AssetSource('sound.mp3'));
  }

  
        List<String> trophes=[
        'assets/trophy/trophy_0.png',
        'assets/trophy/trophy_1.png',
        'assets/trophy/trophy_2.png',
        'assets/trophy/trophy_3.png'
       ];
  @override
  Widget build(BuildContext context) {
    double wid=MediaQuery.of(context).size.width;
    double het=MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor:const Color.fromRGBO(158, 231, 251, 1),
      body:Row(
          children: [
            Padding(
              padding: EdgeInsets.only(
                top: MediaQuery.of(context).size.height * (30 / 360),
               left: MediaQuery.of(context).size.width * (29 / 800),
              ),
              child:  Column(
              children: [
                Stack(
                  alignment: Alignment.center,
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width * (39 / 800),
                      height: MediaQuery.of(context).size.width * (39 / 800),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: const Color(0xFFE84560),
                        border: Border.all(
                          color: const Color(0xff752683),
                          width: 2,
                        ),
                      ),
                    ),
                    IconButton(
                      onPressed: () {
                        if(kSound){
                          setState(() {
                            kSound = false;
                            backgroundPlayerMap.stopMusic();
                          });
                        }else{
                          setState(() {
                            kSound = true;
                            backgroundPlayerMap.playMusic();
                          });
                        }
                      },
                      icon: Icon(iconeTypeFunction()),
                      iconSize: MediaQuery.of(context).size.width * (25 / 800),
                      color: const Color.fromARGB(255, 255, 255, 255),
                    ),
                  ],
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * (5 / 360),
                ),
                Stack(
                  alignment: Alignment.center,
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width * (40 / 800),
                      height: MediaQuery.of(context).size.width * (40 / 800),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: const Color(0xFFE84560),
                        border: Border.all(
                          color: const Color(0xff752683),
                          width: 2,
                        ),
                      ),
                    ),
                    IconButton(
                      onPressed: () {
                        backgroundPlayerMap.stopMusic();
                        backgroundPlayerMap.playMusic();
                        Navigator.pop(context);
                      },
                      icon: const Icon(Icons.close_rounded),
                      iconSize: MediaQuery.of(context).size.width * (30 / 800),
                      color: const Color.fromARGB(255, 255, 255, 255),
                    ),
                  ],
                ),
              ],
            ),
            ),
           Padding(
             padding:  EdgeInsets.only(
              left:wid*(204)/800,top: het*22/360,),
             child: Column(
              children:[
                Text(
                "Félicitations",
                style: TextStyle(
                      color: const Color(0xff135617),
                      //fontFamily: "Atma",
                      fontSize: wid * 46 / 800,
                      fontWeight: FontWeight.w700,
                      ),
              ),
              SizedBox(height: het*15/360,),
              Image.asset(
               trophes[widget.choixTrophe],
               width: wid *  172.08 / 800,
               height: het *237/360,
              ),
              ]
             ),
           ),
          Padding(
           padding: EdgeInsets.fromLTRB(wid*44/800, het*74/360,0, 0),
           child: Image.asset(
            "assets/Captain_jumping.png",
            width: wid * 201 / 800,
            height: het * 226.28 / 360,
          ),),
           
        
        ]),
      );
  }
}