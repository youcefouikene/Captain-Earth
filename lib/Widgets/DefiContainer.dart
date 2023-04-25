import 'package:flutter/material.dart';
class DefiConatainer extends StatefulWidget {
  bool decode=false;
  String pathImage='';
   DefiConatainer({
    required this.decode,
    required this.pathImage,
    Key? key}) : super(key: key);

  @override
  State<DefiConatainer> createState() => _DefiConatainerState();

  //setters et getters 
  bool getDecode(){
    return decode;
  }
  void setDecode(){
      decode=true;
  }
  void decoderDefi(String newPath){
      pathImage=newPath;
      decode=true;
  }
}

class _DefiConatainerState extends State<DefiConatainer> {
  @override
  Widget build(BuildContext context) {
    double w=MediaQuery.sizeOf(context).width;
    double h=MediaQuery.sizeOf(context).height;
    return Container(
      width: w*120/800,
      height: h*74/360,
      decoration:BoxDecoration(
        color:const Color.fromRGBO(217, 217, 217, 1),
        border: Border.all(
                          color:const Color.fromRGBO(19, 78, 73, 1),
                          width: w*3/800,
                        ),
        borderRadius:BorderRadius.circular(21/800),
      ),
      child: widget.decode
          ? Image.asset(widget.pathImage)
          : Image.asset('assets/images/icons/cadnat.png'),
    );
  }
}
