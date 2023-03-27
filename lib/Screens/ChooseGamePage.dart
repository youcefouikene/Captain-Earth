import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'Map.dart';
import '../Widgets/CustomContainer.dart';
import '../Widgets/PointBar.dart';
import 'JouerQuiz.dart';
import '../Widgets/ChooseBoxgame.dart';
class ChooseGamePage extends StatefulWidget {

  final String pathBackGround;
   int EtoilesQuiz;
   int EtoilesJeu;

 
  @override
  State<ChooseGamePage> createState() => _ChooseGamePageState();

   ChooseGamePage({
    required this.pathBackGround,
    required this.EtoilesJeu,
    required this.EtoilesQuiz,
    Key? key,
  }) : super(key: key);

  String getPathBackGround(){
    return this.pathBackGround;
  }
  int getEtoilesQuiz(){
    return this.EtoilesQuiz;
  }
  int getEtoilesjeu(){
    return this.EtoilesJeu;
  }
    void setEtoilesQuiz(int score){
    this.EtoilesQuiz=score;
  }
    void setEtoilesJeu(int score){
    this.EtoilesJeu=score;
  }
  
}

class _ChooseGamePageState extends State<ChooseGamePage> {
      IconData  _icone=Icons.music_note; //attribut de la classe 

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
                left: screenWidth*0.418,
                top: screenHeight*0.06,
                child:PointBar(score: 252),//exmple of score 
                ),
                Positioned(
                left:MediaQuery.of(context).size.width*0.033,
                top: MediaQuery.of(context).size.height*0.08 ,
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
                    SizedBox(height: screenHeight*(12/360),),
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
                              Stars: 1), ), ),
                             ],
              ), 
              ),],
          ),
        ),
      ),
    );
  }
}
