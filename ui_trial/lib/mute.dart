import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:ui_trial/TextToSpeech.dart';
import 'home.dart';
import 'dart:async';

class Mute extends StatelessWidget {
  TextToSpeech tts = new TextToSpeech();


  final timeout = const Duration(seconds: 3);

  var go = [
    false,
    false,
    false,
    false,
    false
  ]; //0:muteobs,1:muteele,2:mutelow,3:mutewet,4:unmuteall

  bool goOrNot(int touch) {
    if (go[touch]) {
      go[touch] = false;
      return true;
    } else {
      for (int i = 0; i < 5; i++) {
        if (i == touch)
          go[touch] = true;
        else
          go[i] = false;
      }
    }
    return false;
  }

  void cancelTouch() {
    for (int i = 0; i < 5; i++) go[i] = false;
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
    tts.tellCurrentScreen("Mute");
    return MaterialApp(
      routes: {'/home': (context) => Home()},
      title: 'mute_trial',
      home: Builder(
          builder: (context) => Scaffold(
                backgroundColor: Color(0xFF00B1D2),
                appBar: new AppBar(
                  leading: IconButton(
                    icon: Icon(Icons.arrow_back_rounded, color: Colors.white),
                    onPressed: () => Navigator.pushNamed(context, '/home'),
                  ),
                  title: new Text('Mute'),
                  backgroundColor: Color(0xFF1C3BC8),
                ),
                body: GestureDetector(
                    behavior: HitTestBehavior.opaque,
                      onHorizontalDragEnd: (details){
                          tts.tellCurrentScreen("Mute");
                      },
                     child: new Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: <Widget>[
                      new RaisedButton(
                          key: null,
                          onPressed: () {
                            tts.tellPress("MUTE OBSTACLE");
                            _startTimer();
                            if (goOrNot(0)) {}
                          },
                          padding: EdgeInsets.fromLTRB(30, 30, 30, 30),
                          color: const Color(0xFF266EC0),
                          child: new Text(
                            "MUTE OBSTACLE DETECTION",
                            textAlign: TextAlign.center,
                            style: new TextStyle(
                                fontSize: 22.0,
                                color: const Color(0xFFFFFFFF),
                                fontWeight: FontWeight.w400,
                                fontFamily: "Roboto"),
                          )),
                      new RaisedButton(
                          key: null,
                          onPressed: () {
                            tts.tellPress("MUTE ELEVATED SURFACE");
                            _startTimer();
                            if (goOrNot(1)) {}
                          },
                          color: const Color(0xFF266EC0),
                          padding: EdgeInsets.fromLTRB(30, 30, 30, 30),
                          child: new Text(
                            "MUTE ELEVATED SURFACE DETECTION",
                            textAlign: TextAlign.center,
                            style: new TextStyle(
                                fontSize: 22.0,
                                color: const Color(0xFFFFFFFF),
                                fontWeight: FontWeight.w400,
                                fontFamily: "Roboto"),
                          )),
                      new RaisedButton(
                          key: null,
                          onPressed: () {
                            tts.tellPress("MUTE LOWERED SURFACE");
                            _startTimer();
                            if (goOrNot(2)) {}
                          },
                          color: const Color(0xFF266EC0),
                          padding: EdgeInsets.fromLTRB(30, 30, 30, 30),
                          child: new Text(
                            "MUTE LOWERED SURFACE DETECTION",
                            textAlign: TextAlign.center,
                            style: new TextStyle(
                                fontSize: 22.0,
                                color: const Color(0xFFFFFFFF),
                                fontWeight: FontWeight.w400,
                                fontFamily: "Roboto"),
                          )),
                      new RaisedButton(
                          key: null,
                          onPressed: () {
                            tts.tellPress("MUTE WET SURFACE");
                            _startTimer();
                            if (goOrNot(3)) {}
                          },
                          color: const Color(0xFF266EC0),
                          padding: EdgeInsets.fromLTRB(30, 30, 30, 30),
                          child: new Text(
                            "MUTE WET SURFACE DETECTION",
                            textAlign: TextAlign.center,
                            style: new TextStyle(
                                fontSize: 22.0,
                                color: const Color(0xFFFFFFFF),
                                fontWeight: FontWeight.w400,
                                fontFamily: "Roboto"),
                          )),
                      new RaisedButton(
                          key: null,
                          onPressed: () {
                            tts.tellPress("UNMUTE ALL");
                            _startTimer();
                            if (goOrNot(4)) {}
                          },
                          color: const Color(0xFF266EC0),
                          padding: EdgeInsets.fromLTRB(30, 30, 30, 30),
                          child: new Text(
                            "UNMUTE ALL",
                            textAlign: TextAlign.center,
                            style: new TextStyle(
                                fontSize: 22.0,
                                color: const Color(0xFFFFFFFF),
                                fontWeight: FontWeight.w400,
                                fontFamily: "Roboto"),
                          ))
                    ])  )
                
                
                
              )),
    );
  }
}
