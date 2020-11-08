import 'package:authentication_trial/login.dart';
import 'package:authentication_trial/rekognition.dart';
import 'package:flutter/material.dart';
import 'home.dart';
import 'wrapper.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return rekognition();
  }
}
