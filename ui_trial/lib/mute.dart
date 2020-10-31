import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:ui_trial/TextToSpeech.dart';
import 'home.dart';

class Mute extends StatelessWidget {

  TextToSpeech tts=new TextToSpeech();

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp,DeviceOrientation.portraitDown,]);
    tts.tellCurrentScreen("Mute");
    return MaterialApp(
      routes: {
        '/home':(context)=>Home()
      },
      title:'mute_trial',
      home: Builder(builder: (context)=>
      Scaffold(
        appBar: new AppBar(
          leading: IconButton(
                     icon: Icon(Icons.arrow_back_rounded, color: Colors.white),
                     onPressed: () => Navigator.pushNamed(context, '/home'),
                 ),
          title: new Text('Mute'),
          ),
        body:
          new Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              new RaisedButton(key:null, onPressed:(){},
              padding: EdgeInsets.fromLTRB(30, 30, 30, 30),
                color: const Color(0xFFe0e0e0),
                child:
                  new Text(
                  "MUTE OBSTACLE DETECTION",
                    style: new TextStyle(fontSize:22.0,
                    color: const Color(0xFF000000),
                    fontWeight: FontWeight.w400,
                    fontFamily: "Roboto"),
                  )
                ),
    
              new RaisedButton(key:null, onPressed:(){},
                color: const Color(0xFFe0e0e0),
                padding: EdgeInsets.fromLTRB(30, 30, 30, 30),
                child:
                  new Text(
                  "MUTE ELEVATED SURFACE DETECTION",
                    style: new TextStyle(fontSize:18.0,
                    color: const Color(0xFF000000),
                    fontWeight: FontWeight.w400,
                    fontFamily: "Roboto"),
                  )
                ),
    
              new RaisedButton(key:null, onPressed:(){},
                color: const Color(0xFFe0e0e0),
                padding: EdgeInsets.fromLTRB(30, 30, 30, 30),
                child:
                  new Text(
                  "MUTE LOWERED SURFACE DETECTION",
                    style: new TextStyle(fontSize:18.0,
                    color: const Color(0xFF000000),
                    fontWeight: FontWeight.w400,
                    fontFamily: "Roboto"),
                  )
                ),
    
              new RaisedButton(key:null, onPressed:(){},
                color: const Color(0xFFe0e0e0),
                padding: EdgeInsets.fromLTRB(30, 30, 30, 30),
                child:
                  new Text(
                  "MUTE WET SURFACE DETECTION",
                    style: new TextStyle(fontSize:18.0,
                    color: const Color(0xFF000000),
                    fontWeight: FontWeight.w400,
                    fontFamily: "Roboto"),
                  )
                ),
    
              new RaisedButton(key:null, onPressed:(){},
                color: const Color(0xFFe0e0e0),
                padding: EdgeInsets.fromLTRB(30, 30, 30, 30),
                child:
                  new Text(
                  "UNMUTE ALL",
                    style: new TextStyle(fontSize:22.0,
                    color: const Color(0xFF000000),
                    fontWeight: FontWeight.w400,
                    fontFamily: "Roboto"),
                  )
                )
            ]
    
          ),
    
      )
       
      ),

    );
  }
}