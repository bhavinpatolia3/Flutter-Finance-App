import 'package:financeapp/screens/3moneyscreen.dart';
import 'package:financeapp/screens/widgets/bottom_image/bottom_image.dart';
import 'package:financeapp/screens/widgets/logo_image/logo_image.dart';
import 'package:financeapp/screens/widgets/user_image/user_image.dart';
import 'package:flutter/material.dart';

class Signin extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return SigninState();
  }
}

class SigninState extends State<Signin> {
  List<String> _pinValues = [];
  bool numberPressed = false;

  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        new Container(
          decoration: new BoxDecoration(
            image: new DecorationImage(
              image: new AssetImage("assets/images/image/BG Top.png"),
              fit: BoxFit.cover,
            ),
          ),
        ),
        MaterialApp(
          debugShowCheckedModeBanner: false,
          home: Scaffold(
            backgroundColor: Colors.transparent,
            appBar: new AppBar(
              title: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  LogoImage(),
                  Container(
                    padding: EdgeInsets.all(45.0),
                  ),
                  Text(
                    'Sign in',
                  ),
                ],
              ),
              backgroundColor: Colors.transparent,
              actions: <Widget>[],
            ),
            body: Stack(
              fit: StackFit.expand,
              children: <Widget>[
                BottomImage(),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    UserImage(
                      maxRadius: 30.0,
                    ),
                    Padding(padding: EdgeInsets.all(5.0)),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          'Mehul Panchal',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 20.0),
                        )
                      ],
                    ),
                    Container(
                      height: 50.0,
                    ),
                    Container(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          numberPressed ? inputField() : inputField()
                        ],
                      ),
                    ),
                    Container(
                      height: 50.0,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        numberInputButton('1'),
                        numberInputButton('2'),
                        numberInputButton('3'),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        numberInputButton('4'),
                        numberInputButton('5'),
                        numberInputButton('6'),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        numberInputButton('7'),
                        numberInputButton('8'),
                        numberInputButton('9'),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        buttonDisable(),
                        numberInputButton('0'),
                        backspaceButton(''),
                      ],
                    ),
                  ],
                )
              ],
            ),
          ),
        )
      ],
    );
  }

  Widget numberInputButton(String number) {
    return MaterialButton(
        height: 85.0,
        minWidth: 90.0,
        child: Text(number,
            style: TextStyle(fontSize: 20.0, color: Colors.grey[400])),
        color: Colors.white,
        onPressed: () {
          setState(() {
            if (_pinValues.length < 4) _pinValues.add(number);
            numberPressed = true;
          });
          print(_pinValues.join(""));
          if (_pinValues.join("") == '1234')
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (BuildContext context) => MoneyScreen()));
          else {
            if (_pinValues.length == 4)
              return showDialog(
                  barrierDismissible: false,
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      backgroundColor: Colors.red[200],
                      title: Text('Enter Valid Password'),
                      actions: <Widget>[
                        FlatButton(
                          child: Text('ok'),
                          onPressed: () {
                            Navigator.of(context).pop();
                            setState(() {
                              _pinValues.clear();
                            });
                          },
                        )
                      ],
                    );
                  });
          }
        });
  }

  Widget buttonDisable() {
    return MaterialButton(
      height: 85.0,
      minWidth: 90.0,
      color: Colors.white,
      onPressed: () {},
    );
  }

  Widget backspaceButton(String number) {
    return MaterialButton(
      child: Icon(Icons.backspace, color: Colors.blueAccent),
      color: Colors.white,
      height: 85.0,
      minWidth: 90.0,
      onPressed: () {
        setState(() {
          _pinValues.removeLast();
          numberPressed = true;
        });
      },
    );
  }

  Widget passwordFieldGray() {
    return Container(
      height: 30.0,
      width: 30.0,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(50.0),
        color: Colors.grey[200],
      ),
    );
  }

  Widget passwordFieldBlue() {
    return Container(
      height: 30.0,
      width: 30.0,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(50.0),
        color: Colors.blueAccent,
      ),
    );
  }

  Widget spaceBetweenPassWordField() {
    return Container(
      width: 20.0,
    );
  }

  Widget inputField() {
    final listOfPinWidgets = <Widget>[];
    for (var i = 0; i < 4; i++)
      if (i < _pinValues.length) {
        listOfPinWidgets.add(spaceBetweenPassWordField());
        listOfPinWidgets.add(passwordFieldBlue());
      } else {
        listOfPinWidgets.add(spaceBetweenPassWordField());
        listOfPinWidgets.add(passwordFieldGray());
      }

    {
      return Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: listOfPinWidgets);
    }
  }
}
