import 'package:flutter/material.dart';
import 'package:projet2cp/Widgets/BoxInfo.dart';
import 'package:projet2cp/Widgets/RectangleButton.dart';
import 'Map.dart';
import 'Classement.dart';
import 'AcquisitionPage.dart';
import 'Defi.dart';
class Profil extends StatefulWidget {
  String? username;
  String? pathPhoto;
  int? score=0;
  int ptOcianie=0;
  int ptAsie=0;
  int ptAfrique=0;
  int ptEurope=0;
  int ptAmeriqueNord=0;
  int ptAmeriqueSud=0;
  //constructeur
    Profil({
    required this.username,
    required this.pathPhoto,
    this.score,
    Key? key,}) : super(key: key);

      String getUserName(){
      return  username ?? '';
    }
    String getPathPhoto(){
      return  pathPhoto ?? '';
    }
    int getScore(){
      return score ??0;
    }
    void addPtOcianie(int pt){
      ptOcianie=ptOcianie+pt;
    }

    void addPtAsie(int pt){
      ptAsie=ptAsie+pt;
    }
        void addPtAfrique(int pt){
      ptAfrique=ptAfrique+pt;
    }
        void addPtEurope(int pt){
      ptEurope=ptEurope+pt;
    }
       void addPtAmeriqueN(int pt){
      ptAmeriqueNord=ptAmeriqueNord+pt;
    } 
     void addPtAmeriqueS(int pt){
      ptAmeriqueSud=ptAmeriqueSud+pt;
    } 

  @override
  State<Profil> createState() => _ProfilState();
}

class _ProfilState extends State<Profil> {
   IconData  icone=Icons.music_note;
   Color? col= const Color.fromRGBO(232,69,96,1) ; //attribut de la classe 
  
   void incrementScore(int add) {
    setState(() {
      widget.score = widget.score! + add;
    });
  }

  //decrement score
  void decrementScore(int sub) {
    setState(() {
      widget.score = widget.score! - sub;
    });
  }

