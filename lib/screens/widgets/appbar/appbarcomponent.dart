import 'package:financeapp/screens/widgets/logo_image/logo_image.dart';
import 'package:financeapp/screens/widgets/user_image/user_image.dart';
import 'package:flutter/material.dart';

class AppBarComponent extends StatelessWidget {
  Widget build(BuildContext context) {
    return Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          LogoImage(),
          Container(width: 100.0),
          UserImage(
            maxRadius: 20.0,
          ),
        ]);
  }
}
