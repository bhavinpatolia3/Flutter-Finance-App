import 'package:financeapp/data/list.dart';
import 'package:financeapp/screens/widgets/action_button/action_button.dart';
import 'package:financeapp/screens/widgets/appbar/appbarcomponent.dart';
import 'package:financeapp/screens/widgets/floatingactionbutton/floatingactionbutton.dart';
import 'package:financeapp/screens/widgets/text3324/text3324.dart';
import 'package:financeapp/screens/widgets/top_image/top_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

import '5search.dart';

class EventStep extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return EventStepState();
  }
}

class EventStepState extends State<EventStep> {
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Stack(
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
                actions: <Widget>[ActionButton()],
              ),
              body: Container(
                child: Column(
                  children: <Widget>[
                    Container(height: 20.0),
                    _bodytext(),
                    Container(height: 102.0),
                    Container(
                      height: 442.4,
                      child: ListView.builder(
                        itemCount: dummydata.length,
                        itemBuilder: (BuildContext context, int index) {
                          return new Stack(
                            children: <Widget>[
                              Padding(
                                  padding: EdgeInsets.only(left: 50.0),
                                  child: new ListTile(
                                      //leading: _condition(context, index),
                                      title: Text(dummydata[index].title),
                                      subtitle: Text(dummydata[index].date),
                                      trailing: _taril(context, index))),
                              new Positioned(
                                top: 0.0,
                                bottom: 0.0,
                                left: 29.0,
                                child: new Container(
                                  height: 20.0,
                                  width: 2.0,
                                  color: Colors.grey[200],
                                ),
                              ),
                              _condition(context, index),
                            ],
                          );
                        },
                      ),
                    )
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget _condition(BuildContext context, int index) {
    if (dummydata[index].date.endsWith('1998')) {
      return _bluecontainer();
    } else {
      return _dotContainer();
    }
  }

  Widget _bluecontainer() {
    return Positioned(
      top: 20.0,
      left: 15.0,
      child: new Container(
        height: 30.0,
        width: 30.0,
        decoration: new BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.white,
        ),
        child: new Container(
          margin: new EdgeInsets.all(5.0),
          height: 20.0,
          width: 20.0,
          decoration: new BoxDecoration(
              shape: BoxShape.circle, color: Colors.blueAccent),
        ),
      ),
    );
  }

  Widget _dotContainer() {
    return Positioned(
      top: 20.0,
      left: 15.0,
      child: new Container(
          height: 30.0,
          width: 30.0,
          decoration: new BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.white,
          ),
          child: new Container(
              margin: new EdgeInsets.all(5.0),
              height: 20.0,
              width: 20.0,
              decoration: new BoxDecoration(
                  shape: BoxShape.circle, color: Colors.blueAccent),
              child: Container(
                  margin: new EdgeInsets.all(2.0),
                  height: 20.0,
                  width: 20.0,
                  decoration: new BoxDecoration(
                      shape: BoxShape.circle, color: Colors.white),
                  child: Container(
                      margin: new EdgeInsets.all(3.0),
                      height: 20.0,
                      width: 20.0,
                      decoration: new BoxDecoration(
                          shape: BoxShape.circle, color: Colors.blueAccent))))),
    );
  }

  Widget _taril(BuildContext context, int index) {
    if (dummydata[index].money.startsWith('-')) {
      return Text(
        '₹' + dummydata[index].money,
        style: TextStyle(
            color: Colors.pink, fontWeight: FontWeight.bold, fontSize: 15.0),
      );
    } else {
      return Text('₹' + dummydata[index].money,
          style: TextStyle(
              color: Colors.blueAccent,
              fontWeight: FontWeight.bold,
              fontSize: 15.0));
    }
  }

  Widget _bodytext() {
    return Column(children: <Widget>[
      Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SingleChildScrollView(
              child: Text('Total Balance',
                  style: TextStyle(color: Colors.white, fontSize: 20.0)),
            )
          ]),
      Container(height: 20.0),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Text(''),
          Text(''),
          Center(child: TextRupees()),
          FloatingAction(
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (BuildContext context) => SearchUser()));
            },
          )
        ],
      )
    ]);
  }
}