  @override
  Widget build(BuildContext context) {
    double wid=MediaQuery.of(context).size.width;
    double het=MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor:const Color.fromRGBO(158, 231, 251, 1),
      body: Stack(children: [
        Positioned(
          left: wid*(47/800),
          top:het*(28/360),
          child: Container(
            width:wid*(706/800),
            height: het*((301*2+60)/800),
            decoration: BoxDecoration(
             color:const Color(0xffffffff),
              borderRadius: BorderRadius.circular(wid*(42/800)),
              border: Border.all(
             color:const  Color(0xff135617),
              width: 3,
          ),
            ),
        )),
        Positioned(
          left:MediaQuery.of(context).size.width*(76/800),
          top: MediaQuery.of(context).size.height*(56/360) ,
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
                    onPressed: (){ 
                      Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (_) {
                              return const Map();//aller au map car on a cliquer sur le botton 
                            },
                          ),
                        );
                    },
              icon:const Icon(Icons.map_outlined),
             iconSize: MediaQuery.of(context).size.width * 29/800,
            color: const Color.fromARGB(255, 255, 255, 255),
            ) , ]
          ),
        //autre container 
      ],
    ),
    ),
              Positioned(
                left: wid*(343/800),
                top:het*(45/360),
                child:Text(
                  "Profil",
                   style:TextStyle(
                    color: const Color(0xff135617),
                    fontFamily: 'Atma',
                    fontSize: wid*(29/800),
                    fontWeight: FontWeight.w700,
            
                  ),
                )
                 ),
                 Positioned(
                  left: wid*(682/800),
                  top: het*(55/360),
                   child: Stack(
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
                        Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (_) {
                                return const Map();//aller au map temporairemetn apres on devra mettre une fonction permetant de quitter l'application 
                              },
                            ),
                          );
                      },
                               icon:const Icon(Icons.close),
                              iconSize: MediaQuery.of(context).size.width * 29/800,
                             color: const Color.fromARGB(255, 255, 255, 255),
                             ) , ]
                           ),
                 ),
                
                    Positioned(
                     left: wid*(136/800),
                      top:het*(72/360),
                      child: Column(
                        children: [
                          Positioned(
                            
                            child: Container(
                            width: wid*(89/800),
                            height: wid*(89/800),
                            decoration: BoxDecoration(
                             shape: BoxShape.circle,
                              border: Border.all(
                                width: (2/800)*wid,
                               color:const Color(0xff135617),
                               ),
                               ),
                             child: CircleAvatar(
                               backgroundImage: AssetImage(widget.getPathPhoto()),
                               ),
                               ),),

                          SizedBox(height: het*(20/360),),

                          Positioned(
                            child: BoxInfo(
                            bordercolor:const Color.fromARGB(255, 219, 205, 207),
                             contentcolor:const Color.fromARGB(255, 219, 205, 207), 
                             element: Row(
                              children: [
                                Icon(
                                  Icons.account_box,
                                  color:const Color(0xff135617),
                                  size: wid*(16/800),
                                  ),
                                  SizedBox(width: wid*(13/800),),
                                  Text(
                                    "Nom: ",
                                    style: TextStyle(
                                      fontFamily: 'Atma',
                                      fontSize: wid*(18/800),
                                      fontWeight:FontWeight.w700,
                                      color: const Color(0xff135617),
                                    ),
                                  ),
                                  SizedBox(width: wid*(34/800),),
                                  Text(
                                    widget.getUserName(),
                                    style: TextStyle(
                                      fontFamily: 'Atma',
                                      fontSize: wid*(18/800),
                                      fontWeight: FontWeight.w600,
                                      color: Colors.black,
                                    ),
                                  ),

                              ],
                             )
                             ),),
                             SizedBox(height: het*(15/360),),
                             Positioned(
                            child: BoxInfo(
                            bordercolor:const Color.fromARGB(255, 219, 205, 207),
                             contentcolor: const Color.fromARGB(255, 219, 205, 207), 
                             element: Row(
                              children: [
                                 const Image( image: AssetImage('assets/images/laf.png'), ),
                                  SizedBox(width: wid*(13/800),),
                                  Text(
                                    "Score: ",
                                    style: TextStyle(
                                      fontFamily: 'Atma',
                                      fontSize: wid*(18/800),
                                      fontWeight:FontWeight.w700,
                                      color: const  Color(0xff135617),
                                    ),
                                  ),
                                   SizedBox(width: wid*(34/800),),

                                  Text(
                                   (widget.getScore()).toString(),//apres une variable 
                                    style: TextStyle(
                                      fontFamily: 'Atma',
                                      fontSize: wid*(18/800),
                                      fontWeight: FontWeight.w600,
                                      color: Colors.black,
                                    ),
                                  ),

                              ],
                             )
                             ),)

                        ],

                    )),

                     Positioned(
                     left: wid*(504/800),
                      top:het*(116/360),
                      child: Column(
                        children: [
                        Positioned(
                            child: BoxInfo(
                            bordercolor:const  Color(0xff135617),
                            contentcolor:Colors.white, 
                             element:Center(
                               
                               child: GestureDetector(
                                onTap: () {
                                   Navigator.of(context).push(
                                    MaterialPageRoute(
                                      builder: (_) {
                                        return AcquisitionPage(
                                          ptOcianie: widget.ptOcianie,
                                           ptAsie: widget.ptAsie, 
                                           ptAfrique: widget.ptAfrique,
                                            ptEurope:widget. ptEurope, 
                                            ptAmeriqueNord: widget.ptAmeriqueNord,
                                             ptAmeriqueSud: widget.ptAmeriqueSud);},),);
                                },
                                child:  Text(
                                    " Acquesition",
                                    style: TextStyle(
                                      fontFamily: 'Atma',
                                      fontSize: wid*(24/800),
                                      fontWeight: FontWeight.w500,
                                      color: Colors.black,
                                    ),
                                  ),
                               ),
                                ),
                             ),),

                             SizedBox(height: het*(26/360),),
                             Positioned(
                            child:BoxInfo(
                            bordercolor:const Color(0xff135617),
                             contentcolor:Colors.white, 
                             element: Center(
                               
                                 child:GestureDetector(
                                  onTap: () {
                                   Navigator.of(context).push(
                                    MaterialPageRoute(
                                      builder: (_) {
                                        return Defi();
                                             },
                                             ),
                                             ); },
                                  child: Text(
                                    " Défi",
                                    style: TextStyle(
                                      fontFamily: 'Atma',
                                      fontSize: wid*(24/800),
                                      fontWeight: FontWeight.w500,
                                      color: Colors.black,
                                    ),
                                  ),
                                 )

                              
                             )
                             ),),
                            SizedBox(height: het*(26/360),),

                              Positioned(
                            child: BoxInfo(
                            bordercolor: Color(0xff135617),
                            contentcolor:Colors.white, 

                             element: Center(
                               child: GestureDetector(
                                onTap: () {
                                   Navigator.of(context).push(
                                    MaterialPageRoute(
                                      builder: (_) {
                                        return Classement();
                                             },
                                             ),
                                             ); },
                                child:  Text(
                                    " Classement",
                                    style: TextStyle(
                                      fontFamily: 'Atma',
                                      fontSize: wid*(24/800),
                                      fontWeight: FontWeight.w500,
                                      color: Colors.black,
                                    ),
                                  ),
                               )

                              
                             )
                             ),),

                        ],

                    )
        ),
        Positioned(
          left: wid*(312/800),
          top: het*(304/360),
          child:RectangleButton(
            text: "DECONNEXION", 
            pourcentage1:(175/800),
             pourcentage2: (39/360), 
             pourcentage3: (17/360), 
             pourcentageFont: (21/800),
              pourcentageRaduis: (10/800),
       
          ),),


      ],)
    );
  }
}