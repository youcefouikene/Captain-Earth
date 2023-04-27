import 'package:flutter/material.dart';
import '../widgets/shapes/custom_container_text.dart';
import '../widgets/shapes/custom_container.dart';

class SignIn extends StatefulWidget {
  double screenWidth;
  double screenHeight;
  SignIn({required this.screenWidth, required this.screenHeight, Key? key}) : super(key: key);

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  late final double _screenWidth = widget.screenWidth;
  late final double _screenHeight = widget.screenHeight;

  final TextEditingController _profileController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  final _formKey = GlobalKey<FormState>();
  bool showPassword = false;
  bool isLoading = false;

  IconData  _icone=Icons.music_note;
  Color col= const Color.fromRGBO(232,69,96,1);
  Color col2= const Color.fromRGBO(232,69,96,1);


  void login() {
    if (_formKey.currentState!.validate()) {
      isLoading = true;
      setState(() {});
      Future.delayed(const Duration(seconds: 2), () {
        isLoading = false;
        setState(() {});
        /*
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const HomePage()),
        );
        */
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,

      body: Container(
        padding:  EdgeInsets.only(left: (29 / 800)*_screenWidth, top: (24 / 360) * _screenHeight),
        width:  double.infinity,
        decoration: const BoxDecoration (
          color:  Color.fromRGBO(158, 231, 251, 1),
        ),
        child: Stack(
          children: [
            Column(
              crossAxisAlignment:  CrossAxisAlignment.center,
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
                    icon: Icons.close_sharp,
                  ),
                ),
              ],
            ),
            Positioned(
              left: (157/800) * _screenWidth,
              child:
              SizedBox(
                width:  (408/800) * _screenWidth,
                height:  (253/360) * _screenHeight,
                child:
                Container(
                  padding: EdgeInsets.symmetric( horizontal: (31 / 800) * _screenWidth ),
                  decoration:  BoxDecoration (
                    borderRadius:  BorderRadius.circular(0.065 * _screenWidth),
                    border:  Border.all(color: const Color.fromRGBO(51, 129, 74, 1), style: BorderStyle.solid, width: 0.005 * _screenWidth),
                    color:  Colors.white,
                  ),
                  child: Form(
                    key: _formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Container(
                          alignment: Alignment.center,
                          padding: EdgeInsets.only(top: (17/360) * _screenHeight, bottom: (20/360) * _screenHeight),
                          child: const Text(
                            'CONNECTER VOUS',
                            style: TextStyle(
                              fontSize: 1.875 * 16,
                              fontFamily: 'Atma',
                              fontWeight: FontWeight.bold,
                              height: (31/16),
                              color: Color.fromRGBO(19, 78, 73, 1),
                            ),
                          ),
                        ),
                        TextFormField(
                          controller: _profileController,
                          textAlign: TextAlign.center,
                          decoration: InputDecoration(
                            prefixIcon: Padding(
                              padding: EdgeInsets.only(left: (26.42/800)*_screenWidth),
                              child: Icon(Icons.person_4_outlined, size: (30 / 800) * _screenWidth,color: const Color.fromRGBO(96, 94, 94, 1)),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderSide: const BorderSide(
                                color: Color.fromRGBO(238, 236, 235, 1),
                              ),
                              borderRadius: BorderRadius.circular((9/800)*_screenWidth),
                            ),
                            hintText: 'Nom utilisateur',
                            hintStyle: const TextStyle(
                              fontFamily: 'Atma',
                              color: Color.fromRGBO(74, 72, 72, 1),
                              fontSize: (19/16) * 16,
                              fontWeight: FontWeight.w400,
                            ),
                            filled: true,
                            fillColor: const Color.fromRGBO(238, 236, 235, 1),
                            contentPadding: EdgeInsets.symmetric(vertical: (4/360) * _screenHeight, horizontal: (24 / 800)*_screenWidth ),
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Entrez le nom utilisateur ';
                            }
                            return null;
                          },
                        ),
                        SizedBox(height: 0.035 * _screenHeight,),
                        TextFormField(
                          obscureText: true,
                          controller: _passwordController,
                          textAlign: TextAlign.center,
                          decoration: InputDecoration(
                            prefixIcon: Padding(
                              padding: EdgeInsets.only(left: (26.42/800)*_screenWidth),
                              child: Icon(Icons.lock, size: (30 / 800) * _screenWidth,color: const Color.fromRGBO(96, 94, 94, 1)),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderSide: const BorderSide(
                                color: Color.fromRGBO(238, 236, 235, 1),
                              ),
                              borderRadius: BorderRadius.circular((9/800)*_screenWidth),
                            ),
                            hintText: 'mot de passe',
                            hintStyle: const TextStyle(
                              fontFamily: 'Atma',
                              color: Color.fromRGBO(74, 72, 72, 1),
                              fontSize: (19/16) * 16,
                              fontWeight: FontWeight.w400,
                            ),
                            filled: true,
                            fillColor: const Color.fromRGBO(238, 236, 235, 1),
                            contentPadding: EdgeInsets.symmetric(vertical: (4/360) * _screenHeight, horizontal: (24 / 800)*_screenWidth ),
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Entrez le mot de passe ';
                            }
                            return null;
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
              top: (90 / 360)* _screenHeight, //20.77
              right: (50 / 800) * _screenWidth,
              child: Image.asset('assets/avatar/captain_question_1.png', width: 0.174 * _screenWidth,),
            ),
            Positioned(
              left: (301/800)*_screenWidth,
              top: (230/360) * _screenHeight,
              child: GestureDetector(
                  onTap: (){},
                  child: CustomContainerText(colorTop: const Color.fromRGBO(232, 69, 96, 1), widthContainer:(120/800) * _screenWidth , heightContainer: (39/360)*_screenHeight, texte: 'LOGIN', colorText: Colors.white)
              ),
            )
          ],
        ),
      ),
    );
  }
}

