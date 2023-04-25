import 'package:flutter/material.dart';

class Iconbutton extends StatelessWidget {
  Icon icon;
  Iconbutton({required this.icon});

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.only(bottom: MediaQuery.of(context).size.height*0.033333333),
        child: Stack(
          alignment: Alignment.center,
          children: [
            Container(
              //margin: EdgeInsets.only(bottom: 12.0),
              width: MediaQuery.of(context).size.width * 0.04875,
              height: MediaQuery.of(context).size.width * 0.04875,
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
              onPressed: () {},
              icon: icon,
              iconSize: MediaQuery.of(context).size.width * 0.03,
              color: const Color.fromARGB(255, 255, 255, 255),
            ),
          ],
        ));
  }
}
