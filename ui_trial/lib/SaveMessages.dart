import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:ui_trial/initialisation.dart';

import 'home.dart';



class SaveMessages extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp,DeviceOrientation.portraitDown,]);
    return MaterialApp(
      routes: {
        '/home':(context)=>Home()
      },
      title: 'SaveMessages_trial',
      home: Builder(builder: (contaxt)=>
      Scaffold(
        appBar: new AppBar(
          leading: IconButton(
                     icon: Icon(Icons.arrow_back_rounded, color: Colors.white),
                     onPressed: () => Navigator.pushNamed(context, '/home'),
                 ),
          title: new Text('Save Message'),
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
                  "RECORD SOS MESSAGE",
                    style: new TextStyle(fontSize:29.0,
                    color: const Color(0xFF000000),
                    fontWeight: FontWeight.w400,
                    fontFamily: "Roboto"),
                  )
                ),
    
              new RaisedButton(key:null, onPressed:(){},
                padding: EdgeInsets.fromLTRB(30, 30, 30, 30),
                color: const Color(0xFFe0e0e0),
                child:
                  new Text(
                  "RECITE SOS MESSAGE",
                    style: new TextStyle(fontSize:29.0,
                    color: const Color(0xFF000000),
                    fontWeight: FontWeight.w400,
                    fontFamily: "Roboto"),
                  )
                ),
    
              new RaisedButton(key:null, onPressed:(){},
                padding: EdgeInsets.fromLTRB(30, 30, 30, 30),
                color: const Color(0xFFe0e0e0),
                child:
                  new Text(
                  "RECORD USER - FALL MESSAGE",
                    style: new TextStyle(fontSize:29.0,
                    color: const Color(0xFF000000),
                    fontWeight: FontWeight.w400,
                    fontFamily: "Roboto"),
                  )
                ),
    
              new RaisedButton(key:null, onPressed:(){},
                padding: EdgeInsets.fromLTRB(30, 30, 30, 30),
                color: const Color(0xFFe0e0e0),
                child:
                  new Text(
                  "RECITE USER - FALL MESSAGE",
                    style: new TextStyle(fontSize:29.0,
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