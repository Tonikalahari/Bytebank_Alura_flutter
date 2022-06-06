// ignore_for_file: prefer_const_constructors

import 'package:bytebank/screens/transferencia_lista.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const ByteBankApp());
}

class ByteBankApp extends StatelessWidget {
  const ByteBankApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        colorScheme: ColorScheme.fromSwatch(
          primarySwatch: Colors.green,
        ).copyWith(
          secondary: Colors.green[400],
        ),
        buttonTheme: ButtonThemeData(
            buttonColor: Colors.green[700], textTheme: ButtonTextTheme.primary),
      ),
      debugShowCheckedModeBanner: false,
      home: TransferenceLIst(),
    );
  }
}
