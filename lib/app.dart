import 'package:financeapp/screens/1startpage.dart';
import 'package:flutter/material.dart';

class App extends StatelessWidget {
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: StartPage(),
      ),
    );
  }
}
