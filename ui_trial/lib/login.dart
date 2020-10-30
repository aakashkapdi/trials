import 'package:flutter_tts/flutter_tts.dart';
import 'package:flutter/services.dart';
import 'package:flutter/material.dart';
import 'Signup.dart';
import 'home.dart';

class Login extends StatelessWidget {
  
  final FlutterTts flutterTts=FlutterTts();

  Future _speak() async{
    await flutterTts.speak("hi");
  }

  @override
  Widget build(BuildContext context) {
    _speak();
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp,DeviceOrientation.portraitDown,]);
    return MaterialApp(
      routes: {
        '/home':(context)=>Home(),
        '/signup':(context)=>SignUp()
      },
      title:'login_trial', 
      home:Builder(builder: (context)=>
       Scaffold(
        appBar: new AppBar(
          title: new Text('LogIn'),
          ),
        body:new Column(
            mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
                SizedBox(
                height:100
              ),

              new Text(
              "Username",
                style: new TextStyle(fontSize:17.0,
                color: const Color(0xFF000000),
                fontWeight: FontWeight.w400,
                fontFamily: "Roboto"),
              ),
    
              new TextField(
                style: new TextStyle(fontSize:15.0,
                color: const Color(0xFF000000),
                fontWeight: FontWeight.w200,
                fontFamily: "Roboto"),
                
              ),
    
              new Text(
              "Password",
                style: new TextStyle(fontSize:17.0,
                color: const Color(0xFF000000),
                fontWeight: FontWeight.w400,
                fontFamily: "Roboto"),
                
              ),
    
              new TextField(
                style: new TextStyle(fontSize:15.0,
                color: const Color(0xFF000000),
                fontWeight: FontWeight.w200,
                fontFamily: "Roboto"),
                keyboardType:TextInputType.numberWithOptions()
              ),
    
              new Padding(
                child:
                  new SizedBox(
                    width: 200.0,
                    height: 50.0,
                    child:
                      new RaisedButton(key:null, 
                                       onPressed:(){ 
                                        Navigator.pushNamed(context,'/home');},
                        color: const Color(0xFFe0e0e0),
                        child:
                          new Text(
                          "LOGIN",
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
                    width: 200.0,
                    height: 50.0,
                    child:
                      new RaisedButton(key:null, 
                                       onPressed:(){Navigator.pushNamed(context,'/signup');},
                        color: const Color(0xFFe0e0e0),
                        child:
                          new Text(
                          "Sign Up",
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
        ))
      
      
      
     
    
    
      
    );
  }
}
