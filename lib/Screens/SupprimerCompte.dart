import 'Map.dart';
import '../Widgets/CustomContainer.dart';
import 'package:flutter/material.dart';
import '../Widgets/RectangleButton.dart';
class SupprimerCompte extends StatefulWidget {
  const SupprimerCompte({super.key});

  @override
  State<SupprimerCompte> createState() => _SupprimerCompteState();
}

class _SupprimerCompteState extends State<SupprimerCompte> {
    IconData?  icone=Icons.music_note; //attribut de la classe 

  @override
  Widget build(BuildContext context) {
    double wid=MediaQuery.of(context).size.width;
    double het=MediaQuery.of(context).size.height;
    return Scaffold(
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
          top:het*166/360,
          left:wid*569/800,
          child: Image.asset('assets/images/CaptainCraying.png',width: wid*210/800,height: het*146.97/360,)),
        Stack(children: [
          Positioned(
            left:wid*121/800,
            top:het*65/360,
            child: Container(
                        width:wid*446/800 ,
                        height: het*228/360,
                        decoration: BoxDecoration(
                          color:const  Color.fromRGBO(255, 255, 255, 1),
                          borderRadius: BorderRadius.circular(wid*74/800),
                          border: Border.all(
                            color:const Color.fromRGBO(64, 142, 64, 1),
                            width: wid*5/800,
                          ),
                        ),
                      ),
          ),
          Positioned(
            left: wid*218/800,
            top:het*93/360,
            child: Text(
            "Voulez-vous vraiment\n supprimer le profil?",
            style: TextStyle(
              color:const Color.fromRGBO(0, 0, 0,1),
              fontFamily: 'Atma',
              fontSize: wid*30/800,
              fontWeight:FontWeight.w500,
            ),
          ),),
          Positioned(
            left: wid*173/800,
            top:het*225/360,
            child: Row(
            children: [
                 RectangleButton(
                  text: "ANNULER",
                   pourcentage1: 137/800, 
                   pourcentage2: 39/360, 
                   pourcentage3:0.0 ,
                    pourcentageFont:24/800, 
                    pourcentageRaduis:10/800),
              
             const SizedBox(width: 42/800,),
              RectangleButton(
                text: "SUPPRIMER",
                pourcentage1: 164/800, 
                pourcentage2: 39/360, 
                pourcentage3:0.0 ,
                pourcentageFont:24/800, 
                pourcentageRaduis:10/800),
              
            ],
          ))
        ]),
      ],),


    );
  }
}