import 'package:flutter/material.dart';

class FloatingAction extends StatelessWidget {
  final onPressed;
  FloatingAction({this.onPressed});
  Widget build(BuildContext context) {
    return FloatingActionButton(
      mini: true,
      child: Icon(
        Icons.add,
        color: Colors.black,
      ),
      backgroundColor: Colors.white,
      onPressed: onPressed,
    );
  }
}
