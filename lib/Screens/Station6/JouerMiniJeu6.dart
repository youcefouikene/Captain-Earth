import 'package:flutter/material.dart';
import 'flipcardgame.dart';
import 'data.dart';
import '../../Widgets/ChooseBoxgame.dart';
import '../JouerQuiz.dart';
import '../Map.dart';

class JouerMiniJeu6 extends StatefulWidget {
  @override
  _JouerMiniJeu6State createState() => _JouerMiniJeu6State();
}

class _JouerMiniJeu6State extends State<JouerMiniJeu6> {
        IconData  icone=Icons.music_note; //attribut de la classe 

  @override
  Widget build(BuildContext context) {
    final size =MediaQuery.of(context).size;
    final wid=size.width;
    final het=size.height;
     final Size screenSize = MediaQuery.of(context).size;
    final double screenWidth = screenSize.width;
    final double screenHeight = screenSize.height;
    return Scaffold(
     
     body: Container(
            decoration: BoxDecoration(
          image: DecorationImage( 
            image: AssetImage('projet2cp/assets/forest.png'),
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
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (BuildContext context) => FlipCardGane(Level.Medium),
                            ));
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

  List<Widget> genratestar(int? no) {
   double wid=MediaQuery.of(context).size.width;
    List<Widget> _icons = [];
    for (int i = 0; i < no!; i++) {
      _icons.insert(
          i,
          Icon(
            Icons.star,
            color: Colors.yellow,
            size: wid*20/800,
          ));
    }
    return _icons;
  }
}

class Details {
  String? name;
  Color? primarycolor;
  Color? secomdarycolor;
  Widget? goto;
  int? noOfstar;

  Details(
      {this.name,
      this.primarycolor,
      this.secomdarycolor,
      this.noOfstar,
      this.goto});
}

List<Details> _list = [
  
  Details(
      name: "MOYEN",
      primarycolor: Colors.orange,
      secomdarycolor: Colors.orange[300],
      noOfstar: 2,
      goto: FlipCardGane(Level.Medium)),

];
