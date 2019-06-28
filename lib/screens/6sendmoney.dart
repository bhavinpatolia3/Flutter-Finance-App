import 'package:financeapp/screens/7secondmoneyscreen.dart';
import 'package:financeapp/screens/widgets/action_button/action_button.dart';
import 'package:financeapp/screens/widgets/appbar/appbarcomponent.dart';
import 'package:financeapp/screens/widgets/body_text/body_text.dart';
import 'package:financeapp/screens/widgets/top_image/top_image.dart';
import 'package:financeapp/screens/widgets/transactionbutton/transactionbutton.dart';
import 'package:flutter/material.dart';

class SendMoney extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return SendMoneyState();
  }
}

class SendMoneyState extends State<SendMoney> {
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
                actions: <Widget>[ActionButton()],
              ),
              body: SingleChildScrollView(
                child: Column(
                  children: <Widget>[
                    Container(
                      height: 20.0,
                    ),
                    BodyText(),
                    Container(height: 100.0),
                    Container(
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
                    Container(
                      color: Colors.white,
                      padding: EdgeInsets.only(right: 10, left: 10),
                      child: Form(
                        child: Theme(
                          data: ThemeData(
                            primarySwatch: Colors.grey,
                            inputDecorationTheme: InputDecorationTheme(
                              labelStyle: TextStyle(
                                  fontSize: 15.0, fontWeight: FontWeight.bold),
                            ),
                          ),
                          child: Center(
                            child: Column(
                              children: [
                                nameField(),
                                accountNumberField(),
                                descriptionField(),
                                TransactionButton(
                                  color: Colors.grey[400],
                                  onPressed: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (BuildContext context) =>
                                                Transaction()));
                                  },
                                ),
                              ],
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

  Widget nameField() {
    return TextField(
      decoration: InputDecoration(
        labelText: 'Name',
        labelStyle: TextStyle(
            color: Colors.grey[300],
            fontSize: 15.0,
            fontWeight: FontWeight.bold),
      ),
    );
  }

  Widget accountNumberField() {
    return TextField(
      keyboardType: TextInputType.number,
      decoration: InputDecoration(
        labelText: 'Reciever Account Number',
        labelStyle: TextStyle(
            color: Colors.grey[300],
            fontSize: 15.0,
            fontWeight: FontWeight.bold),
      ),
    );
  }

  Widget descriptionField() {
    return TextField(
      decoration: InputDecoration(
        labelText: 'Description',
        labelStyle: TextStyle(
            color: Colors.grey[300],
            fontSize: 15.0,
            fontWeight: FontWeight.bold),
      ),
    );
  }
}
