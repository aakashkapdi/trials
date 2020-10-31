import 'package:flutter/material.dart';
import 'package:ui_trial/SaveMessages.dart';
import 'package:ui_trial/initialisation.dart';
import 'package:ui_trial/login.dart';
import 'Signup.dart';
import 'home.dart';
import 'mute.dart';
import 'saveFaces.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Home();
  }
}