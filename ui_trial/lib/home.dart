import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:ui_trial/initialisation.dart';
import 'mute.dart';

class Home extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp,DeviceOrientation.portraitDown,]);
    return  MaterialApp(
            routes: {
                 '/mute':(context)=>Mute(),
                 '/initialisation':(context)=> Initialisation()
                  },
            title:"home_trial",
            home: Builder(builder: (context)=>   
            Scaffold(
        appBar: new AppBar(
          title: new Text('Virtual Personal Assistant'),
          ),
        body:
          new Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              new Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: <Widget>[
                  new SizedBox(
                    width: 180.0,
                    height: 312.0,
                    child:
                      new RaisedButton(key:null, onPressed:(){},
                        color: const Color(0xFFe0e0e0),
                        child:
                          new Text(
                          "SEND SOS",
                            style: new TextStyle(fontSize:22.0,
                            color: const Color(0xFF000000),
                            fontWeight: FontWeight.w400,
                            fontFamily: "Roboto"),
                          )
                        ),
    
                  ),
    
                  new Padding(
                    padding: const EdgeInsets.all(0.0),
                  ),
    
                  new SizedBox(
                    width: 180.0,
                    height: 312.0,
                    child:
                      new RaisedButton(key:null, onPressed:(){Navigator.pushNamed(context,'/mute');},
                        color: const Color(0xFFe0e0e0),
                        child:
                          new Text(
                          "MUTE AUDIO",
                            style: new TextStyle(fontSize:22.0,
                            color: const Color(0xFF000000),
                            fontWeight: FontWeight.w400,
                            fontFamily: "Roboto"),
                          )
                        ),
    
                  )
                ]
    
              ),
    
              new Padding(
                padding: const EdgeInsets.all(0.0),
              ),
    
              new Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: <Widget>[
                  new SizedBox(
                   width: 180.0,
                   height: 312.0,
                    child:
                      new RaisedButton(key:null, onPressed:(){},
                        color: const Color(0xFFe0e0e0),
                        child:
                          new Text(
                          "NAVIGATION",
                            style: new TextStyle(fontSize:22.0,
                            color: const Color(0xFF000000),
                            fontWeight: FontWeight.w400,
                            fontFamily: "Roboto"),
                          )
                        ),
    
                  ),
    
                  new Padding(
                    padding: const EdgeInsets.all(0.0),
                  ),
    
                  new SizedBox(
                    width: 180.0,
                    height: 312.0,
                    child:
                      new RaisedButton(key:null, onPressed:(){Navigator.pushNamed(context,'/initialisation'); },
                        color: const Color(0xFFe0e0e0),
                        child:
                          new Text(
                          "INITIALISATION",
                            style: new TextStyle(fontSize:15.0,
                            color: const Color(0xFF000000),
                            fontWeight: FontWeight.w400,
                            fontFamily: "Roboto"),
                          )
                        ),
    
                  )
                ]
    
              )
            ]
    
          ),
    
      )
      
      )

    );
  }
}