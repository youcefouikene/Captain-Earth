import 'package:flutter/material.dart';
import'../Widgets/RectangleButton.dart';
class AjouterProfil extends StatefulWidget {
  const AjouterProfil({super.key});

  @override
  State<AjouterProfil> createState() => _AjouterProfilState();
}

class _AjouterProfilState extends State<AjouterProfil> {
         IconData  icone=Icons.music_note; 

  @override
  Widget build(BuildContext context) {
    double wid=MediaQuery.of(context).size.width;
    double het=MediaQuery.of(context).size.height;
    return  Scaffold(
      backgroundColor:const Color.fromRGBO(158, 231, 251, 1) ,
      body: Stack(children: [
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
     
        Positioned(
          top:het*120/360,
          left:wid*600/800,
          child: Image.asset(
            'assets/images/Captain_hi.png',
            width: wid*136.35/800,
            height: het*214.29/360,
            ),
          ),
         Stack(children: [
          Positioned(
            left:wid*157/800,
            top:het*63/360,
            child: Container(
                        width:wid*408/800 ,
                        height: het*217/360,
                        decoration: BoxDecoration(
                          color:const  Color.fromRGBO(255, 255, 255, 1),
                          borderRadius: BorderRadius.circular(wid*52/800),
                          border: Border.all(
                            color:const Color.fromRGBO(64, 142, 64, 1),
                            width: wid*3/800,
                          ),
                        ),
                        
                      ),
          ),
          Positioned(
                          top:het* 82/360,
                          left: wid*249/800,
                          child: Text("Nouveau profil",
                          style: TextStyle(fontFamily: "Atma",
                         fontSize: wid*30/800,
                         color:const Color.fromRGBO(19, 78, 73, 1),
                         fontWeight: FontWeight.w700,
                          ),
                        )),
          Positioned(
            top: het*168/360,
            left: wid*189/800,
            child: Container(
              width: wid*347/800,
              height: het*39/360,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(wid*9/800),
                color: Color.fromRGBO(238, 236, 235, 1),
              ),
              //cette sera completer apres 
              // normalement la methode de travail est dans le code de Wassim 
              child :Row(
                children: [
                  Icon(Icons.usb_rounded),
                  SizedBox(width: wid*47/800),
                  Text("Donner le nom"),
                ],
              ),
          )),
          Positioned(
            left: wid*301/800,
            top:het*259/360,
           child:RectangleButton(
                text: "LOGIN",
                pourcentage1: 164/800, 
                pourcentage2: 39/360, 
                pourcentage3:0.0 ,
                pourcentageFont:24/800, 
                pourcentageRaduis:10/800),
           
          ),
        ]),
      ],),


    );

  }
}