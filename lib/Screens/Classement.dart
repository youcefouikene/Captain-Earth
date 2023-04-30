// import 'package:flutter/material.dart';
// import '../Widgets/CustomContainer.dart';

// class Classement extends StatefulWidget {
//   //UNE LISTE DE PROFIL POUR FAIRE LE CLASSEMENT
//   //A DISCUTER AVEC L EQUIPE + BACKEND
//   const Classement({super.key});

//   @override
//   State<Classement> createState() => _ClassementState();
// }

// class _ClassementState extends State<Classement> {
//       IconData  icone=Icons.music_note;

//   @override
//   Widget build(BuildContext context) {
//     double wid=MediaQuery.sizeOf(context).width;
//     double het=MediaQuery.sizeOf(context).height;
//     return Scaffold(
//       backgroundColor:const Color.fromRGBO(158, 231, 251, 1),
//       body:Stack(children: [
//         //culomn of rows
//         Positioned(
//           top: het*117/360,
//           left: wid*99/800,
//           child: Column(
//             children: [
//               Row(
//                 children: [
//                   Positioned(

//                     child:Stack(
//                       alignment: Alignment.center,
//                       children: [
//                         Container(
//                       width: wid*43/800,
//                       height: wid*43/800,
//                       decoration: BoxDecoration(
//                         shape: BoxShape.circle,
//                         color:const Color.fromRGBO(244, 244, 244, 1),
//                         border: Border.all(
//                           color:const Color.fromRGBO(19,78 , 73, 1),
//                           width: wid*1/800,
//                         )
//                       ),),
//                        Text("1",style: TextStyle(
//                           fontFamily: "Atma",
//                           fontSize: wid*40/800,
//                           fontWeight:FontWeight.w700,
//                           color:const Color.fromRGBO(232, 69, 96, 1),
//                         ),),
//                       ],
//                     ),

//                   ),
//                   SizedBox(width: wid*13/800,),
//                   Positioned(
//                     top:het*116/360,
//                     child: Container(
//                       width: wid*211/800,
//                       height: wid*45/800,
//                       decoration: BoxDecoration(
//                         borderRadius: BorderRadius.circular(wid*14/800),
//                         color:const Color.fromRGBO(244, 244, 244, 1),
//                         border: Border.all(
//                           color:const Color.fromRGBO(19,78 , 73, 1),
//                           width: wid*1/800,
//                         )
//                       ),
//                       child: Text("Le nom etc"),
//                     )),

//                 ],
//               ),
//               SizedBox(height: het*29/360,),
//               Row(
//                 children: [
//                   Positioned(
//                     top: het*117/360,
//                     left: wid*99/800,
//                     child: Stack(
//                       alignment: Alignment.center,
//                       children: [
//                         Container(
//                       width: wid*43/800,
//                       height: wid*43/800,
//                       decoration: BoxDecoration(
//                         shape: BoxShape.circle,
//                         color:const Color.fromRGBO(244, 244, 244, 1),
//                         border: Border.all(
//                           color:const Color.fromRGBO(19,78 , 73, 1),
//                           width: wid*1/800,
//                         )
//                       ),),
//                        Text("2",style: TextStyle(
//                           fontFamily: "Atma",
//                           fontSize: wid*40/800,
//                           fontWeight:FontWeight.w700,
//                           color:const Color.fromRGBO(19, 78, 73, 1),
//                         ),),
//                       ],
//                     ),
//                   ),
//                   SizedBox(width: wid*13/800,),
//                   Positioned(
//                     top:het*116/360,
//                     child: Container(
//                       width: wid*211/800,
//                       height: wid*45/800,
//                       decoration: BoxDecoration(
//                         borderRadius: BorderRadius.circular(wid*14/800),

//                         color:const Color.fromRGBO(244, 244, 244, 1),
//                         border: Border.all(
//                           color:const Color.fromRGBO(19,78 , 73, 1),
//                           width: wid*1/800,
//                         )
//                       ),
//                       child: Text("Le nom etc"),
//                     )),

