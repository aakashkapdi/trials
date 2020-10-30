
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:ui_trial/initialisation.dart';
import 'home.dart';



class SaveFaces extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp,DeviceOrientation.portraitDown,]);
    return MaterialApp(
      routes: {
        '/initialisation':(context)=>Initialisation()
      },
      title: 'SaveFaces_trial',
      home: Builder(builder: (context)=>
      Scaffold(
        appBar: new AppBar(
          leading: IconButton(
                     icon: Icon(Icons.arrow_back_rounded, color: Colors.white),
                     onPressed: () => Navigator.pushNamed(context, '/initialisation'),
                 ),
          title: new Text('App Name'),
          ),
        body:
          new Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              new RaisedButton(key:null, onPressed:(){},
                color: const Color(0xFFe0e0e0),
                child:
                  new Text(
                  "SAVE FACES",
                    style: new TextStyle(fontSize:50.0,
                    color: const Color(0xFF000000),
                    fontWeight: FontWeight.w400,
                    fontFamily: "Roboto"),
                  )
                ),
            ]
    
          ),
    
      )
      
      
      )
    );
  }
}