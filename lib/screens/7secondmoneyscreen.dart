import 'package:financeapp/screens/widgets/appbar/appbarcomponent.dart';
import 'package:financeapp/screens/widgets/body_text/body_text.dart';
import 'package:financeapp/screens/widgets/top_image/top_image.dart';
import 'package:financeapp/screens/widgets/transactionbutton/transactionbutton.dart';
import '8password.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class Transaction extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return TransactionState();
  }
}

class TransactionState extends State<Transaction> {
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Stack(fit: StackFit.expand, children: [
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
                      onPressed: () {})
                ],
              ),
              body: SingleChildScrollView(
                child: Column(
                  children: <Widget>[
                    Container(
                      height: 20.0,
                    ),
                    BodyText(),
                    Container(height: 100.0),
                    SingleChildScrollView(
                      child: Container(
                        color: Colors.white,
                        child: Column(
                          children: <Widget>[
                            ListTile(
                              leading: Icon(
                                Icons.movie_creation,
                                size: 40.0,
                                color: Colors.blue[900],
                              ),
                              title: Row(children: <Widget>[
                                Text('Bank Account',
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold)),
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
                    ),
                    Container(height: 10.0, color: Colors.grey[100]),
                    Container(
                        color: Colors.white,
                        child: Column(children: <Widget>[
                          ListTile(
                            leading: Text(
                              'Enter Reciever Detail',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.grey[300]),
                            ),
                          )
                        ])),
                    SingleChildScrollView(
                      child: Container(
                        color: Colors.white,
                        padding: EdgeInsets.only(right: 10, left: 10),
                        child: Form(
                          child: Theme(
                            data: ThemeData(
                              primarySwatch: Colors.grey,
                              inputDecorationTheme: InputDecorationTheme(
                                labelStyle: TextStyle(
                                    fontSize: 15.0,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                            child: Center(
                              child: Column(
                                children: [
                                  TextField(
                                    decoration: InputDecoration(
                                      labelText: 'Name',
                                      labelStyle: TextStyle(
                                          color: Colors.grey[300],
                                          fontSize: 15.0,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                  TextField(
                                    keyboardType: TextInputType.number,
                                    decoration: InputDecoration(
                                      labelText: 'Reciever Account Number',
                                      labelStyle: TextStyle(
                                          color: Colors.grey[300],
                                          fontSize: 15.0,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                  TextField(
                                    decoration: InputDecoration(
                                      labelText: 'Description',
                                      labelStyle: TextStyle(
                                          color: Colors.grey[300],
                                          fontSize: 15.0,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                  TransactionButton(
                                      color: Colors.pinkAccent,
                                      onPressed: () {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder:
                                                    (BuildContext context) =>
                                                        EnterPass()));
                                      })
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              )),
        ),
      ]),
    );
  }
}