//                 ],
//               ),
//               SizedBox(height: het*29/360,),
//               Row(
//                 children: [
//                   Positioned(
//                     top: het*117/360,
//                     left: wid*99/800,
//                      child: Stack(
//                       alignment: Alignment.center,
//                       children: [
//                         Container(
//                       width: wid*43/800,
//                       height: wid*43/800,
//                       decoration: BoxDecoration(
//                         shape: BoxShape.circle,
//                         color:const Color.fromRGBO(244, 244, 244, 1),
//                         border: Border.all(
//                           color:const Color.fromRGBO(19,78 , 73, 1),
//                           width: wid*1/800,
//                         )
//                       ),),
//                        Text("3",style: TextStyle(
//                           fontFamily: "Atma",
//                           fontSize: wid*40/800,
//                           fontWeight:FontWeight.w700,
//                           color:const Color.fromRGBO(19, 78, 73, 1),
//                         ),),
//                       ],
//                     ),
// //-----------------------------------------------

//                   ),
//                   SizedBox(width: wid*13/800,),
//                   Positioned(
//                     top:het*116/360,
//                     child: Container(
//                       width: wid*211/800,
//                       height: wid*45/800,
//                       decoration: BoxDecoration(
//                        borderRadius: BorderRadius.circular(wid*14/800),

//                         color:const Color.fromRGBO(244, 244, 244, 1),
//                         border: Border.all(
//                           color:const Color.fromRGBO(19,78 , 73, 1),
//                           width: wid*1/800,
//                         )
//                       ),
//                       child: Text("Le nom etc"),
//                     )),

//                 ],
//               )
//             ],
//           ),
//         ),
//         Positioned(
//           left: wid*296/800,
//           top: het*25/360,
//           child: Text(
//             "Classement",
//             style: TextStyle(
//               fontFamily: "Atma",
//               fontSize: wid*38/800,
//               fontWeight: FontWeight.w700,
//               color: const Color.fromRGBO(19,78 , 73, 1),
//             ),
//           )
//         ),
//         Stack(
//             children: [
//               Positioned(
//                 top: het*149/360,
//                 left: wid*481/800,
//                 child: Container(
//                   width: wid*233/800,
//                   height: wid*160/800,
//                   decoration: BoxDecoration(
//                     color:const Color.fromRGBO(244, 244, 244, 1),
//                     borderRadius: BorderRadius.circular(wid*35/800),
//                     border: Border.all(
//                       color:const Color.fromRGBO(19,78 , 73, 1),
//                       width: wid*2/800,
//                       )
//                     ),
//                 )
//               ),
//               Positioned(
//                 top:het*100/360,
//                 left:wid*552/800,
//                 child:Container(
//                             width: wid*(84/800),
//                             height: wid*(84/800),
//                             decoration:const BoxDecoration(
//                              shape: BoxShape.circle,
//                              ),
//                              child: Image.asset(""),//mettre l'image de l'utilisateur
//                           ),
//                  ),
//             ],
//           ),
//           //NOUVEAU MODEL
//     //----------------------------------------------
//     Positioned(
//           left:MediaQuery.of(context).size.width*(29/800),
//           top: MediaQuery.of(context).size.height*(30/360) ,
//           child: Column(
//           children: [
//           Stack(
//             alignment: Alignment.center,
//             children: [
//               Container(
//              width: MediaQuery.of(context).size.width * 39/800,
//              height: MediaQuery.of(context).size.width * 39/800,
//              decoration: BoxDecoration(
//               shape: BoxShape.circle,
//               color: const Color(0xFFE84560),
//               border: Border.all(
//                 color:const Color(0xff752683),
//                 width: 2,
//               ),
//              ),
//             ),
//            IconButton(
//                     onPressed: (){
//                        setState((){
//                           if(icone==Icons.music_note){
//                                 icone=Icons.music_off;
//                               }else{
//                                 icone=Icons.music_note;
//                               }
//                         }
//                         );
//                       },
//             icon: Icon(icone),
//            iconSize: MediaQuery.of(context).size.width * 29/800,
//            color: const Color.fromARGB(255, 255, 255, 255),
//           ) ,
//           ]
//           ),
//         SizedBox(height: wid*(12/360),),
//        Stack(
//             alignment: Alignment.center,

