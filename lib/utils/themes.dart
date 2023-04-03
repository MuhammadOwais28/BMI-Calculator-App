// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';

class MyTheme {
  static ThemeData lightTheme(BuildContext context) => ThemeData(
      cardColor: Colors.grey[300],
      textTheme: Theme.of(context).textTheme,
      accentColor: Colors.black,
      buttonColor: Colors.red[400],
      canvasColor: Colors.white);

  static ThemeData darkTheme(BuildContext context) => ThemeData(
      cardColor: const Color.fromARGB(255, 3, 36, 85),
      textTheme: Theme.of(context).textTheme,
      buttonColor: Colors.orange[400],
      accentColor: Colors.white,
      canvasColor: Colors.black54);
      
}
