import 'package:flutter/material.dart';

class BottomImage extends StatelessWidget {
  Widget build(BuildContext context) {
    return Image(
      image: AssetImage('assets/images/image/BG Bottom.png'),
      fit: BoxFit.cover,
    );
  }
}
