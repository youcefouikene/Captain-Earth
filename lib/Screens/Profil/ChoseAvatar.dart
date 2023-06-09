// import 'package:flutter/material.dart';
// import '../../try.dart';
// import '../../Widgets/AvatarContainer.dart';

// class ChoseAvatar extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     double screenWidth = MediaQuery.of(context).size.width;
//     double screenHeight = MediaQuery.of(context).size.height;
//     return Scaffold(
//       body: Container(
//           width: double.infinity,
//           height: double.infinity,
//           padding: EdgeInsets.fromLTRB(
//               (99 / 800) * screenWidth,
//               (28 / 360) * screenHeight,
//               (18 / 800) * screenWidth,
//               (22 / 360) * screenHeight),
//           decoration: const BoxDecoration(
//             color: Color.fromRGBO(158, 231, 251, 1),
//           ),
//           child: Row(
//             crossAxisAlignment: CrossAxisAlignment.end,
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               SizedBox(
//                 width: (529 / 800) * screenWidth,
//                 height: (310 / 360) * screenHeight,
//                 child: Container(
//                     padding: EdgeInsets.symmetric(
//                         horizontal: (31 / 800) * screenWidth),
//                     decoration: BoxDecoration(
//                       borderRadius:
//                           BorderRadius.circular((52 / 360) * screenHeight),
//                       border: Border.all(
//                           color: const Color.fromRGBO(51, 129, 74, 1),
//                           style: BorderStyle.solid,
//                           width: (3 / 800) * screenWidth),
//                       color: Colors.white,
//                     ),
//                     child: Column(
//                       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                       crossAxisAlignment: CrossAxisAlignment.center,
//                       children: [
//                         Column(
//                           children: const [
//                             Text(
//                               'Choisir un avatar pour',
//                               style: TextStyle(
//                                   fontFamily: 'Atma',
//                                   fontSize: (230 / 800) * 100,
//                                   fontWeight: FontWeight.w700,
//                                   color: Color.fromRGBO(19, 78, 73, 1)),
//                             ),
//                             Text(
//                               'votre enfant',
//                               style: TextStyle(
//                                   fontFamily: 'Atma',
//                                   fontSize: (230 / 800) * 100,
//                                   fontWeight: FontWeight.w700,
//                                   color: Color.fromRGBO(19, 78, 73, 1)),
//                             ),
//                           ],
//                         ),
//                         Column(
//                           children: [
//                             Row(
//                               mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                               children: [
//                                 AvatarContainer(
//                                     avatarNumber: 1,
//                                     onTapCallback: () {
//                                       Navigator.push(
//                                           context,
//                                           MaterialPageRoute(
//                                               builder: (context) => tryi()));
//                                     }),
//                                 AvatarContainer(
//                                     avatarNumber: 2,
//                                     onTapCallback: () {
//                                       Navigator.push(
//                                           context,
//                                           MaterialPageRoute(
//                                               builder: (context) => tryi()));
//                                     }),
//                                 AvatarContainer(
//                                     avatarNumber: 3,
//                                     onTapCallback: () {
//                                       Navigator.push(
//                                           context,
//                                           MaterialPageRoute(
//                                               builder: (context) => tryi()));
//                                     }),
//                                 AvatarContainer(
//                                     avatarNumber: 4,
//                                     onTapCallback: () {
//                                       Navigator.push(
//                                           context,
//                                           MaterialPageRoute(
//                                               builder: (context) => tryi()));
//                                     }),
//                               ],
//                             ),
//                             SizedBox(
//                               height: (18 / 360) * screenHeight,
//                             ),
//                             Row(
//                               mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                               children: [
//                                 AvatarContainer(
//                                     avatarNumber: 5,
//                                     onTapCallback: () {
//                                       Navigator.push(
//                                           context,
//                                           MaterialPageRoute(
//                                               builder: (context) => tryi()));
//                                     }),
//                                 AvatarContainer(
//                                     avatarNumber: 6,
//                                     onTapCallback: () {
//                                       Navigator.push(
//                                           context,
//                                           MaterialPageRoute(
//                                               builder: (context) => tryi()));
//                                     }),
//                                 AvatarContainer(
//                                     avatarNumber: 7,
//                                     onTapCallback: () {
//                                       Navigator.push(
//                                           context,
//                                           MaterialPageRoute(
//                                               builder: (context) => tryi()));
//                                     }),
//                                 AvatarContainer(
//                                     avatarNumber: 8,
//                                     onTapCallback: () {
//                                       Navigator.push(
//                                           context,
//                                           MaterialPageRoute(
//                                               builder: (context) => tryi()));
//                                     }),
//                               ],
//                             ),
//                           ],
//                         ),
//                       ],
//                     )),
//               ),
//               SizedBox(
//                 width: (24 / 800) * screenWidth,
//               ),
//               Image.asset(
//                 'assets/images/avatar/captain_earth_hi.png',
//                 width: screenWidth * (129 / 800),
//                 fit: BoxFit.fitWidth,
//               )
//             ],
//           )),
//     );
//   }
// }

import 'package:flutter/material.dart';
import '../../backend/synchronization.dart';
import '../../constants.dart';
import '../../try.dart';
import '../../Widgets/AvatarContainer.dart';

class ChoseAvatar extends StatefulWidget {
  @override
  State<ChoseAvatar> createState() => _ChoseAvatarState();
}

class _ChoseAvatarState extends State<ChoseAvatar> {
  @override
  void initState() {
    super.initState();
    //loadStations();
    backgroundPlayerMap.playMusic();
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Container(
          width: double.infinity,
          height: double.infinity,
          padding: EdgeInsets.fromLTRB(
              (99 / 800) * screenWidth,
              (28 / 360) * screenHeight,
              (18 / 800) * screenWidth,
              (22 / 360) * screenHeight),
          decoration: const BoxDecoration(
            color: Color.fromRGBO(158, 231, 251, 1),
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                width: (529 / 800) * screenWidth,
                height: (310 / 360) * screenHeight,
                child: Container(
                    padding: EdgeInsets.symmetric(
                        horizontal: (31 / 800) * screenWidth),
                    decoration: BoxDecoration(
                      borderRadius:
                          BorderRadius.circular((52 / 360) * screenHeight),
                      border: Border.all(
                          color: const Color.fromRGBO(51, 129, 74, 1),
                          style: BorderStyle.solid,
                          width: (3 / 800) * screenWidth),
                      color: Colors.white,
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Column(
                          children: const [
                            Text(
                              'Choisir un avatar pour',
                              style: TextStyle(
                                  fontFamily: 'Atma',
                                  fontSize: (230 / 800) * 100,
                                  fontWeight: FontWeight.w700,
                                  color: Color.fromRGBO(19, 78, 73, 1)),
                            ),
                            Text(
                              'votre enfant',
                              style: TextStyle(
                                  fontFamily: 'Atma',
                                  fontSize: (230 / 800) * 100,
                                  fontWeight: FontWeight.w700,
                                  color: Color.fromRGBO(19, 78, 73, 1)),
                            ),
                          ],
                        ),
                        Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                AvatarContainer(
                                    avatarNumber: 1,
                                    onTapCallback: () {
                                      changeAvatar("guest", 1);
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) => tryi()));
                                    }),
                                AvatarContainer(
                                    avatarNumber: 2,
                                    onTapCallback: () {
                                      changeAvatar("guest", 2);
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) => tryi()));
                                    }),
                                AvatarContainer(
                                    avatarNumber: 3,
                                    onTapCallback: () {
                                      changeAvatar("guest", 3);
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) => tryi()));
                                    }),
                                AvatarContainer(
                                    avatarNumber: 4,
                                    onTapCallback: () {
                                      changeAvatar("guest", 4);
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) => tryi()));
                                    }),
                              ],
                            ),
                            SizedBox(
                              height: (18 / 360) * screenHeight,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                AvatarContainer(
                                    avatarNumber: 5,
                                    onTapCallback: () {
                                      changeAvatar("guest", 5);
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) => tryi()));
                                    }),
                                AvatarContainer(
                                    avatarNumber: 6,
                                    onTapCallback: () {
                                      changeAvatar("guest", 6);
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) => tryi()));
                                    }),
                                AvatarContainer(
                                    avatarNumber: 7,
                                    onTapCallback: () {
                                      changeAvatar("guest", 7);
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) => tryi()));
                                    }),
                                AvatarContainer(
                                    avatarNumber: 8,
                                    onTapCallback: () {
                                      changeAvatar("guest", 8);
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) => tryi()));
                                    }),
                              ],
                            ),
                          ],
                        ),
                      ],
                    )),
              ),
              SizedBox(
                width: (24 / 800) * screenWidth,
              ),
              Image.asset(
                'assets/images/avatar/captain_earth_hi.png',
                width: screenWidth * (129 / 800),
                fit: BoxFit.fitWidth,
              )
            ],
          )),
    );
  }
}
