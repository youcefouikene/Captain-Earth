import 'package:flutter/material.dart';

class YesGagnant extends StatefulWidget {
  const YesGagnant({super.key});

  @override
  State<YesGagnant> createState() => _YesGagnantState();
}

class _YesGagnantState extends State<YesGagnant> {
       IconData  icone=Icons.music_note; 

  @override
  Widget build(BuildContext context) {
    double wid=MediaQuery.of(context).size.width;
    double het=MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor:const Color.fromRGBO(158, 231, 251, 1),
      body: Stack(
        children: [
           Positioned(
                left:wid*253/800,
                top: het*73/360,
                child: Image.asset("assets/images/trophet.png",
                  width:wid*246/800 ,
                  height:wid*246/800,
                ),
                ),

          Positioned(top:het*74/360,left:wid*565/800,
           child: Image.asset("assets/images/Captainjumping.png",
           width:wid*215/800,
           height:het*242.04/360,
           )),
           //NOUVEAU MODEL 
    //----------------------------------------------
    Positioned(
          left:MediaQuery.of(context).size.width*(29/800),
          top: MediaQuery.of(context).size.height*(30/360) ,
          child: Column(
          children: [
          Stack(
            alignment: Alignment.center,
            children: [
              Container(
             width: MediaQuery.of(context).size.width * 39/800,
             height: MediaQuery.of(context).size.width * 39/800,
             decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: const Color(0xFFE84560),
              border: Border.all(
                color:const Color(0xff752683),
                width: 2,
              ),
             ),
            ),
           IconButton(
                    onPressed: (){
                       setState((){
                          if(icone==Icons.music_note){
                                icone=Icons.music_off;
                              }else{
                                icone=Icons.music_note;
                              }
                        }
                        );
                      },
            icon: Icon(icone),
           iconSize: MediaQuery.of(context).size.width * 29/800,
           color: const Color.fromARGB(255, 255, 255, 255),
          ) , 
          ]
          ),
        SizedBox(height: wid*(12/360),),
       Stack(
            alignment: Alignment.center,

            children: [
              Container(
             width: MediaQuery.of(context).size.width * 39/800,
             height: MediaQuery.of(context).size.width * 39/800,
             decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: const Color(0xFFE84560),
              border: Border.all(
                color:const Color(0xff752683),
                width: 2,
              ),
            ),
             ),
                  IconButton(
                    onPressed: (){ },
              icon:const Icon(Icons.close),
             iconSize: MediaQuery.of(context).size.width * 29/800,
            color: const Color.fromARGB(255, 255, 255, 255),
            ) , ]
          ),
        //autre container 
      ],
    ),
    ),
        ],
      ),
    );
  }
}