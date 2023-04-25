import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../Widgets/CustomContainerText.dart';
import '../widgets/RectangleButton.dart';
import 'Map.dart';
import '../Widgets/Start.dart';

class WelcomePage extends StatefulWidget {
  
  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
    Color? col= Color.fromRGBO(232,69,96,1);

   @override
  Widget build(BuildContext context) {
    double? wid=( MediaQuery.of(context).size.width);
        double? hei=( MediaQuery.of(context).size.height);
        return Scaffold(
       backgroundColor:Color.fromRGBO(158, 231, 251, 1),
        
        body: SafeArea(
          child: 
         Container(
          child: Stack(children: [
            Positioned(
                 left:wid*(76/800),
                 top:hei*(29/360),
                 child: Start(
                  width: (407/800)*wid,
                  height:(247/360)*hei ,
                  borderColor: Color(0xff135617) ,
                  contextColor: Color(0xffffffff) ,
                  text: "Salut Champion, je suis\n captain earth ensemble on\n sauvera la planete contre la\n pollution Etês vous prêts ?",
                  textColor: Colors.black,
                  ), 
            ), 

            Positioned(
                   top:hei*(18/360),
                   left: wid*(539/800),
                   child:Container( 
                   child:SvgPicture.asset(
                   "assets/images/avatarWelcome.svg",
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
                      RectangleButton(
                        text: "JOUER",
                        pourcentage1:(134/800) ,
                        pourcentage2:  (39/360),
                        pourcentage3: (32/360),
                        pourcentageFont:(24/800) ,
                        pourcentageRaduis: (10/800),
                      ),
                      SizedBox(width:(153/800)*wid),
                      RectangleButton(
                        text: "S'INSCRIRE",
                        pourcentage1:(156/800),
                        pourcentage2:  (39/360),
                        pourcentage3: (32/360),
                        pourcentageFont:(24/800) ,
                        pourcentageRaduis: (10/800),
                      ),
                    ],
                  ),
                ),
             /* Positioned( 
                  top:hei*(289/360),
                  left: wid*(60/800),
                  child: Row(
                  children: [
                     InkWell(
                      onTap: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (_) {
                              return Map();
                            },
                          ),
                        );
                      },
                      onHover: (value){
                        if(value){
                           setState(() {
                           col=Color.fromRGBO(192, 36, 97, 1);
                        });
                        }else{
                           setState(() {
                           col= Color.fromRGBO(232,69,96,1) ;
                        });
                        } },
                      
                      child: CustomContainerText(
                        colorTop:col!,
                       
                        widthContainer:(134/800)*wid,
                        heightContainer: (39/360)* hei,
                        texte: "JOUER",
                        colorText: Colors.white,
                      ),
                    ),
                     SizedBox(width:(153/800)*wid),

                      InkWell(
                      onTap: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (_) {
                              return Map();
                            },
                          ),
                        );
                      },
                      onHover: (value){
                        if(value){
                           setState(() {
                           col=Color.fromRGBO(152, 5, 61, 1);
                        });
                        }else{
                           setState(() {
                           col= Color.fromRGBO(232,69,96,1) ;
                        });
                        } },
                      child:CustomContainerText(
                        colorTop: col!,
                          widthContainer:(156/800)*wid,
                           heightContainer: (39/360)*hei,
                           texte: "S'INSCRIRE", 
                           colorText: Colors.white),
                    ),
                  ],
                 ), 
              ),*/
            ]
          ),
        ),
      ), 
    );
    
  }
}
