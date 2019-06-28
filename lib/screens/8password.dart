import 'package:financeapp/screens/widgets/appbar/appbarcomponent.dart';
import 'package:financeapp/screens/widgets/bottom_image/bottom_image.dart';
import 'package:financeapp/screens/widgets/top_image/top_image.dart';
import 'package:flutter/material.dart';
import '1startpage.dart';
import '3moneyscreen.dart';

class EnterPass extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return EnterPassState();
  }
}

class EnterPassState extends State<EnterPass> {
  List<String> _pinValues = [];
  bool _numberPressed = false;
  var i;
  var wid = <Widget>[];
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          BottomImage(),
          Stack(
            fit: StackFit.expand,
            children: <Widget>[
              TopImage(),
              MaterialApp(
                debugShowCheckedModeBanner: false,
                home: Scaffold(
                  backgroundColor: Colors.transparent,
                  appBar: AppBar(
                    backgroundColor: Colors.transparent,
                    title: Row(
                      children: <Widget>[AppBarComponent()],
                    ),
                    actions: <Widget>[
                      IconButton(
                          icon: Icon(
                            Icons.sort,
                            textDirection: TextDirection.rtl,
                          ),
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (BuildContext context) =>
                                        StartPage()));
                          })
                    ],
                  ),
                  body: SingleChildScrollView(
                    child: Column(
                      children: <Widget>[
                        Container(
                          height: 20.0,
                        ),
                        SingleChildScrollView(
                          child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                SingleChildScrollView(
                                  child: Text('New Assignment',
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 20.0)),
                                )
                              ]),
                        ),
                        Container(height: 20.0),
                        Container(
                          padding: EdgeInsets.only(left: 120.0, right: 120.0),
                          child: Theme(
                            data: ThemeData(primaryColor: Colors.white),
                            child: TextFormField(
                              initialValue: '₹   ',
                              style: TextStyle(
                                  color: Colors.white, fontSize: 30.0),
                              keyboardType: TextInputType.number,
                            ),
                          ),
                        ),
                        Container(height: 80.0),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SingleChildScrollView(
                              child: Text('Enter pin to confirm your payment',
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 25.0,
                                      fontWeight: FontWeight.bold)),
                            )
                          ],
                        ),
                        Container(
                          height: 20.0,
                        ),
                        Container(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              GestureDetector(
                                  child: _numberPressed
                                      ? getTextWidgets()
                                      : getTextWidgets())
                            ],
                          ),
                        ),
                        Container(
                          height: 20.0,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            _numberInputButton('1'),
                            _numberInputButton('2'),
                            _numberInputButton('3'),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            _numberInputButton('4'),
                            _numberInputButton('5'),
                            _numberInputButton('6'),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            _numberInputButton('7'),
                            _numberInputButton('8'),
                            _numberInputButton('9'),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            _buttonDisable(),
                            _numberInputButton('0'),
                            backspace(''),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _numberInputButton(String number) {
    return MaterialButton(
        height: 85.0,
        minWidth: 90.0,
        child: Text(number,
            style: TextStyle(fontSize: 20.0, color: Colors.grey[400])),
        color: Colors.white,
        onPressed: () {
          setState(() {
            if (_pinValues.length < 4) _pinValues.add(number);
            _numberPressed = true;
          });
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

  Widget backspace(String number) {
    return MaterialButton(
      child: Icon(Icons.backspace, color: Colors.blueAccent),
      color: Colors.white,
      height: 85.0,
      minWidth: 90.0,
      onPressed: () {
        setState(() {
          _pinValues.removeLast();
          _numberPressed = true;
        });
      },
    );
  }

  Widget _passField() {
    return Container(
      height: 30.0,
      width: 30.0,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(50.0),
        color: Colors.grey[200],
      ),
    );
  }

  Widget _passField1() {
    return Container(
      height: 30.0,
      width: 30.0,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(50.0),
        color: Colors.blueAccent,
      ),
    );
  }

  Widget getTextWidgets() {
    final wid = <Widget>[];
    for (i = 0; i < 4; i++)
      if (i < _pinValues.length) {
        wid.add(_space());
        wid.add(_passField1());
      } else {
        wid.add(_space());
        wid.add(_passField());
      }
    {
      return Row(mainAxisAlignment: MainAxisAlignment.center, children: wid);
    }
  }

  Widget _buttonDisable() {
    return MaterialButton(
      height: 85.0,
      minWidth: 90.0,
      color: Colors.white,
      onPressed: () {},
    );
  }

  Widget _space() {
    return Container(
      width: 20.0,
    );
  }
}
