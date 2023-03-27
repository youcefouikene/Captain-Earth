import 'package:flutter/material.dart';
import 'package:projet2cp/Widgets/BoxInfo.dart';
import '../Widgets/CustomContainer.dart';
import '../Widgets/BoxInfo.dart';
import '../Widgets/CustomContainerText.dart';
import 'Map.dart';

class Profil extends StatefulWidget {
  const Profil({super.key});

  @override
  State<Profil> createState() => _ProfilState();
}

class _ProfilState extends State<Profil> {
   IconData  _icone=Icons.music_note; //attribut de la classe 

  @override
  Widget build(BuildContext context) {
    double wid=MediaQuery.of(context).size.width;
        double het=MediaQuery.of(context).size.height;

    return Scaffold(
             backgroundColor:Color.fromRGBO(158, 231, 251, 1),
      body: Stack(children: [
        Positioned(
          left: wid*(47/800),
          top:het*(28/360),
          child: Container(
            width:wid*(706/800),
            height: het*((301*2+60)/800),
            decoration: BoxDecoration(
             color: Color(0xffffffff),
              borderRadius: BorderRadius.circular(wid*(42/800)),
              border: Border.all(
             color: Color(0xff135617),
              width: 3,
          ),
            ),
        )),
        Positioned(
                left:MediaQuery.of(context).size.width*(76/800),
                top: MediaQuery.of(context).size.height*(56/360) ,
                child:Column(
                children: [
                GestureDetector(
                  
                      onTap: () {
                        //quand on tape on change l'etat de notre page 
                        //c'est pour ça il faut la mettre statefull 
                        //alors, une fois le boutton tape on change l'etat en changeant l'icone
                        setState((){
                          if(_icone==Icons.music_note){
                                _icone=Icons.music_off;
                              }else{
                                _icone=Icons.music_note;
                              }
                        }
                        );
                      },
                      child: CustomContainer(
                        colorTop: Color.fromRGBO(232,69,96,1), 
                         widthContainer: MediaQuery.of(context).size.width * 0.04875,//56.0, 
                         heightContainer: MediaQuery.of(context).size.width * 0.04875,//56.0,
                         icon: _icone,
                          ), 
                    ),
                    SizedBox(height: wid*(12/360),),
                    GestureDetector(
                      onTap: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (_) {
                              return Map();//aller au map car on a cliquer sur le botton 
                            },
                          ),
                        );
                      },
                      child: CustomContainer(
                        colorTop: Color.fromRGBO(232,69,96,1), 
                         widthContainer: MediaQuery.of(context).size.width * 0.04875,//56.0, 
                         heightContainer: MediaQuery.of(context).size.width * 0.04875,//56.0,
                         icon:Icons.map_outlined), 
                    ),
              ],
              ),),
              Positioned(
                left: wid*(343/800),
                top:het*(45/360),
                child:Text(
                  "Profil",
                  style:TextStyle(
                    color: Color(0xff135617),
                    fontFamily: 'Atma',
                    fontSize: wid*(29/800),
                    fontWeight: FontWeight.w700,
            
                  ),
                )
                 ),
                 Positioned(
                  left: wid*(682/800),
                  top: het*(55/360),
                  child: GestureDetector(
                      onTap: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (_) {
                              return Map();//aller au map car on a cliquer sur le botton 
                            },
                          ),
                        );
                      },
                      child: CustomContainer(
                        colorTop: Color.fromRGBO(232,69,96,1), 
                         widthContainer: MediaQuery.of(context).size.width * 0.04875,//56.0, 
                         heightContainer: MediaQuery.of(context).size.width * 0.04875,//56.0,
                         icon:Icons.close), 
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
                              color: Color.fromARGB(255, 219, 205, 207),
                              border: Border.all(
                               color: Color(0xff135617),
                               ),
                               ),
                          ),),
                          SizedBox(height: het*(20/360),),
                          Positioned(
                            child: BoxInfo(
                            bordercolor:Color.fromARGB(255, 219, 205, 207),
                             contentcolor: Color.fromARGB(255, 219, 205, 207), 
                             element: Row(
                              children: [
                                Icon(
                                  Icons.account_box,
                                  color: Color(0xff135617),
                                  size: wid*(16/800),
                                  ),
                                  SizedBox(width: wid*(13/800),),
                                  Text(
                                    "Nom: ",
                                    style: TextStyle(
                                      fontFamily: 'Atma',
                                      fontSize: wid*(18/800),
                                      fontWeight:FontWeight.w700,
                                      color:  Color(0xff135617),
                                    ),
                                  ),
                                  SizedBox(width: wid*(34/800),),
                                  Text(
                                    " Fatima",
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
                            bordercolor:Color.fromARGB(255, 219, 205, 207),
                             contentcolor: Color.fromARGB(255, 219, 205, 207), 
                             element: Row(
                              children: [
                                 Image( image: AssetImage('assets/images/laf.png'), ),
                                  SizedBox(width: wid*(13/800),),
                                  Text(
                                    "Score: ",
                                    style: TextStyle(
                                      fontFamily: 'Atma',
                                      fontSize: wid*(18/800),
                                      fontWeight:FontWeight.w700,
                                      color:  Color(0xff135617),
                                    ),
                                  ),
                                   SizedBox(width: wid*(34/800),),

                                  Text(
                                    " 150",//apres une variable 
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
                            bordercolor: Color(0xff135617),
                            contentcolor:Colors.white, 

                             element:Center(
                               
                               child:  Text(
                                    " Acquesition",
                                    style: TextStyle(
                                      fontFamily: 'Atma',
                                      fontSize: wid*(24/800),
                                      fontWeight: FontWeight.w500,
                                      color: Colors.black,
                                    ),
                                  ),

                              
                             )
                             ),),
                             SizedBox(height: het*(26/360),),
                             Positioned(
                            child:BoxInfo(
                            bordercolor: Color(0xff135617),
                             contentcolor:Colors.white, 
                             element: Center(
                               
                                 child:Text(
                                    " Défi",
                                    style: TextStyle(
                                      fontFamily: 'Atma',
                                      fontSize: wid*(24/800),
                                      fontWeight: FontWeight.w500,
                                      color: Colors.black,
                                    ),
                                  ),

                              
                             )
                             ),),
                            SizedBox(height: het*(26/360),),

                              Positioned(
                            child: BoxInfo(
                            bordercolor: Color(0xff135617),
                            contentcolor:Colors.white, 

                             element: Center(
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
                             ),),

                        ],

                    )
        ),
        Positioned(
          left: wid*(312/800),
          top: het*(304/360),
          child:GestureDetector(
                  
                      onTap: () {
                       
                      },
                      child: CustomContainerText(
                        colorTop: Color.fromRGBO(232,69,96,1), 
                         widthContainer: wid*(175/800), 
                         heightContainer: het*(39/360),
                         colorText: Colors.white,
                         texte: "DECONNEXION",
                          ), 
                    ),
          ),


      ],)
    );
  }
}