import 'package:flutter/material.dart';

class AvatarContainer extends StatelessWidget {
  int avatarNumber;
  final VoidCallback onTapCallback;

  AvatarContainer({
    required this.avatarNumber,
    required this.onTapCallback,
    Key? key
  })
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTapCallback,
      child: Container(
        width: (77.97 / 800)*MediaQuery.of(context).size.width,
        height: (77.97 / 800)*MediaQuery.of(context).size.width,
        decoration: const BoxDecoration(
          shape: BoxShape.circle,
        ),
        child: ClipRRect(
          child: Center(
            child: Image.asset(
              'assets/images/player_avatars/avatar$avatarNumber.png',
              fit: BoxFit.fill,
            ),
          ),
        ),
      ),
    );
  }
}






// class AvatarContainer extends StatelessWidget {
//   int avatar;
//
//   AvatarContainer({
//     required this.avatar,
//     Key? key
//   })
//       : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return CircleAvatar(
//       radius: (77.97 / 800) * MediaQuery
//           .of(context)
//           .size
//           .width,
//       child: InkWell(
//         onTap: () {
//           setState(() {
//             selectedAvatar = avatar;
//           });
//         },
//         child: Image.asset(
//           'assets/images/player_avatars/avatar$avatar.png',
//           fit: BoxFit.fill,
//         ),
//       ),
//     );
//   }
// }