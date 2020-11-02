import 'package:amplify_auth_cognito/amplify_auth_cognito.dart';
import 'package:authentication_trial/wrapper.dart';
import 'package:flutter/material.dart';
import 'package:amplify_core/amplify_core.dart';



class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {

  bool isSignedIn=false;  

  TextEditingController usernameController=new TextEditingController();
  TextEditingController passwordController=new TextEditingController();


  void _login() async{

       try{
         SignInResult res= await Amplify.Auth.signIn(username: usernameController.text, password: passwordController.text);
         print("Result of Sign is is:- "+res.isSignedIn.toString());
         setState(() {
           isSignedIn=true;
         });
       }catch(e){
         print("login exception founr:- "+e.toString());
       }

  } 

  @override
  Widget build(BuildContext context) {
    if(isSignedIn)
      return Wrapper();
    else
      return MaterialApp(
        title:"Login Page",
        home: Scaffold(appBar:AppBar(title: Text("Login Page"),),
                       body: Column(children: <Widget>[
                             TextField(controller: usernameController,
                             ),     
                             TextField(controller: passwordController),  
                             RaisedButton(onPressed: (){
                               _login();
                             },
                                          child:Text("Login")   )            

                       ],),  
        
        
        
        
        )

    );
        
  }
}