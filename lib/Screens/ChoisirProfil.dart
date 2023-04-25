import 'package:flutter/material.dart';
import 'AjouterProfil.dart';
class ChoisirProfil extends StatefulWidget {
  //ajouter une liste de profils de display in listView 
  //pour l'instant je vaus mettre une liste of Strings comme des nom de profils
  List<String> listProfils=["Mello","Jack","Lola","Zake"];
   ChoisirProfil(
    this.listProfils,
    {super.key});

  @override
  State<ChoisirProfil> createState() => _ChoisirProfilState();
}
class _ChoisirProfilState extends State<ChoisirProfil> {
  List<String> listProfils=["Mello","Jack","Lola","Zake"];//normalement les profils existants dans la base de donnees
  IconData  icone=Icons.music_note; 

  @override
  Widget build(BuildContext context) {
         double wid=MediaQuery.of(context).size.width;
        double het=MediaQuery.of(context).size.height;
     return Scaffold(
     backgroundColor:const Color.fromRGBO(158, 231, 251, 1),
     body: Stack(
      children: [
        //NOUVEAU MODEL boutton 
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
            
               Positioned(
                left: wid*(313/800),
                top:het*(53/360),
                child:Text(
                  "CHOISIR UN PROFIL",
                  style:TextStyle(
                    color:const Color(0xff135617),
                    fontFamily: 'Atma',
                    fontSize: wid*(33/800),
                    fontWeight: FontWeight.w700,
            
                  ),
                )
              ),
              
                listProfils.isEmpty 
                    ? Positioned(

                      child: Positioned(
                        left: wid*(243+117)/800,
                        top: het*(146.33)/360,
                        child: Column(
                          children: [
                            ElevatedButton(
                                onPressed: () {
                                  //navigation a la page d'ajout d'un profil
                                   Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (_) {
                                    return const AjouterProfil();//aller au map car on a cliquer sur le botton 
                                  },
                                ),
                              );
                                },
                                
                                style: ElevatedButton.styleFrom(
                                shape:const CircleBorder(),
                                 primary:const Color.fromRGBO(158, 231, 251, 1),
                                 ),
                                 child: Image.asset("assets/images/ajouter.png",
                                 width: wid*(117/800),
                                 height: wid*(117/800),
                                ),
                               ),
                               SizedBox(height: het*12/360,),
                                         Text("Ajouter",
                                         style: TextStyle(
                                          fontFamily: "Atma",
                                          fontSize:wid*22/800,
                                          fontWeight: FontWeight.w400,
                                         ),
                                         ),
                          ],
                        ),
                      ),)
                         : Positioned(
                          left: wid*(228/800),
                           top:het*(146/360),
                           child: SizedBox(
                            width: wid*500/800,
                            height: het*(36+117)/360,
                             child: ListView.builder(
                              itemCount:listProfils.length+1,
                              scrollDirection:Axis.horizontal,
                              itemBuilder: (context,int index){
                                if(index==listProfils.length){
                                  return Positioned(
                                    top: het*146.33/360,
                                    child: Column(
                                    children: [
                                       ElevatedButton(
                                     onPressed: () {
                                       //navigation a la page d'ajout d'un profil 
                                       Navigator.of(context).push(
                                           MaterialPageRoute(
                                             builder: (_) {
                                                return const AjouterProfil(); }, ),);
                                       },
                                      
                                        style: ElevatedButton.styleFrom(
                                          shape:const CircleBorder(),
                                          primary:const Color.fromRGBO(158, 231, 251, 1),
                                          ),
                                          child: Image.asset("assets/images/ajouter.png",
                                          width: wid*(117/800),
                                         height: wid*(117/800),
                                          ),
                                           ),
                                          SizedBox(height: het*12/360,),
                                         Text("Ajouter",
                                         style: TextStyle(
                                          fontFamily: "Atma",
                                          fontSize:wid*22/800,
                                          fontWeight: FontWeight.w400,
                                         ),
                                         ),
                                    ],
                                  ),);
                                           }
                                else{
                                  return Row(
                                   children: [
                                     Column(children: [
                                      ElevatedButton(onPressed: (){
                                        //naviger vers les pages de connexion a un profil
                                        Navigator.of(context).push(
                                           MaterialPageRoute(
                                             builder: (_) {
                                                return const AjouterProfil(); }, ),);
                                      },
                                      style: ElevatedButton.styleFrom(
                                        shape:CircleBorder(),
                                        primary: const Color.fromRGBO(158, 231, 251, 1),
                                        ),
                                         child: Container(
                                        width: wid*(117/800),
                                        height: wid*(117/800),
                                        decoration: BoxDecoration(
                                         shape: BoxShape.circle,
                                          color:const Color.fromARGB(255, 219, 205, 207),
                                          border: Border.all(
                                           color:const Color(0xff135617),
                                           ),
                                           ),
                                          // child: , ici on met l'avatar de chaque profil 
                                      ),
                                      ),
                                      SizedBox(height: het*12/360,),
                                      Text(listProfils[index],style: TextStyle(
                                          fontFamily: "Atma",
                                          fontSize:wid*22/800,
                                          fontWeight: FontWeight.w400,
                                         ),),// ici le nom le chaque profil 
                                     ],),
                                    SizedBox(width: wid*(107.33/800),),
                                   ],
                                 );}
                           
                             }
                             ),
                           ),
                         ),

      ],
    ),
    );
  }
}

