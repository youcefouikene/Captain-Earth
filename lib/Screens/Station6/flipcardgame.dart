import 'package:flip_card/flip_card.dart';
import 'package:flutter/material.dart';
import 'data.dart';
import 'dart:async';
import '../../Widgets/PointBar.dart';
import '../../Widgets/PointBarTime.dart';

class FlipCardGane extends StatefulWidget {
  final Level _level;
  FlipCardGane(this._level);
  @override
  _FlipCardGaneState createState() => _FlipCardGaneState(_level);
}

class _FlipCardGaneState extends State<FlipCardGane> {
 IconData  icone=Icons.music_note; //attribut de la classe 
  _FlipCardGaneState(this._level);
  int _previousIndex = -1;
  bool _flip = false;
  bool _start = false;
  bool _wait = false;
  Level? _level;
  Timer? _timer;
  int _time = 5;
  int? _left;
  int _score=0;
  bool? _isFinished;
  List<dynamic> ? _data;
  List<bool>? _cardFlips;
  List<GlobalKey<FlipCardState>>? _cardStateKeys;

  Widget getItem(int index) {
   
    return Container(
      decoration: BoxDecoration(
          color: Colors.grey[100],
          boxShadow: [
            BoxShadow(
              color: Colors.black45,
              blurRadius: 3,
              spreadRadius: 0.8,
              offset: Offset(2.0, 1),
            )
          ],
          borderRadius: BorderRadius.circular(5)),
      margin: EdgeInsets.all(4.0),
      child: Image.asset(_data![index]),
    );
  }
  startTimer() {
    _timer = Timer.periodic(Duration(seconds: 1), (t) {
      setState(() {
        _time = _time - 1;
      });
    });
  }

  void restart() {
    startTimer();
    _data =getSourceArray(
      _level!,
    );
    _cardFlips = getInitialItemState(_level!);
    _cardStateKeys = getCardStateKeys(_level!);
    _time = 5;
    _left = (_data!.length ~/ 2);
    int _score=0;
    _isFinished = false;
    Future.delayed(const Duration(seconds: 6), () {
      setState(() {
        _start = true;
        _timer!.cancel();
      });
    });
  }

  @override
  void initState() {
    super.initState();

    restart();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
        final size=MediaQuery.of(context).size;
       final wid=size.width;
       final het=size.height;
        final PaddingWidht=size.width;
    return _isFinished!
        ? Scaffold(
          //ici plus tard on affichera la page Excellent ou bien etc 
          
            body: Container(
              decoration:BoxDecoration(
                 image:DecorationImage( image:AssetImage("assets/forest.png"),
                 fit:BoxFit.cover,),
                 ),
              child: Center(
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      _score=0;
                      restart();
                    });
                  },
                  child: _score<=5 
                  ?
                  Container(
                    height: 50,
                    width: 200,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.circular(24),
                    ),
                    child: Text(
                      "Replay Echec",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 17,
                          fontWeight: FontWeight.w500),
                    ),
                  ): (5< _score && _score<15)
                    ?Container(
                    height: 50,
                    width: 200,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.circular(24),
                    ),
                    child: Text(
                      "Replay   Bien",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 17,
                          fontWeight: FontWeight.w500),
                    ),
                   ) : Container(
                    height: 50,
                    width: 200,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.circular(24),
                    ),
                    child: Text(
                      "Replay Excellent",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 17,
                          fontWeight: FontWeight.w500),
                    ),
                  )

                ),
              ),
            ),
          )
        : Scaffold(
            body: Container(
              width: size.width,
              height: size.height,
              decoration:BoxDecoration(
                 image:DecorationImage( image:AssetImage("assets/forest.png"),
                 fit:BoxFit.cover,),
                 ),
              child: SafeArea(
                child:  Stack(
                  children: [
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
        SizedBox(height: wid*(12/360),),
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
                    onPressed: (){ },
              icon:const Icon(Icons.close),
             iconSize: MediaQuery.of(context).size.width * 29/800,
            color: const Color.fromARGB(255, 255, 255, 255),
            ) , ]
          ),
        //autre container 
      ],
    ),
    ),
    
                    SingleChildScrollView(
                      child: Column(
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.only(top:1.0,bottom: 1.0,left: 5.0),
                            child: _time > 0
                                ? PointBarTime(score: _time)
                                :PointBar(score: _score)
                          ),
                          Padding(
                            padding: const EdgeInsets.all(4.0),
                            child: GridView.builder(
                              shrinkWrap: true,
                              physics: NeverScrollableScrollPhysics(),
                              padding: EdgeInsets.only(left: PaddingWidht*0.15,right: PaddingWidht*0.15),
                              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                                
                                crossAxisCount: 4,
                                crossAxisSpacing: 10,
                                mainAxisSpacing: 10,
                                mainAxisExtent: size.height*0.22,
                                
                              ),
                              itemBuilder: (context, index) => _start
                                  ? FlipCard(
                                      key: _cardStateKeys![index],
                                      onFlip: () {
                                        if (!_flip) {
                                          _flip = true;
                                          _previousIndex = index;
                                        } else {
                                          _flip = false;
                                          if (_previousIndex != index) {
                                            if (_data![_previousIndex] !=
                                                _data![index]) {
                                              _wait = true;
                                              Future.delayed(
                                                  const Duration(milliseconds: 1500),
                                                  () {
                                                _cardStateKeys![_previousIndex]
                                                    .currentState!
                                                    .toggleCard();
                                                _previousIndex = index;
                                                _cardStateKeys![_previousIndex]
                                                    .currentState!
                                                    .toggleCard();
            
                                                Future.delayed(
                                                    const Duration(milliseconds: 160),
                                                    () {
                                                  setState(() {
                                                    _wait = false;
                                                      _score -=2;
                                                    
                                                  });
                                                });
                                              });
                                            } else {
                                              _cardFlips![_previousIndex] = false;
                                              _cardFlips![index] = false;
                                              print(_cardFlips);
            
                                              setState(() {
                                                _left = _left! -1;
                                                _score +=5;
                                              });
                                              if (_cardFlips!
                                                  .every((t) => t == false)) {
                                                print("Won");
                                                Future.delayed(
                                                    const Duration(milliseconds: 160),
                                                    () {
                                                  setState(() {
                                                    _isFinished = true;
                                                    _start = false;
                                                  });
                                                });
                                              }
                                            }
                                          }
                                        }
                                        setState(() {});
                                      },
                                      flipOnTouch: _wait ? false : _cardFlips![index],
                                      direction: FlipDirection.HORIZONTAL,
                                      front: Container(
                                        decoration: BoxDecoration(
                                            color: Colors.grey,
                                            borderRadius: BorderRadius.circular(5),
                                            boxShadow: [
                                              BoxShadow(
                                                color: Colors.black45,
                                                blurRadius: 3,
                                                spreadRadius: 0.8,
                                                offset: Offset(2.0, 1),
                                              )
                                            ]),
                                        margin: EdgeInsets.all(4.0),
                                        child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Image.asset(
                                            "assets/animalspics/quest.png",
                                          ),
                                        ),
                                      ),
                                      back: getItem(index))
                                  : getItem(index),
                              itemCount: _data!.length,
                            ),
                          ),
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
