import 'package:flutter/material.dart';
import 'login.dart';
import 'package:flutter/services.dart';
import 'package:ui_trial/TextToSpeech.dart';
import 'dart:async';

class SignUp extends StatelessWidget {
  TextToSpeech tts = new TextToSpeech();
  final timeout = const Duration(seconds: 3);

  var go = [false, false]; //0:login,1:signup

  bool goOrNot(int touch) {
    if (go[touch]) {
      go[touch] = false;
      return true;
    } else {
      for (int i = 0; i < 2; i++) {
        if (i == touch)
          go[touch] = true;
        else
          go[i] = false;
      }
    }
    return false;
  }

  void cancelTouch() {
    for (int i = 0; i < 2; i++) go[i] = false;
  }

  void _startTimer() {
    Timer _timer;
    _timer = Timer.periodic(Duration(seconds: 3), (timer) {
      cancelTouch();
      timer.cancel();
    });
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    tts.tellCurrentScreen("Sign up");
    return MaterialApp(
        routes: {'/login': (context) => Login()},
        title: 'Signup_Trial',
        home: Builder(
            builder: (context) => Scaffold(
                  backgroundColor: Color(0xFF00B1D2),
                  appBar: new AppBar(
                    title: new Text('SIGN UP'),
                    backgroundColor: Color(0xFF1C3BC8),
                  ),
                  body: new Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      mainAxisSize: MainAxisSize.max,
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: <Widget>[
                        new Text(
                          "Full Name",
                          style: new TextStyle(
                              fontSize: 20.0,
                              color: const Color(0xFFFFFFFF),
                              fontWeight: FontWeight.w400,
                              fontFamily: "Roboto"),
                        ),
                        new TextField(
                          style: new TextStyle(
                              fontSize: 25.0,
                              color: const Color(0xFF000000),
                              fontWeight: FontWeight.w600,
                              fontFamily: "Roboto"),
                        ),
                        new Text(
                          "New SSID",
                          style: new TextStyle(
                              fontSize: 20.0,
                              color: const Color(0xFFFFFFFF),
                              fontWeight: FontWeight.w400,
                              fontFamily: "Roboto"),
                        ),
                        new TextField(
                          style: new TextStyle(
                              fontSize: 25.0,
                              color: const Color(0xFF000000),
                              fontWeight: FontWeight.w600,
                              fontFamily: "Roboto"),
                        ),
                        new Text(
                          "Password",
                          style: new TextStyle(
                              fontSize: 20.0,
                              color: const Color(0xFFFFFFFF),
                              fontWeight: FontWeight.w400,
                              fontFamily: "Roboto"),
                        ),
                        new TextField(
                          style: new TextStyle(
                              fontSize: 25.0,
                              color: const Color(0xFF000000),
                              fontWeight: FontWeight.w600,
                              fontFamily: "Roboto"),
                        ),
                        new Text(
                          "Confirm Password",
                          style: new TextStyle(
                              fontSize: 20.0,
                              color: const Color(0xFFFFFFFF),
                              fontWeight: FontWeight.w400,
                              fontFamily: "Roboto"),
                        ),
                        new TextField(
                          style: new TextStyle(
                              fontSize: 25.0,
                              color: const Color(0xFF000000),
                              fontWeight: FontWeight.w600,
                              fontFamily: "Roboto"),
                        ),
                        new Padding(
                          child: new SizedBox(
                            width: 210.0,
                            height: 50.0,
                            child: new RaisedButton(
                                key: null,
                                onPressed: () {
                                  tts.tellPress("SIGN UP");
                                  _startTimer();
                                  if (goOrNot(0)) {
                                    Navigator.pushNamed(context, '/sign up');
                                  }
                                },
                                color: const Color(0xFF266EC0),
                                child: new Text(
                                  "SIGN UP",
                                  style: new TextStyle(
                                      fontSize: 35.0,
                                      color: const Color(0xFFFFFFFF),
                                      fontWeight: FontWeight.w400,
                                      fontFamily: "Roboto"),
                                )),
                          ),
                          padding:
                              const EdgeInsets.fromLTRB(50.0, 50.0, 50.0, 25.0),
                        ),
                        new Padding(
                          child: new SizedBox(
                            width: 210.0,
                            height: 50.0,
                            child: new RaisedButton(
                                key: null,
                                onPressed: () {
                                  tts.tellPress("LOGIN");
                                  _startTimer();
                                  if (goOrNot(0)) {
                                    Navigator.pushNamed(context, '/login');
                                  }
                                },
                                color: const Color(0xFF266EC0),
                                child: new Text(
                                  "LOGIN",
                                  style: new TextStyle(
                                      fontSize: 35.0,
                                      color: const Color(0xFFFFFFFF),
                                      fontWeight: FontWeight.w400,
                                      fontFamily: "Roboto"),
                                )),
                          ),
                          padding:
                              const EdgeInsets.fromLTRB(50.0, 50.0, 50.0, 25.0),
                        )
                      ]),
                )));
  }
}
