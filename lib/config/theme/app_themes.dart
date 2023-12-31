import 'package:flutter/material.dart';

ThemeData theme() {
  return ThemeData(
    scaffoldBackgroundColor: Colors.white,
    fontFamily: 'SF Pro Text',
    appBarTheme: appBarTheme(),
  );
}

AppBarTheme appBarTheme() {
  return const AppBarTheme(
    color: Colors.white,
    elevation: 0,
    centerTitle: true,
    iconTheme: IconThemeData(
      color: Color(
        0xFF8b8b8b,
      ),
    ),
    titleTextStyle: TextStyle(
        color: Color(
          0xFF8b8b8b,
        ),
        fontSize: 18),
  );
}
