import 'package:flutter/material.dart';

class TransactionButton extends StatelessWidget {
  final color;
  final onPressed;
  TransactionButton({this.color, this.onPressed});
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(35.0),
      child: Center(
        child: MaterialButton(
            shape: RoundedRectangleBorder(
                borderRadius: new BorderRadius.circular(30.0)),
            height: 59.5,
            child: Text(
              'Send Transaction',
              style: TextStyle(color: Colors.white, fontSize: 15.0),
            ),
            minWidth: 180.0,
            color: this.color,
            onPressed: this.onPressed),
      ),
    );
  }
}
