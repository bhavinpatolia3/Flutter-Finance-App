
import 'package:financeapp/data/list.dart';
import 'package:financeapp/screens/widgets/action_button/action_button.dart';
import 'package:financeapp/screens/widgets/appbar/appbarcomponent.dart';
import 'package:financeapp/screens/widgets/floatingactionbutton/floatingactionbutton.dart';
import 'package:financeapp/screens/widgets/text3324/text3324.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import '4step.dart';
import '6sendmoney.dart';

class MoneyScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return MoneyScreenState();
  }
}

class MoneyScreenState extends State<MoneyScreen> {
  Widget build(BuildContext context) {
  
    return Container(
      child: Stack(
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
                  children: <Widget>[
                    AppBarComponent(),
                  ],
                ),
                backgroundColor: Colors.transparent,
                actions: <Widget>[ActionButton()],
              ),
              body: Scaffold(
                body: Stack(
                  fit: StackFit.expand,
                  children: <Widget>[
                    Image(
                      image: AssetImage(
                          'assets/images/image/BG Top White BG 2.png'),
                      fit: BoxFit.fill,
                    ),
                    Container(
                      child: Column(
                        children: <Widget>[
                          Padding(padding: EdgeInsets.only(top: 10.0)),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Text(
                                'Total Balance',
                                style: TextStyle(
                                    color: Colors.white, fontSize: 20.0),
                              )
                            ],
                          ),
                          Padding(padding: EdgeInsets.only(top: 10.0)),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Text(''),
                              Text(''),
                              Center(child: TextRupees()),
                              FloatingAction()
                            ],
                          ),
                          Padding(padding: EdgeInsets.only(top: 10.0)),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              MaterialButton(
                                  color: Colors.grey[300],
                                  child: Text('+ ₹1234.0'),
                                  minWidth: 120.0,
                                  height: 30.0,
                                  onPressed: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (BuildContext context) =>
                                                SendMoney()));
                                  })
                            ],
                          ),
                          Container(height: 50.0),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Text(
                                'LATEST TRANSACTIONS',
                                style: TextStyle(
                                    fontSize: 20.0,
                                    fontWeight: FontWeight.bold),
                              )
                            ],
                          ),
                          Container(height: 20.0),
                          Container(
                            height: 100.0,
                            child: new ListView(
                              scrollDirection: Axis.horizontal,
                              children: new List.generate(
                                7,
                                (int index) {
                                  return new Card(
                                    color: Colors.purple[index * 100],
                                    child: Center(
                                      child: new Container(
                                        width: 150.0,
                                        height: 100.0,
                                        child: ListTile(
                                          title: Text(
                                            dummydata[index].title,
                                          ),
                                          subtitle: Text(
                                              '₹' + dummydata[index].money,
                                              style: TextStyle(
                                                  fontSize: 20.0,
                                                  color: Colors.black)),
                                        ),
                                      ),
                                    ),
                                  );
                                },
                              ),
                            ),
                          ),
                          Container(height: 10.0, color: Colors.grey[100]),
                          Container(
                            color: Colors.white,
                            child: Column(
                              children: <Widget>[
                                ListTile(
                                  onTap: _transction,
                                  leading: Icon(
                                    Icons.movie_creation,
                                    size: 40.0,
                                    color: Colors.blue[900],
                                  ),
                                  title: Row(children: <Widget>[
                                    Text('Bank Account',
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold)),
                                  ]),
                                  subtitle: Text('NSDL RA01 203 4455 12'),
                                  trailing: Text(
                                    '₹30324.00',
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Colors.purple[200],
                                        fontSize: 15.0),
                                  ),
                                )
                              ],
                            ),
                          ),
                          Container(height: 10.0, color: Colors.grey[100]),
                          Container(
                            color: Colors.white,
                            height: 225.0,
                            child: new ListView.builder(
                              itemCount: dummydata.length,
                              itemBuilder: (context, index) {
                                return Column(
                                  children: <Widget>[
                                    Divider(
                                      height: 10.0,
                                    ),
                                    ListTile(
                                        leading: Icon(Icons.monetization_on),
                                        title: Row(
                                          children: <Widget>[
                                            Text(
                                              'Saving Account',
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold),
                                            )
                                          ],
                                        ),
                                        subtitle: Text('NSDL RA01 203 4455 12'),
                                        trailing: Text(
                                            '₹' + dummydata[index].money,
                                            semanticsLabel: 'Payment',
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                color: Colors.purple[200],
                                                fontSize: 15.0)))
                                  ],
                                );
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  void _transction() {
    Navigator.push(context,
        MaterialPageRoute(builder: (BuildContext context) => EventStep()));
  }
  
}
