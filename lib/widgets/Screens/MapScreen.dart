import 'package:flutter/material.dart';
import '../stations/locked_station/locked_station.dart';
import '../stations/unlocked_stations/unlock_station_1.dart';
import '../stations/unlocked_stations/unlock_station_2.dart';
import '../stations/unlocked_stations/unlock_station_3.dart';
import '../stations/unlocked_stations/unlock_station_4.dart';
import '../stations/unlocked_stations/unlock_station_5.dart';
import '../stations/unlocked_stations/unlock_station_6.dart';
import '../shapes/custom_container.dart';
import '../shapes/point_bar.dart';

class MapScreen extends StatefulWidget {
  double screenWidth;
  double screenHeight;

  MapScreen({required this.screenWidth, required this.screenHeight, super.key});

  @override
  State<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  double _screenWidth = 0;
  double _screenHeight = 0;
  double paddingValue = 0;

  IconData  _icone=Icons.music_note;
  Color col= const Color.fromRGBO(232,69,96,1);
  Color col2= const Color.fromRGBO(232,69,96,1);


  @override
  void initState() {
     super.initState();
     _screenWidth = widget.screenWidth;
     _screenHeight = widget.screenHeight;
  }

  @override
  Widget build(BuildContext context) {
    (_screenWidth != null) ? paddingValue =  0.015 * _screenWidth : 14;
    return Scaffold(
      body: SizedBox(
        width: double.infinity,
        height: double.infinity,
          child: Stack(
            fit: StackFit.expand,
            children: [
              // importing the background image
              Image.asset('assets/images/map-image.png', fit: BoxFit.cover,),
              // using the buttons
              Positioned(
                left: 0.0375 * _screenWidth,
                  top: 0.08 * _screenHeight,
                child: Column(
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

                      SizedBox(height: MediaQuery.of(context).size.height*(18/360),),

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
                          icon: Icons.person,
                        ),
                      ),
                    ],
                ),
              ),
              Positioned(
                  right: 0.024 * _screenWidth,
                  top: 0.056 * _screenHeight,
                  child: PointBar(score: 509),
              ),
              Positioned(
                right: 0.02 * _screenWidth,
                bottom: 0.10 * _screenHeight,
                child: Image.asset('assets/avatar/captain_earth_standing.png', width: 0.1287 * _screenWidth,),
              ),
              Positioned(
                bottom:0.214 * _screenHeight,
                right: 0.23 * _screenWidth,
                child: CustomPaint(
                  size: Size(0.039 * _screenWidth, (0.039 * _screenWidth *1.0714285714285714).toDouble()),
                  painter: UnlockedFirstStation(nbrStarsObtained: 0),
                ),
              ),
              Positioned(
                top:0.4 * _screenHeight,
                right: 0.481 * _screenWidth,
                child: CustomPaint(
                  size: Size(0.039 * _screenWidth, (0.039 * _screenWidth *1.0714285714285714).toDouble()),
                  painter: LockedContinent(),
                ),
              ),
              Positioned(
                top:0.195 * _screenHeight,
                right: 0.505 * _screenWidth,
                child: CustomPaint(
                  size: Size(0.039 * _screenWidth, (0.039 * _screenWidth *1.0714285714285714).toDouble()),
                  painter: LockedContinent(),
                ),
              ),
              Positioned(
                top:0.228 * _screenHeight,
                left: 0.21 * _screenWidth,
                child: CustomPaint(
                  size: Size(0.039 * _screenWidth, (0.039 * _screenWidth *1.0714285714285714).toDouble()),
                  painter: LockedContinent(),
                ),
              ),
              Positioned(
                bottom:0.30 * _screenHeight,
                left: 0.295 * _screenWidth,
                child: CustomPaint(
                  size: Size(0.039 * _screenWidth, (0.039 * _screenWidth *1.0714285714285714).toDouble()),
                  painter: LockedContinent(),
                ),
              ),
            ]
          ),
        ),
    );
  }
}
