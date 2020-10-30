import 'package:flutter/material.dart';
import 'package:ui_trial/initialisation.dart';
import 'home.dart';

class SaveContacts extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
         '/initialisation':(context)=>Initialisation()
      },
      title:'SaveContacts_trial',
      home: Builder(builder: (context)=>
      Scaffold(
        appBar: new AppBar(
           leading: IconButton(
                     icon: Icon(Icons.arrow_back_rounded, color: Colors.white),
                     onPressed: () => Navigator.pushNamed(context, '/initialisation'),
                 ),
          title: new Text('Save Contacts'),
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
                  "SAVE CONTACT 1",
                    style: new TextStyle(fontSize:36.0,
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
                  "SAVE CONTACT 2",
                    style: new TextStyle(fontSize:36.0,
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
                  "SAVE CONTACT 3",
                    style: new TextStyle(fontSize:36.0,
                    color: const Color(0xFF000000),
                    fontWeight: FontWeight.w400,
                    fontFamily: "Roboto"),
                  )
                )
            ]
    
          ),
    
      )
      )
      
    );
  }
}