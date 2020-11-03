import 'package:flutter/services.dart';
import 'package:flutter/material.dart';
import 'SignUpStick.dart';
import 'SignUpUser.dart';
import 'home.dart';
import 'package:ui_trial/TextToSpeech.dart';
import 'dart:async';

class Login extends StatelessWidget {
  TextToSpeech tts = new TextToSpeech();

  TextEditingController usernameController=new TextEditingController();
  TextEditingController passwordController=new TextEditingController();
  

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
    tts.tellCurrentScreen("Log in");
    return MaterialApp(
        routes: {
          '/home': (context) => Home(),
          '/signup': (context) => SignUpUser()
        },
        title: 'login_trial',
        home: Builder(
            builder: (context) => Scaffold(
                  backgroundColor: Color(0xFF00B1D2),
                  appBar: new AppBar(
                    title: new Text('LOGIN'),
                    backgroundColor: Color(0xFF1C3BC8),
                  ),
                  body: GestureDetector(
                    behavior: HitTestBehavior.opaque,
                      onHorizontalDragEnd: (details){
                          tts.tellCurrentScreen("Login");
                      },
                     child:     
                  SingleChildScrollView(
                    child:
                      new Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      mainAxisSize: MainAxisSize.max,
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: <Widget>[
                        SizedBox(height: 50),
                        GestureDetector(
                          onDoubleTap: (){
                            if(!usernameController.text.isEmpty)
                              tts.promptInput(usernameController.text); 
                          },
                          child: Column(
                            children:<Widget>[
                                    new Text(
                          "Username",
                          style: new TextStyle(
                              fontSize: 20.0,
                              color: const Color(0xFFFFFFFF),
                              fontWeight: FontWeight.w400,
                              fontFamily: "Roboto"),
                        ),
                        new TextField(
                          controller: usernameController,
                          style: new TextStyle(
                              fontSize: 25.0,
                              color: const Color(0xFF000000),
                              fontWeight: FontWeight.w600,
                              fontFamily: "Roboto"),
                                onTap: (){
                                if(usernameController.text.isEmpty)
                                tts.promptInput("Enter your username");
                              },
                              onChanged: (value) {
                                tts.inputPlayback(value);
                              },
                        ),

                            ]
                          ),
                        ),
                          GestureDetector(
                            onDoubleTap: (){
                            if(!passwordController.text.isEmpty)
                              tts.promptInput(passwordController.text); 
                          },
                          child:Column(children: <Widget>[
                            new Text(
                          "Enter Password ",
                          style: new TextStyle(
                              fontSize: 20.0,
                              color: const Color(0xFFFFFFFF),
                              fontWeight: FontWeight.w400,
                              fontFamily: "Roboto"),
                        ),
                        new TextField(
                          obscureText: true,
                          controller: passwordController,
                          style: new TextStyle(
                              fontSize: 25.0,
                              color: const Color(0xFF000000),
                              fontWeight: FontWeight.w600,
                              fontFamily: "Roboto"),
                              keyboardType:TextInputType.number ,
                              onTap: (){
                                if(passwordController.text.isEmpty)
                                   tts.promptInput("Enter your password");
                              },
                              onChanged: (value) {
                                tts.inputPlayback(value);
                              },
                        ),


                          ],) 

                        ),
                        new Padding(
                          child: new SizedBox(
                            width: 200.0,
                            height: 50.0,
                            child: new RaisedButton(
                                key: null,
                                onPressed: () {
                                  tts.tellPress("LOGIN");
                                  _startTimer();
                                  if (goOrNot(0)) {
                                    Navigator.pushNamed(context, '/home');
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
                        ),
                        new Padding(
                          child: new SizedBox(
                            width: 200.0,
                            height: 50.0,
                            child: new RaisedButton(
                                key: null,
                                onPressed: () {
                                  tts.tellPress("SIGN UP");
                                  _startTimer();
                                  if (goOrNot(1)) {
                                    Navigator.pushNamed(context, '/signup');
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
                        )
                      ])
                  )

                  )
                  
                  
                  
              
                  
                  
                  
                
                )));
  }
}
