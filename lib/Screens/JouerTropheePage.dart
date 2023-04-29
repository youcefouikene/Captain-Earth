// import "package:flutter/material.dart";
// import '../Widgets/RectangleButton.dart';

// class Jouer extends StatefulWidget {
//   const Jouer({super.key});

//   @override
//   State<Jouer> createState() => _JouerState();
// }

// class _JouerState extends State<Jouer> {
//   IconData icone = Icons.music_note;

//   @override
//   Widget build(BuildContext context) {
//     double wid = MediaQuery.of(context).size.width;
//     double het = MediaQuery.of(context).size.height;

//     return Scaffold(
//       backgroundColor: const Color.fromRGBO(158, 231, 251, 1),
//       body: Stack(
//         children: [
//           Positioned(
//             top: het * 55 / 360,
//             left: wid * 164 / 800,
//             child: Container(
//               width: wid * 395 / 800,
//               height: het * 223.58 / 360,
//               decoration: BoxDecoration(
//                 color: const Color.fromRGBO(217, 217, 217, 1),
//                 borderRadius: BorderRadius.circular(wid * 44 / 800),
//                 border: Border.all(
//                   color: const Color.fromRGBO(19, 78, 73, 1),
//                   width: wid * 3 / 800,
//                 ),
//               ),
//               child: Positioned(
//                   left: wid * 280.26 / 800,
//                   top: het * 89.28 / 360,
//                   child: Image.asset(
//                     "assets/images/trophetGris.png",
//                     width: wid * 159.49 / 800,
//                     height: wid * 159.49 / 800,
//                   )),
//             ),
//           ),
//           Positioned(
//               top: het * 114 / 360,
//               left: wid * 576 / 800,
//               child: Image.asset(
//                 "assets/images/Captainstanding.png",
//                 width: wid * 130 / 800,
//                 height: het * 231.26 / 360,
//               )),
//           Positioned(
//               left: wid * 296 / 800,
//               top: het * 298 / 360,
//               child: RectangleButton(
//                   text: "JOUER",
//                   pourcentage1: 134 / 800,
//                   pourcentage2: 39 / 360,
//                   pourcentage3: 0.0,
//                   pourcentageFont: 24 / 800,
//                   pourcentageRaduis: 10 / 800)),

//           //NOUVEAU MODEL
//           //----------------------------------------------
//           Positioned(
//             left: MediaQuery.of(context).size.width * (29 / 800),
//             top: MediaQuery.of(context).size.height * (30 / 360),
//             child: Column(
//               children: [
//                 Stack(alignment: Alignment.center, children: [
//                   Container(
//                     width: MediaQuery.of(context).size.width * 39 / 800,
//                     height: MediaQuery.of(context).size.width * 39 / 800,
//                     decoration: BoxDecoration(
//                       shape: BoxShape.circle,
//                       color: const Color(0xFFE84560),
//                       border: Border.all(
//                         color: const Color(0xff752683),
//                         width: 2,
//                       ),
//                     ),
//                   ),
//                   IconButton(
//                     onPressed: () {
//                       setState(() {
//                         if (icone == Icons.music_note) {
//                           icone = Icons.music_off;
//                         } else {
//                           icone = Icons.music_note;
//                         }
//                       });
//                     },
//                     icon: Icon(icone),
//                     iconSize: MediaQuery.of(context).size.width * 29 / 800,
//                     color: const Color.fromARGB(255, 255, 255, 255),
//                   ),
//                 ]),
//                 SizedBox(
//                   height: wid * (12 / 360),
//                 ),
//                 Stack(alignment: Alignment.center, children: [
//                   Container(
//                     width: MediaQuery.of(context).size.width * 39 / 800,
//                     height: MediaQuery.of(context).size.width * 39 / 800,
//                     decoration: BoxDecoration(
//                       shape: BoxShape.circle,
//                       color: const Color(0xFFE84560),
//                       border: Border.all(
//                         color: const Color(0xff752683),
//                         width: 2,
//                       ),
//                     ),
//                   ),
//                   IconButton(
//                     onPressed: () {},
//                     icon: const Icon(Icons.close),
//                     iconSize: MediaQuery.of(context).size.width * 29 / 800,
//                     color: const Color.fromARGB(255, 255, 255, 255),
//                   ),
//                 ]),
//                 //autre container
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
