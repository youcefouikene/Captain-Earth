import 'package:flutter/material.dart';

import '../Widgets/CustomContainer.dart';
import 'Map.dart';
class ChoisirProfil extends StatefulWidget {
  const ChoisirProfil({super.key});

  @override
  State<ChoisirProfil> createState() => _ChoisirProfilState();
}

class _ChoisirProfilState extends State<ChoisirProfil> {
  @override
  Widget build(BuildContext context) {
       IconData  _icone=Icons.music_note; //attribut de la classe 
         double wid=MediaQuery.of(context).size.width;
        double het=MediaQuery.of(context).size.height;
    return Scaffold(
    backgroundColor:Color.fromRGBO(158, 231, 251, 1),
    body: Stack(
      children: [
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
              ),
             ),
               Positioned(
                left: wid*(313/800),
                top:het*(53/360),
                child:Text(
                  "CHOISIR UN PROFIL",
                  style:TextStyle(
                    color: Color(0xff135617),
                    fontFamily: 'Atma',
                    fontSize: wid*(33/800),
                    fontWeight: FontWeight.w700,
            
                  ),
                )
                 ),
                 Positioned(
                  left: wid*(228/800),
                  top:het*(146/360),

                  child: Row(
                  children: [
                    Container(
                            width: wid*(117/800),
                            height: wid*(117/800),
                            decoration: BoxDecoration(
                             shape: BoxShape.circle,
                              color: Color.fromARGB(255, 219, 205, 207),
                              border: Border.all(
                               color: Color(0xff135617),
                               ),
                               ),
                          ),
                          SizedBox(width: wid*(107.33/800),),

                          Container(
                            width: wid*(117/800),
                            height: wid*(117/800),
                            decoration: BoxDecoration(
                             shape: BoxShape.circle,
                              color: Color.fromARGB(255, 219, 205, 207),
                              border: Border.all(
                               color: Color(0xff135617),
                               ),
                               ),
                          ),
                          
                    
                  ],
                 ))
      ],
    ),
    );
  }
}