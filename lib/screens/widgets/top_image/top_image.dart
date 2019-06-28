import 'package:flutter/material.dart';

class TopImage extends StatelessWidget{
  Widget build (BuildContext context){
    return Image(
      image: AssetImage('assets/images/image/BG Top.png'),
      fit: BoxFit.cover,
    );
  }
}