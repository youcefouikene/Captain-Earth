import 'package:flutter/material.dart';
class CustomContainer extends StatelessWidget {
  final Color colorTop;
  final double widthContainer;
  final double heightContainer;
  final IconData icon;

  const CustomContainer({
    required this.colorTop,
    required this.widthContainer,
    required this.heightContainer,
    required this.icon,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Stack(
                alignment: Alignment.center,
            children: [
             Container(
                width: widthContainer,
                height: heightContainer,
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color:colorTop,
                     border: Border.all(
                        color: Color(0xff752683),
                         width: 2,
                         ),

                   ),
                   ),
                   Icon(
                  icon,
                  size:( MediaQuery.of(context).size.width) * 0.03,
                  color: Colors.white,
                   ),
                 ],
                  ),
                  );
  }
}
