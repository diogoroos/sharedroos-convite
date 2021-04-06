import 'package:flutter/material.dart';
import 'package:convite/ui/commom/colors.dart';

final theme1 = _theme1();

ThemeData _theme1() {
  final ThemeData base = ThemeData(fontFamily: 'HandSiliguri');
  return base.copyWith(
      primaryColor: cAzul,
      primaryColorDark: cAzulDark,
      primaryColorLight: cAzulLight,
      appBarTheme: AppBarTheme(color: cAzulDark),
      backgroundColor: Colors.white,
      accentColor: Colors.black,
      secondaryHeaderColor: cPretoLight,
      buttonColor: cAzul);
}
