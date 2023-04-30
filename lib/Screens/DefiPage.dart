import 'package:flutter/material.dart';
import '../Screens/Defis/DefiArrosageScreen/screenArrosage.dart';
import '../Screens/Defis/DefiClean/ScereenClean.dart';
import '../Screens/Defis/DefiVelo/ScreenVelo.dart';
import '../Screens/Defis/DefieProtectionEscargot/ScreenShoe.dart';
import '../Screens/Defis/defiEau/screenEau.dart';
import '../Screens/Defis/defiEnergie/screenSwitch.dart';
import '../Widgets/DefiContainer.dart';
import '../Widgets/CustomContainer.dart';

class Defi extends StatefulWidget {
  const Defi({super.key});

  @override
  State<Defi> createState() => _DefiState();
}

class _DefiState extends State<Defi> {
  IconData _icone = Icons.music_note;

  @override
  Widget build(BuildContext context) {
    double wid = MediaQuery.of(context).size.width;
    double het = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: const Color.fromRGBO(158, 231, 251, 1),
      body: Stack(children: [
        Positioned(
          top: het * 25 / 360,
          left: wid * 354 / 800,
          child: Text(
            "Défis",
            style: TextStyle(
              color: const Color(0xff134E49),
              fontFamily: "Atma",
              fontSize: wid * 38 / 800,
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
        Positioned(
          top: het * 110 / 360,
          left: wid * 187 / 800,
          child: Column(children: [
            Row(children: [
              //les defis devront etre apres comme des boutons pour acceder à la page d'un defi donne
              DefiConatainer(
                pathImage: 'assets/images/badges/eco.png',
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => screenSwitch(),
                      ));
                },
              ),
              SizedBox(width: wid * 33 / 800),
              DefiConatainer(
                pathImage: 'assets/images/badges/water.png',
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => screenArrosage(),
                      ));
                },
              ),
              SizedBox(width: wid * 33 / 800),
              DefiConatainer(
                pathImage: 'assets/images/badges/planet.png',
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ScreenClean(),
                      ));
                },
              ),
            ]),
            SizedBox(height: het * 35 / 360),
            Row(children: [
              DefiConatainer(
                pathImage: 'assets/images/badges/koala.png',
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => screenShoe(),
                      ));
                },
              ),
              SizedBox(width: wid * 33 / 800),
              DefiConatainer(
                pathImage: 'assets/images/badges/planet2.png',
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => screenVelo(),
                      ));
                },
              ),
              SizedBox(width: wid * 33 / 800),
              DefiConatainer(
                pathImage: 'assets/images/badges/robinet.png',
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => screenEau(),
                      ));
                },
              ),
            ]),
          ]),
        ),
        //NOUVEAU MODEL
        //----------------------------------------------
        Positioned(
          top: MediaQuery.of(context).size.height * (30 / 360),
          left: MediaQuery.of(context).size.width * (29 / 800),
          child: Column(
            children: [
              Container(
                  child: Stack(
                alignment: Alignment.center,
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width * (39 / 800),
                    height: MediaQuery.of(context).size.width * (39 / 800),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Color(0xFFE84560),
                      border: Border.all(
                        color: Color(0xff752683),
                        width: 2,
                      ),
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                      setState(() {
                        if (_icone == Icons.music_note) {
                          _icone = Icons.music_off;
                        } else {
                          _icone = Icons.music_note;
                        }
                      });
                    },
                    icon: Icon(_icone),
                    iconSize: MediaQuery.of(context).size.width * (20 / 800),
                    color: Color.fromARGB(255, 255, 255, 255),
                  ),
                ],
              )),
              SizedBox(
                height: MediaQuery.of(context).size.height * (12 / 360),
              ),
              Container(
                  child: Stack(
                alignment: Alignment.center,
                children: [
                  Container(
                    //margin: EdgeInsets.only(bottom: 12.0),
                    width: MediaQuery.of(context).size.width * (39 / 800),
                    height: MediaQuery.of(context).size.width * (39 / 800),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Color(0xFFE84560),
                      border: Border.all(
                        color: Color(0xff752683),
                        width: 2,
                      ),
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: Icon(Icons.close_rounded),
                    iconSize: MediaQuery.of(context).size.width * (25 / 800),
                    color: Color.fromARGB(255, 255, 255, 255),
                  ),
                ],
              )),
            ],
          ),
        ),
        /*Positioned(
                left:MediaQuery.of(context).size.width*(29/800),
                top: MediaQuery.of(context).size.height*(30/360) ,
                child:Column(
                children: [
                InkWell(
                   onTap: () {
                        
                        setState((){
                          if(_icone==Icons.music_note){
                                _icone=Icons.music_off;
                              }else{
                                _icone=Icons.music_note;
                              }
                        }
                        );
                      },
                       onHover: (value){
                        if(value){
                           setState(() {
                           col=const Color.fromRGBO(192, 36, 97, 1);
                        });
                        }else{
                           setState(() {
                           col=const Color.fromRGBO(232,69,96,1) ;
                        });
                        } },
                      child: CustomContainer(
                        colorTop:col!, 
                         widthContainer: MediaQuery.of(context).size.width * 0.04875,//56.0, 
                         heightContainer: MediaQuery.of(context).size.width * 0.04875,//56.0,
                         icon: _icone,
                          ), 
                      
                    ),
                    SizedBox(height: wid*(12/360),),
                    InkWell(
                      onTap: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (_) {
                              return Map();//aller au map car on a cliquer sur le botton 
                            },
                          ),
                        );
                      },
                       onHover: (value){
                        if(value){
                           setState(() {
                           col=const Color.fromRGBO(192, 36, 97, 1);
                        });
                        }else{
                           setState(() {
                           col=const Color.fromRGBO(232,69,96,1) ;
                        });
                        } },
                      child: CustomContainer(
                        colorTop:col!, 
                         widthContainer: MediaQuery.of(context).size.width * 0.04875,//56.0, 
                         heightContainer: MediaQuery.of(context).size.width * 0.04875,//56.0,
                         icon:Icons.map_outlined), 
                    ),
              ],
              ),
             ),*/
      ]),
    );
  }
}
