import 'package:flutter/material.dart';
import 'flipcardgame.dart';
import 'data.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
        IconData  icone=Icons.music_note; //attribut de la classe 

  @override
  Widget build(BuildContext context) {
    final size =MediaQuery.of(context).size;
    final wid=size.width;
    final het=size.height;
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
        image:DecorationImage( image:AssetImage("assets/forest.png"),
          fit:BoxFit.cover,)
        ),
        child: Stack(
          children: [
            Positioned(
               top: het*20/360,
                left: wid*100/800,
               
                child: Container(
                 height: het*100*3/360,
                 width: wid*400/800,
                  child: ListView.builder(
                  itemCount: _list.length,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (BuildContext context) => _list[index].goto!,
                            ));
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Stack(
                          children: [
                            Container(
                              height:het* 70/360,
                              width: wid*400/800,
                              decoration: BoxDecoration(
                                  color: _list[index].primarycolor,
                                  borderRadius: BorderRadius.circular(size.width* 30/800),
                                  boxShadow: [
                                    BoxShadow(
                                        blurRadius: wid*4/800,
                                        color: Colors.black45,
                                        spreadRadius: 0.5,
                                        offset: Offset(3, 4))
                                  ]),
                            ),
                            Container(
                              height: het* 60/360,
                              width: wid*400/800,
                              decoration: BoxDecoration(
                                  color: _list[index].secomdarycolor,
                                  borderRadius: BorderRadius.circular(size.width*30),
                                 ),
                              child: Container(
                                child: Column(
                                  children: [
                                    
                                          Text(
                                      _list[index].name!,
                                      style: TextStyle(
                                        fontFamily: 'Atma',
                                          color: Colors.white,
                                          fontSize: wid*20/800,
                                          fontWeight: FontWeight.w500,
                                         ),
                                    ),
                                    
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      children: genratestar(_list[index].noOfstar),
                                    )
                                       
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),)
              
            ),
            Positioned(
          top:het*50/360,
          left:wid*500/800,
          child: Image.asset(
            'assets/images/Captain_hi.png',
            width: wid*300/800,
            height: het*300/360,
            ),
          ),
            
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
    
    //-------------------------------------------------------------
          ],
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
