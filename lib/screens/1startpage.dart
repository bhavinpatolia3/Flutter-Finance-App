
import 'package:financeapp/screens/2signin.dart';
import 'package:financeapp/screens/widgets/bottom_image/bottom_image.dart';
import 'package:financeapp/screens/widgets/color_logo_image/color_logo_image.dart';
import 'package:flutter/material.dart';

class StartPage extends StatelessWidget {
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          BottomImage(),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[ColorLogo()],
              ),
              Container(height: 10.0),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    'Better Control of your finances.',
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: 20.0,
                    ),
                  ),
                ],
              ),
              RaisedButton(
                child: Text('Next Page'),
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (BuildContext context) => Signin()));
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}
