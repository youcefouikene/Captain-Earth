import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'Map.dart';
import '../Widgets/CustomContainer.dart';
import '../Widgets/PointBar.dart';
import 'JouerQuiz.dart';
import '../Widgets/ChooseBoxgame.dart';
import '../Widgets/Iconbutton.dart';
class ChooseGamePage extends StatefulWidget {

  final String pathBackGround;
   int? EtoilesQuiz;
   int? EtoilesJeu;
  final Widget pageJeu;


 
  @override
  State<ChooseGamePage> createState() => _ChooseGamePageState();

   ChooseGamePage({
    required this.pathBackGround,
    required this.EtoilesJeu,
    required this.EtoilesQuiz,
    required this.pageJeu,
    Key? key,
  }) : super(key: key);

  String getPathBackGround(){
    return pathBackGround;
  }
  int getEtoilesQuiz(){
    return EtoilesQuiz!;
  }
  int getEtoilesjeu(){
    return  EtoilesJeu!;
  }
    void setEtoilesQuiz(int score){
    EtoilesQuiz=score;
  }
    void setEtoilesJeu(int score){
     EtoilesJeu=score;
  }
  
}

class _ChooseGamePageState extends State<ChooseGamePage> {
  Color? col=const Color.fromRGBO(232,69,96,1);
      IconData  icone=Icons.music_note; //attribut de la classe 

  @override
  Widget build(BuildContext context) {
     

    final Size screenSize = MediaQuery.of(context).size;
    final double screenWidth = screenSize.width;
    final double screenHeight = screenSize.height;

    return Scaffold(
     
     body: Container(
            decoration: BoxDecoration(
          image: DecorationImage( 
            image: AssetImage(widget.getPathBackGround()),
            fit: BoxFit.cover,
          ),
        ),

        width: screenWidth,
        height: screenHeight,
        child: Center(
          child:Stack(
            children: [
              

              Positioned(
                left: screenWidth*(91.95/800),
                top:screenHeight*(137.43/360),
                child:Row(
                children: [
                  Container(
                     child: GestureDetector(
                      onTap: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (_) {
                              return JouerQuiz();
                            },
                          ),
                        );
                      },
                      child: ChooseBoxgame(
                        text: "Quiz",
                         pourcentage1:(241/800),
                          pourcentage2:(161/360),
                           pourcentage3:0,
                            pourcentageFont: (49/800),
                             pourcentageRaduis:(40/800),
                              TextFont: 'Atma', 
                              TextColor: Colors.black, 
                              Stars:2,
                              ),
                               ), ),

                  SizedBox(width: screenWidth*(119/800),),
                  Container(
                     child: GestureDetector(
                      onTap: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (_) {
                              return JouerQuiz();
                            },
                          ),
                        );
                      },
                      child: ChooseBoxgame(
                        text: "Jouer",
                         pourcentage1: (241/800),
                          pourcentage2:(161/360),
                           pourcentage3:0,
                            pourcentageFont:(49/800),
                             pourcentageRaduis: (40/800),
                              TextFont: 'Atma', 
                              TextColor: Colors.black, 
                              Stars: 1), 
                              ),
                               ),
                             ],
              ), 
              ),
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
        SizedBox(height: MediaQuery.sizeOf(context).width*(12/360),),
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
        ),
      ),
    );
  }
}