//             children: [
//               Container(
//              width: MediaQuery.of(context).size.width * 39/800,
//              height: MediaQuery.of(context).size.width * 39/800,
//              decoration: BoxDecoration(
//               shape: BoxShape.circle,
//               color: const Color(0xFFE84560),
//               border: Border.all(
//                 color:const Color(0xff752683),
//                 width: 2,
//               ),
//             ),
//              ),
//                   IconButton(
//                     onPressed: (){ },
//               icon:const Icon(Icons.close),
//              iconSize: MediaQuery.of(context).size.width * 29/800,
//             color: const Color.fromARGB(255, 255, 255, 255),
//             ) , ]
//           ),
//         //autre container
//       ],
//     ),
//     ),
//           /*Positioned(
//                 left:MediaQuery.of(context).size.width*(29/800),
//                 top: MediaQuery.of(context).size.height*(30/360) ,
//                 child:Column(
//                 children: [
//                 InkWell(
//                    onTap: () {

//                         setState((){
//                           if(_icone==Icons.music_note){
//                                 _icone=Icons.music_off;
//                               }else{
//                                 _icone=Icons.music_note;
//                               }
//                         }
//                         );
//                       },
//                        onHover: (value){
//                         if(value){
//                            setState(() {
//                            col=const Color.fromRGBO(192, 36, 97, 1);
//                         });
//                         }else{
//                            setState(() {
//                            col=const Color.fromRGBO(232,69,96,1) ;
//                         });
//                         } },
//                       child: CustomContainer(
//                         colorTop:col,
//                          widthContainer: MediaQuery.of(context).size.width * 0.04875,//56.0,
//                          heightContainer: MediaQuery.of(context).size.width * 0.04875,//56.0,
//                          icon: _icone,
//                           ),

//                     ),
//                     SizedBox(height: wid*(12/360),),
//                     InkWell(
//                       onTap: () {
//                         Navigator.of(context).push(
//                           MaterialPageRoute(
//                             builder: (_) {
//                               return Map();//aller au map car on a cliquer sur le botton
//                             },
//                           ),
//                         );
//                       },
//                        onHover: (value){
//                         if(value){
//                            setState(() {
//                            col=const Color.fromRGBO(192, 36, 97, 1);
//                         });
//                         }else{
//                            setState(() {
//                            col=const Color.fromRGBO(232,69,96,1) ;
//                         });
//                         } },
//                       child: CustomContainer(
//                         colorTop:col!,
//                          widthContainer: MediaQuery.of(context).size.width * 0.04875,//56.0,
//                          heightContainer: MediaQuery.of(context).size.width * 0.04875,//56.0,
//                          icon:Icons.map_outlined),
//                     ),
//               ],
//               ),
//              ),*/

//       ],)
//     );
//   }
// }

import 'package:flutter/material.dart';
import '../Widgets/CustomContainer.dart';

class Classement extends StatefulWidget {
  //UNE LISTE DE PROFIL POUR FAIRE LE CLASSEMENT
  //A DISCUTER AVEC L EQUIPE + BACKEND
  const Classement({super.key});

  @override
  State<Classement> createState() => _ClassementState();
}

class _ClassementState extends State<Classement> {
  IconData icone = Icons.music_note;
  // pour simuler un proril

