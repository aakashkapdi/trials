import 'package:flutter/material.dart';
import 'package:amplify_core/amplify_core.dart';
import 'amplifyconfiguration.dart';
import 'package:amplify_auth_cognito/amplify_auth_cognito.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool _amplifyConfigured = false;
  bool isSignUpComplete = false;
  TextEditingController username_controller=new TextEditingController();
  TextEditingController password_controller=new TextEditingController();
  TextEditingController phone_controller=new TextEditingController();

  // Instantiate Amplify
  Amplify amplifyInstance = Amplify();
  AmplifyAuthCognito auth = AmplifyAuthCognito();
      

  @override
  void initState() {
    super.initState();
    _configureAmplify(); 
  }

  void _configureAmplify() async {
    if (!mounted) return;
    if(!_amplifyConfigured){
      try{
        await amplifyInstance.addPlugin(authPlugins: [auth]);
        await amplifyInstance.configure(amplifyconfig);
        setState(() {
          _amplifyConfigured=true;
        });

      }catch(e){
        print("following error occurred:- "+e.toString());
      }
    }
  }

  void _recordEvent() async {
      
      try{
         Map<String, dynamic> userAttributes = {
                     "preferred_username": username_controller.text,
                     "phone_number": phone_controller.text,
           };
         SignUpResult res = await Amplify.Auth.signUp(
                  username: "myusername",
                  password: "mysupersecurepassword",
                  options: CognitoSignUpOptions(
                  userAttributes: userAttributes
                 )
               );  
          setState(() {
            isSignUpComplete = res.isSignUpComplete;
          });      

      }catch(e){
        print("following error occurred:- "+e.toString());
      }     

  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(
            title: const Text('Amplify Core example app'),
          ),
          body: ListView(padding: EdgeInsets.all(10.0), children: <Widget>[
            Center( 
              child: Column (
                children: [
                  const Padding(padding: EdgeInsets.all(5.0)),
                  Text(
                    _amplifyConfigured ? "configured" : "not configured"
                  ),
                  Text(
                    isSignUpComplete ? " Sign Up" : " no Sign Up"
                  ),
                  TextField( controller: username_controller,
                  ), 
                  TextField( controller: password_controller,
                  ), 
                  TextField( controller: phone_controller,
                  ),                  
                  RaisedButton(
                    onPressed: _amplifyConfigured ? _recordEvent : null,
                    child: const Text('SignUp')
                  )
                  
                ]
              ),
            )
          ])
      )
    );
  }
}
