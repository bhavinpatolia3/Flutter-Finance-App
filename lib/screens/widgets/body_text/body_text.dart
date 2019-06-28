import 'package:flutter/material.dart';

class BodyText extends StatelessWidget {
  Widget build(BuildContext context) {
    return Column(children: <Widget>[
      Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SingleChildScrollView(
              child: Text('New Assignment',
                  style: TextStyle(color: Colors.white, fontSize: 20.0)),
            )
          ]),
      Container(height: 20.0),
      Container(
        padding: EdgeInsets.only(left: 120.0, right: 120.0),
        child: Theme(
          data: ThemeData(
            primaryColor: Colors.white,
          ),
          child: TextFormField(
            textAlign: TextAlign.center,
            initialValue: '₹   ',
            style: TextStyle(
              color: Colors.white,
              fontSize: 30.0,
            ),
            keyboardType: TextInputType.number,
          ),
        ),
      ),
    ]);
  }
}
