// ignore_for_file: use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:vcare/Features/Auth/View/Pages/register.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'VCare',
      theme:
          ThemeData(useMaterial3: true, primaryColor: const Color(0xff174068)),
      home: const RegisterPage(),
    );
  }
}