  @override
  Widget build(BuildContext context) {
    double wid = MediaQuery.sizeOf(context).width;
    double het = MediaQuery.sizeOf(context).height;
    return Scaffold(
        backgroundColor: const Color.fromRGBO(158, 231, 251, 1),
        body: Stack(
          children: [
            //culomn of rows
            Positioned(
              top: het * 116 / 360,
              left: wid * 99 / 800,
              child: Column(
                children: [
                  Row(
                    children: [
                      Positioned(
                        child: Stack(
                          alignment: Alignment.center,
                          children: [
                            Container(
                              width: wid * 43 / 800,
                              height: wid * 43 / 800,
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: const Color.fromRGBO(244, 244, 244, 1),
                                  border: Border.all(
                                    color: const Color.fromRGBO(19, 78, 73, 1),
                                    width: wid * 1 / 800,
                                  )),
                            ),
                            Text(
                              "1",
                              style: TextStyle(
                                fontFamily: "Atma",
                                fontSize: wid * 40 / 800,
                                fontWeight: FontWeight.w700,
                                color: const Color.fromRGBO(232, 69, 96, 1),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        width: wid * 13 / 800,
                      ),
                      Positioned(
                          top: het * 116 / 360,
                          child: Container(
                              width: wid * 211 / 800,
                              height: het * 45 / 360,
                              decoration: BoxDecoration(
                                  borderRadius:
                                      BorderRadius.circular(wid * 14 / 800),
                                  color: const Color.fromRGBO(244, 244, 244, 1),
                                  border: Border.all(
                                    color: const Color.fromRGBO(19, 78, 73, 1),
                                    width: wid * 1 / 800,
                                  )),
                              child: Padding(
                                padding: EdgeInsets.fromLTRB(
                                    wid * 30 / 800, het * 5 / 360, 0.0, 0.0),
                                child: Row(
                                  children: [
                                    Text(
                                      "Nom1",
                                      style: TextStyle(
                                        fontFamily: 'Atma',
                                        fontWeight: FontWeight.w500,
                                        fontSize: wid * 22 / 800,
                                        color: const Color.fromRGBO(0, 0, 0, 1),
                                      ),
                                    ),
                                    SizedBox(
                                      width: wid * 38 / 800,
                                    ),
                                    Image.asset(
                                      "assets/images/leaf.png",
                                      width: wid * 17.52 / 800,
                                      height: het * 18.43 / 360,
                                    ),
                                    SizedBox(
                                      width: wid * 9 / 800,
                                    ),
                                    Text(
                                      "200",
                                      style: TextStyle(
                                        fontFamily: 'Atma',
                                        fontWeight: FontWeight.w600,
                                        fontSize: wid * 22 / 800,
                                        color:
                                            const Color.fromRGBO(19, 78, 73, 1),
                                      ),
                                    ),
                                  ],
                                ),
                              ))),
                    ],
                  ),
                  SizedBox(
                    height: het * 29 / 360,
                  ),
                  Row(
                    children: [
                      Positioned(
                        top: het * 117 / 360,
                        left: wid * 99 / 800,
                        child: Stack(
                          alignment: Alignment.center,
                          children: [
                            Container(
                              width: wid * 43 / 800,
                              height: wid * 43 / 800,
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: const Color.fromRGBO(244, 244, 244, 1),
                                  border: Border.all(
                                    color: const Color.fromRGBO(19, 78, 73, 1),
                                    width: wid * 1 / 800,
                                  )),
                            ),
                            Text(
                              "2",
                              style: TextStyle(
                                fontFamily: "Atma",
                                fontSize: wid * 40 / 800,
                                fontWeight: FontWeight.w700,
                                color: const Color.fromRGBO(19, 78, 73, 1),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        width: wid * 13 / 800,
                      ),
                      Positioned(
                          top: het * 116 / 360,
                          child: Container(
                              width: wid * 211 / 800,
                              height: het * 45 / 360,
                              decoration: BoxDecoration(
                                  borderRadius:
                                      BorderRadius.circular(wid * 14 / 800),
                                  color: const Color.fromRGBO(244, 244, 244, 1),
                                  border: Border.all(
                                    color: const Color.fromRGBO(19, 78, 73, 1),
                                    width: wid * 1 / 800,
                                  )),
                              child: Padding(
                                padding: EdgeInsets.fromLTRB(
                                    wid * 30 / 800, het * 5 / 360, 0.0, 0.0),
                                child: Row(
                                  children: [
                                    Text(
                                      "Nom2",
                                      style: TextStyle(
                                        fontFamily: 'Atma',
                                        fontWeight: FontWeight.w500,
                                        fontSize: wid * 22 / 800,
                                        color: const Color.fromRGBO(0, 0, 0, 1),
                                      ),
                                    ),
                                    SizedBox(
                                      width: wid * 38 / 800,
                                    ),
                                    Image.asset(
                                      "assets/images/leaf.png",
                                      width: wid * 17.52 / 800,
                                      height: het * 18.43 / 360,
                                    ),
                                    SizedBox(
                                      width: wid * 9 / 800,
                                    ),
                                    Text(
                                      "180",
                                      style: TextStyle(
                                        fontFamily: 'Atma',
                                        fontWeight: FontWeight.w600,
                                        fontSize: wid * 22 / 800,
                                        color:
                                            const Color.fromRGBO(19, 78, 73, 1),
                                      ),
                                    ),
                                  ],
                                ),
                              ))),
                    ],
                  ),
                  SizedBox(
                    height: het * 29 / 360,
                  ),
                  Row(
                    children: [
                      Positioned(
                        top: het * 117 / 360,
                        left: wid * 99 / 800,
                        child: Stack(
                          alignment: Alignment.center,
                          children: [
                            Container(
                              width: wid * 43 / 800,
                              height: wid * 43 / 800,
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: const Color.fromRGBO(244, 244, 244, 1),
                                  border: Border.all(
                                    color: const Color.fromRGBO(19, 78, 73, 1),
                                    width: wid * 1 / 800,
                                  )),
                            ),
                            Text(
                              "3",
                              style: TextStyle(
                                fontFamily: "Atma",
                                fontSize: wid * 40 / 800,
                                fontWeight: FontWeight.w700,
                                color: const Color.fromRGBO(19, 78, 73, 1),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        width: wid * 13 / 800,
                      ),
                      Positioned(
                          top: het * 116 / 360,
                          child: Container(
                              width: wid * 211 / 800,
                              height: het * 45 / 360,
                              decoration: BoxDecoration(
                                  borderRadius:
                                      BorderRadius.circular(wid * 14 / 800),
                                  color: const Color.fromRGBO(244, 244, 244, 1),
                                  border: Border.all(
                                    color: const Color.fromRGBO(19, 78, 73, 1),
                                    width: wid * 1 / 800,
                                  )),
                              child: Padding(
                                padding: EdgeInsets.fromLTRB(
                                    wid * 30 / 800, het * 5 / 360, 0.0, 0.0),
                                child: Row(
                                  children: [
                                    Text(
                                      "Nom3",
                                      style: TextStyle(
                                        fontFamily: 'Atma',
                                        fontWeight: FontWeight.w500,
                                        fontSize: wid * 22 / 800,
                                        color: const Color.fromRGBO(0, 0, 0, 1),
                                      ),
                                    ),
                                    SizedBox(
                                      width: wid * 38 / 800,
                                    ),
                                    Image.asset(
                                      "assets/images/leaf.png",
                                      width: wid * 17.52 / 800,
                                      height: het * 18.43 / 360,
                                    ),
                                    SizedBox(
                                      width: wid * 9 / 800,
                                    ),
                                    Text(
                                      "105",
                                      style: TextStyle(
                                        fontFamily: 'Atma',
                                        fontWeight: FontWeight.w600,
                                        fontSize: wid * 22 / 800,
                                        color:
                                            const Color.fromRGBO(19, 78, 73, 1),
                                      ),
                                    ),
                                  ],
                                ),
                              ))),
                    ],
                  )
                ],
              ),
            ),
            Positioned(
                left: wid * 296 / 800,
                top: het * 25 / 360,
                child: Text(
                  "Classement",
                  style: TextStyle(
                    fontFamily: "Atma",
                    fontSize: wid * 38 / 800,
                    fontWeight: FontWeight.w700,
                    color: const Color.fromRGBO(19, 78, 73, 1),
                  ),
                )),
            Stack(
              children: [
                Positioned(
                    top: het * 149 / 360,
                    left: wid * 481 / 800,
                    child: Container(
                      width: wid * 233 / 800,
                      height: wid * 160 / 800,
                      decoration: BoxDecoration(
                          color: const Color.fromRGBO(244, 244, 244, 1),
                          borderRadius: BorderRadius.circular(wid * 35 / 800),
                          border: Border.all(
                            color: const Color.fromRGBO(19, 78, 73, 1),
                            width: wid * 2 / 800,
                          )),
                      child: Padding(
                        padding: EdgeInsets.fromLTRB(
                            wid * 36 / 800, het * 60 / 360, wid * 38 / 800, 0),
                        child: Column(
                          children: [
                            Row(
                              children: [
                                Text(
                                  "Score: ",
                                  style: TextStyle(
                                    fontFamily: 'Atma',
                                    color: const Color.fromRGBO(19, 86, 23, 1),
                                    fontSize: wid * 18 / 800,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                SizedBox(width: wid * 23 / 800),
                                Text(
                                  "105",
                                  style: TextStyle(
                                    fontFamily: 'Atma',
                                    color: const Color.fromRGBO(62, 60, 60, 1),
                                    fontSize: wid * 18 / 800,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                SizedBox(width: wid * 9 / 800),
                                Image.asset(
                                  "assets/images/leaf.png",
                                  width: wid * 16.88 / 800,
                                  height: het * 20.14 / 360,
                                ), //image leaf
                              ],
                            ),
                            Divider(
                              color: const Color.fromRGBO(19, 86, 23, 1),
                              height: het * 1 / 360,
                            ),
                            Row(
                              children: [
                                Text(
                                  "Classement: ",
                                  style: TextStyle(
                                    fontFamily: 'Atma',
                                    color: const Color.fromRGBO(19, 86, 23, 1),
                                    fontSize: wid * 18 / 800,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                SizedBox(width: wid * 18 / 800),
                                Text(
                                  "05",
                                  style: TextStyle(
                                    fontFamily: 'Atma',
                                    color: const Color.fromRGBO(62, 60, 60, 1),
                                    fontSize: wid * 18 / 800,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ],
                            ),
                            Divider(
                              color: const Color.fromRGBO(19, 86, 23, 1),
                              height: het * 1 / 360,
                            ),
                          ],
                        ),
                      ),
                    )),
                Positioned(
                  top: het * 100 / 360,
                  left: wid * 552 / 800,
                  child: Column(
                    children: [
                      Container(
                        width: wid * (84 / 800),
                        height: wid * (84 / 800),
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.green,
                        ),
                        //child: Image.asset(""),//mettre l'image de l'utilisateur
                      ),
                      Text(
                        "moi",
                        style: TextStyle(
                          fontFamily: 'Atma',
                          fontWeight: FontWeight.w500,
                          fontSize: wid * (21 / 800),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),

            Positioned(
              left: MediaQuery.of(context).size.width * (29 / 800),
              top: MediaQuery.of(context).size.height * (30 / 360),
              child: Column(
                children: [
                  Stack(alignment: Alignment.center, children: [
                    Container(
                      width: MediaQuery.of(context).size.width * 39 / 800,
                      height: MediaQuery.of(context).size.width * 39 / 800,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: const Color(0xFFE84560),
                        border: Border.all(
                          color: const Color(0xff752683),
                          width: 2,
                        ),
                      ),
                    ),
                    IconButton(
                      onPressed: () {
                        setState(() {
                          if (icone == Icons.music_note) {
                            icone = Icons.music_off;
                          } else {
                            icone = Icons.music_note;
                          }
                        });
                      },
                      icon: Icon(icone),
                      iconSize: MediaQuery.of(context).size.width * 29 / 800,
                      color: const Color.fromARGB(255, 255, 255, 255),
                    ),
                  ]),
                  SizedBox(
                    height: het * (12 / 360),
                  ),
                  Stack(alignment: Alignment.center, children: [
                    Container(
                      width: MediaQuery.of(context).size.width * 39 / 800,
                      height: MediaQuery.of(context).size.width * 39 / 800,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: const Color(0xFFE84560),
                        border: Border.all(
                          color: const Color(0xff752683),
                          width: 2,
                        ),
                      ),
                    ),
                    IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: const Icon(Icons.close_rounded),
                      iconSize: MediaQuery.of(context).size.width * 29 / 800,
                      color: const Color.fromARGB(255, 255, 255, 255),
                    ),
                  ]),
                  //autre container
                ],
              ),
            ),
          ],
        ));
  }
}
