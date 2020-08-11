import 'package:flutter/material.dart';
import 'package:expense_tracker/styles/color_styles.dart';
import 'package:expense_tracker/pages/onboarding.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Budget Tracker',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        primaryColor: ColorStyles.primaryColor,
        fontFamily: "Inter",
      ),
      home: WelcomePage(),
    );
  }
}