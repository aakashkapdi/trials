import 'package:amplify_auth_cognito/amplify_auth_cognito.dart';
import 'package:authentication_trial/wrapper.dart';
import 'package:flutter/material.dart';
import 'package:amplify_core/amplify_core.dart';
import 'package:amplify_storage_s3/amplify_storage_s3.dart';
import 'amplifyconfiguration.dart';


class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {

  bool isSignedIn=false;  
  bool _amplifyConfigured=false;

  TextEditingController usernameController=new TextEditingController();
  TextEditingController passwordController=new TextEditingController();


  Amplify amplifyInstance = Amplify();
  AmplifyAuthCognito auth = AmplifyAuthCognito();
  AmplifyStorageS3 storage = AmplifyStorageS3();

   void configureAuthStorage() async{
  if(_amplifyConfigured){
    return;
  }
  try{
        amplifyInstance.addPlugin(authPlugins: [auth],storagePlugins: [storage]);
        amplifyInstance.configure(amplifyconfig);
        _amplifyConfigured=true;
        print(">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>.amplify configured in Login Page");
      }catch(e){
        print("following error occurred during amplify configuration in home page:- "+e.toString());
      }
    }
  


  void _login() async{
    configureAuthStorage();

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