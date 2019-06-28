import 'package:flutter/material.dart';

class UserImage extends StatelessWidget {
  double maxRadius;
  UserImage({this.maxRadius});
  Widget build(BuildContext context) {
    return CircleAvatar(
      maxRadius: maxRadius,
      backgroundImage: AssetImage('assets/images/image/_20160321_010043.JPG'),
    );
  }
}
