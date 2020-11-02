import 'package:flutter/material.dart';

import 'login.dart';



class SignUp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        '/login':(context)=>Login()
      },
      title:'Signup_Trial',
      home: Builder(builder: (context)=>
      Scaffold(
        appBar: new AppBar(
          title: new Text('Sign Up'),
          ),
        body:
          new Column(
            mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
                  new Text(
              "Full Name",
                style: new TextStyle(fontSize:25.0,
                color: const Color(0xFF000000),
                fontWeight: FontWeight.w400,
                fontFamily: "Roboto"),
              ),
    
              new TextField(
                style: new TextStyle(fontSize:12.0,
                color: const Color(0xFF000000),
                fontWeight: FontWeight.w200,
                fontFamily: "Roboto"),
              ),
    
              new Text(
              "New SSID",
                style: new TextStyle(fontSize:25.0,
                color: const Color(0xFF000000),
                fontWeight: FontWeight.w400,
                fontFamily: "Roboto"),
              ),
    
              new TextField(
                style: new TextStyle(fontSize:12.0,
                color: const Color(0xFF000000),
                fontWeight: FontWeight.w200,
                fontFamily: "Roboto"),
              ),
    
              new Text(
              "Password",
                style: new TextStyle(fontSize:25.0,
                color: const Color(0xFF000000),
                fontWeight: FontWeight.w400,
                fontFamily: "Roboto"),
              ),
    
              new TextField(
                style: new TextStyle(fontSize:12.0,
                color: const Color(0xFF000000),
                fontWeight: FontWeight.w200,
                fontFamily: "Roboto"),
              ),
    
              new Text(
              "Confirm Password",
                style: new TextStyle(fontSize:25.0,
                color: const Color(0xFF000000),
                fontWeight: FontWeight.w400,
                fontFamily: "Roboto"),
              ),
    
              new TextField(
                style: new TextStyle(fontSize:12.0,
                color: const Color(0xFF000000),
                fontWeight: FontWeight.w200,
                fontFamily: "Roboto"),
              ),
    
              new Padding(
                child:
                  new SizedBox(
                    width: 210.0,
                    height: 50.0,
                    child:
                      new RaisedButton(key:null, onPressed:(){},
                        color: const Color(0xFFe0e0e0),
                        child:
                          new Text(
                          "SIGN UP",
                            style: new TextStyle(fontSize:35.0,
                            color: const Color(0xFF000000),
                            fontWeight: FontWeight.w400,
                            fontFamily: "Roboto"),
                          )
                        ),
    
                  ),
    
                padding: const EdgeInsets.fromLTRB(50.0, 50.0, 50.0, 25.0),
              ),
              
              new Padding(
                child:
                  new SizedBox(
                    width: 210.0,
                    height: 50.0,
                    child:
                      new RaisedButton(key:null, onPressed:(){Navigator.pushNamed(context, '/login');},
                        color: const Color(0xFFe0e0e0),
                        child:
                          new Text(
                          "Login",
                            style: new TextStyle(fontSize:35.0,
                            color: const Color(0xFF000000),
                            fontWeight: FontWeight.w400,
                            fontFamily: "Roboto"),
                          )
                        ),
    
                  ),
    
                padding: const EdgeInsets.fromLTRB(50.0, 50.0, 50.0, 25.0),
              )
            ]
    
          ),
    
      )
      
      )
    );
  }
}