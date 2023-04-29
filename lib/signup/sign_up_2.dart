import 'package:flutter/material.dart';
import '../widgets/shapes/avatar_container.dart';

class SignUp2 extends StatelessWidget {
  double screenWidth;
  double screenHeight;
  SignUp2({required this.screenWidth, required this.screenHeight, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width:  double.infinity,
        height: double.infinity,
        padding: EdgeInsets.fromLTRB((99/800)*screenWidth, (28/360)*screenHeight, (18/800)*screenWidth, (22/360)*screenHeight ),
        decoration: const BoxDecoration (
          color:  Color.fromRGBO(158, 231, 251, 1),
        ),

        child: Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              width:  (529/800) * screenWidth,
              height:  (310/360) * screenHeight,
              child:
              Container(
                padding: EdgeInsets.symmetric( horizontal: (31 / 800) * screenWidth ),
                decoration:  BoxDecoration (
                  borderRadius:  BorderRadius.circular((52/360) * screenHeight),
                  border:  Border.all(color: const Color.fromRGBO(51, 129, 74, 1), style: BorderStyle.solid, width: (3/800) * screenWidth),
                  color:  Colors.white,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Text(
                      'Choisir un avatar pour',
                      style: TextStyle(
                        fontFamily: 'Atma',
                        fontSize: (230/800)*100,
                        fontWeight: FontWeight.w700,
                        color: Color.fromRGBO(19, 78, 73, 1)
                      ),
                    ),
                    const Text(
                      'votre enfant',
                      style: TextStyle(
                        fontFamily: 'Atma',
                          fontSize: (230/800)*100,
                        fontWeight: FontWeight.w700,
                          color: Color.fromRGBO(19, 78, 73, 1)
                      ),
                    ),
                    SizedBox(height: (10/360) * screenHeight,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        GestureDetector(
                          child: AvatarContainer(shapeWidth: 77.97, shapeHeight: 77.97, avatarNumber: 1,),
                          onTap: (){},
                        ),
                        GestureDetector(
                          child: AvatarContainer(shapeWidth: 77.97, shapeHeight: 77.97, avatarNumber: 2,),
                          onTap: (){},
                        ),
                        GestureDetector(
                          child: AvatarContainer(shapeWidth: 77.97, shapeHeight: 77.97, avatarNumber: 3,),
                          onTap: (){},
                        ),
                        GestureDetector(
                          child: AvatarContainer(shapeWidth: 77.97, shapeHeight: 77.97, avatarNumber: 4,),
                          onTap: (){},
                        ),
                      ],
                    ),
                    SizedBox(height: (18/360) * screenHeight,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        GestureDetector(
                          child: AvatarContainer(shapeWidth: 77.97, shapeHeight: 77.97, avatarNumber: 5,),
                          onTap: (){},
                        ),
                        GestureDetector(
                          child: AvatarContainer(shapeWidth: 77.97, shapeHeight: 77.97, avatarNumber: 6,),
                          onTap: (){},
                        ),
                        GestureDetector(
                          child: AvatarContainer(shapeWidth: 77.97, shapeHeight: 77.97, avatarNumber: 7,),
                          onTap: (){},
                        ),
                        GestureDetector(
                          child: AvatarContainer(shapeWidth: 77.97, shapeHeight: 77.97, avatarNumber: 8,),
                          onTap: (){},
                        ),
                      ],
                    ),
                  ],
                )
              ),
            ),
            SizedBox(width: (24/800) * screenWidth,),
            Image.asset('assets/avatar/captain_earth_standing.png',)
          ],
        )
      ),
    );
  }
}
