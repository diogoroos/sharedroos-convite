import 'package:flutter/material.dart';

class ImageLogin extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 35.0),
      child: Image.asset(
        'assets/images/logo.png',
        isAntiAlias: true,
        filterQuality: FilterQuality.high,
        height: MediaQuery.of(context).size.height * 0.12,
      ),
    );
  }
}
