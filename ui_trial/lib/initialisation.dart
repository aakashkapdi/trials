
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:ui_trial/SaveMessages.dart';
import 'package:ui_trial/saveContacts.dart';
import 'package:ui_trial/saveFaces.dart';
import 'home.dart';


 class Initialisation extends StatelessWidget {

   @override
   Widget build(BuildContext context) {
   SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp,DeviceOrientation.portraitDown,]);

   return MaterialApp(
       routes: {
         '/home':(context)=>Home(),
         '/SaveContacts':(context)=>SaveContacts(),
         '/SaveFaces':(context)=>SaveFaces(),
         '/SaveSos':(context)=>SaveMessages()
       },
       title: 'initialisation_trial',
       home: Builder(builder: (context)=>
       Scaffold(
        appBar: new AppBar(
          leading: IconButton(
                     icon: Icon(Icons.arrow_back_rounded, color: Colors.white),
                     onPressed: () => Navigator.pushNamed(context, '/home'),
                 ),
          title: new Text('Initialisation'),
          ),
        body:
          new Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              new RaisedButton(key:null, onPressed:(){Navigator.pushNamed(context, '/SaveContacts');},
                padding: EdgeInsets.fromLTRB(30, 30, 30, 30),
                color: const Color(0xFFe0e0e0),
                child:
                  new Text(
                  "SAVE CONTACTS",
                    style: new TextStyle(fontSize:34.0,
                    color: const Color(0xFF000000),
                    fontWeight: FontWeight.w400,
                    fontFamily: "Roboto"),
                  )
                ),
    
              new RaisedButton(key:null, onPressed:(){Navigator.pushNamed(context, '/SaveFaces');},
                padding: EdgeInsets.fromLTRB(30, 30, 30, 30),
                color: const Color(0xFFe0e0e0),
                child:
                  new Text(
                  "SAVE FACES",
                    style: new TextStyle(fontSize:34.0,
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
                  "SAVE MAPS",
                    style: new TextStyle(fontSize:34.0,
                    color: const Color(0xFF000000),
                    fontWeight: FontWeight.w400,
                    fontFamily: "Roboto"),
                  )
                ),
    
              new RaisedButton(key:null, onPressed:(){Navigator.pushNamed(context, '/SaveSos');},
                padding: EdgeInsets.fromLTRB(30, 30, 30, 30),
                color: const Color(0xFFe0e0e0),
                child:
                  new Text(
                  "SAVE PRE-DEFINED MESSAGE",
                    style: new TextStyle(fontSize:22.0,
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
                  "RESET",
                    style: new TextStyle(fontSize:34.0,
                    color: const Color(0xFF000000),
                    fontWeight: FontWeight.w400,
                    fontFamily: "Roboto"),
                  )
                )
            ]
    
          ),
       )
      )
       ,
     );
   }
 }