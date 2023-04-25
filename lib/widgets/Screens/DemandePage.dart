import 'package:flutter/material.dart';
import '../shapes/custom_container_text.dart';
import '../shapes/custom_container.dart';

class DemandePage extends StatefulWidget {
  double screenWidth;
  double screenHeight;
  DemandePage({required this.screenWidth, required this.screenHeight, Key? key}) : super(key: key);

  @override
  State<DemandePage> createState() => _DemandePageState();
}

class _DemandePageState extends State<DemandePage> {
  late final double _screenWidth = widget.screenWidth;
  late final double _screenHeight = widget.screenHeight;

  IconData  _icone=Icons.music_note;
  Color col= const Color.fromRGBO(232,69,96,1);
  Color col2= const Color.fromRGBO(232,69,96,1);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding:  EdgeInsets.only(left: (29 / 800)*_screenWidth, top: (24 / 360) * _screenHeight),
        width:  double.infinity,
        decoration: const BoxDecoration (
          color:  Color.fromRGBO(158, 231, 251, 1),
        ),
        child: Stack(
          children: [
            Column(
              children: [
                InkWell(
                  onTap: () {
                    setState((){
                      if(_icone==Icons.music_note){
                        _icone=Icons.music_off;
                      }else{
                        _icone=Icons.music_note;
                      }},
                    );
                  },
                  onHover: (value){
                    if(value){
                      setState(() {
                        col=const Color.fromRGBO(192, 36, 97, 1);
                      });
                    }else{
                      setState(() {
                        col= const Color.fromRGBO(232,69,96,1) ;
                      });
                    } },
                  child: CustomContainer(
                    colorTop:const  Color.fromRGBO(232,69,96,1),
                    widthContainer: MediaQuery.of(context).size.width * 0.04875,
                    heightContainer: MediaQuery.of(context).size.width * 0.04875,
                    icon: _icone,
                  ),
                ),

                SizedBox(height: MediaQuery.of(context).size.height*(24/360),),

                InkWell(
                  onTap: () {},
                  onHover: (value){
                    if(value){
                      setState(() {
                        col2=const Color.fromRGBO(192, 36, 97, 1);
                      });
                    }else{
                      setState(() {
                        col2= const Color.fromRGBO(232,69,96,1) ;
                      });
                    } },
                  child: CustomContainer(
                    colorTop:const  Color.fromRGBO(232,69,96,1),
                    widthContainer: MediaQuery.of(context).size.width * 0.04875,
                    heightContainer: MediaQuery.of(context).size.width * 0.04875,
                    icon: Icons.close_sharp,
                  ),
                ),
              ],
            ),
            Positioned(
              left: (127/800) * _screenWidth,
              right: (227/800) * _screenWidth,
              top: (55/360) * _screenHeight,
              bottom: (67/360) * _screenHeight,
              child:
              SizedBox(
                width:  (446/800) * _screenWidth,
                height:  (228/360) * _screenHeight,
                child:
                Container(
                  //padding: EdgeInsets.only( top: (42 / 360) * _screenHeight ),
                  decoration:  BoxDecoration (
                    borderRadius:  BorderRadius.circular(0.065 * _screenWidth),
                    border:  Border.all(color: const Color.fromRGBO(51, 129, 74, 1), style: BorderStyle.solid, width: (5/800) * _screenWidth),
                    color:  Colors.white,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const Text(
                        'Avez-vous déja un',
                        style: TextStyle(
                          fontSize: (260/800)*100,
                          fontFamily: 'Atma',
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      const Text(
                        'compte ?',
                        style: TextStyle(
                          fontSize: (260/800)*100,
                          fontFamily: 'Atma',
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      SizedBox(height: (10/360) * _screenHeight,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          GestureDetector(
                              onTap: (){},
                              child: CustomContainerText(colorTop: const Color.fromRGBO(232, 69, 96, 1), widthContainer:(82/800) * _screenWidth , heightContainer: (49/360)*_screenHeight, texte: 'OUI', colorText: Colors.white)
                          ),
                          GestureDetector(
                              onTap: (){},
                              child: CustomContainerText(colorTop: const Color.fromRGBO(232, 69, 96, 1), widthContainer:(82/800) * _screenWidth , heightContainer: (49/360)*_screenHeight, texte: 'NON', colorText: Colors.white)
                          ),
                      ],),
                    ],
                  )
                ),
              ),
            ),
            Positioned(
              bottom: (20.77 / 360)* _screenHeight,
              right: (50 / 800) * _screenWidth,
              child: Image.asset('assets/avatar/captain_question_1.png', width: 0.174 * _screenWidth,),
            ),
          ],
        ),
      ),
    );
  }
}

