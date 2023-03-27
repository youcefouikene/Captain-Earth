import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../Widgets/CustomContainerText.dart';
import 'Map.dart';
import '../Widgets/Start.dart';

class WelcomePage extends StatelessWidget {
  
   @override
  Widget build(BuildContext context) {
    double? wid=( MediaQuery.of(context).size.width);
        double? hei=( MediaQuery.of(context).size.height);

                       

    return Scaffold(
       backgroundColor:Color.fromRGBO(158, 231, 251, 1),
        
        body: SafeArea(
          child: 
         Container(
            child: Container(
              child: Stack(children: [

               Positioned(
                 left:wid*(76/800),
                 top:hei*(29/360),
                 child: Start(
                  width: (407/800)*wid,
                  height:(247/360)*hei ,
                  borderColor: Color(0xff135617) ,
                  contextColor: Color(0xffffffff) ,
                  text: "HEYYYYY WELCOME TO  the \n aaaaaaaaaaaaaaaaaa\n aaaaaaaaaaaaaaaaaaaaaa",
                  textColor: Colors.black,
                  ),
               ), 

                Positioned(
                   top:hei*(18/360),
                   left: wid*(539/800),
                   child:Container( 
                   child:SvgPicture.asset(
                   // "assets/images/avatar/captain_earth_7.png",
                   "assets/images/avatarWelcome.svg",
                  //"assets/images/avatar/AvatarStart.png",
                   width:(211.25/800)*wid,
                   height:(332/360)*hei,

                    ),
                ), 
                ),
                
                
                Positioned( 
                  top:hei*(289/360),
                  left: wid*(60/800),
                  child: Row(
                  children: [
                     GestureDetector(
                      onTap: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (_) {
                              return Map();
                            },
                          ),
                        );
                      },
                      child: CustomContainerText(
                        colorTop: Color.fromRGBO(232, 69, 96, 1),
                        
                        widthContainer:0.1575*wid,
                        heightContainer: 0.108* hei,
                        texte: "Jouer",
                        colorText: Colors.white,
                      ),
                    ),


                     SizedBox(width:( MediaQuery.of(context).size.width/10)*1.5,),

                     GestureDetector(
                      onTap: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (_) {
                              return Map();
                            },
                          ),
                        );
                      },
                      child:CustomContainerText(
                        colorTop:  Color.fromRGBO(232,69,96,1), 
                          widthContainer:0.156*wid,
                           heightContainer: 0.108*hei,
                           texte: "S'inscrire", 
                           colorText: Colors.white),
                    ),
                     
                  ],
                ) 
                )
               
               
              ]
              ),
            ),
        ),
        ), 
      );
    
  }
}
