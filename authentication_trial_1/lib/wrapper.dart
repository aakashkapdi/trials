import 'package:amplify_core/amplify_core.dart';
import 'package:flutter/material.dart';
import 'package:amplify_auth_cognito/amplify_auth_cognito.dart';
import 'package:amplify_storage_s3/amplify_storage_s3.dart';
import 'login.dart';
import 'home.dart';
import 'amplifyconfiguration.dart';



class Wrapper extends StatefulWidget {
  @override
  _WrapperState createState() => _WrapperState();
}

class _WrapperState extends State<Wrapper> {

  
  bool _amplifyConfigured=false;
  bool isSigned=false;
  
  Amplify amplifyInstance = Amplify();
  AmplifyAuthCognito auth = AmplifyAuthCognito();
  AmplifyStorageS3 storage = AmplifyStorageS3();

  // Configure Amplify
  void configureAmplify() async {
    if(!_amplifyConfigured){
      try{
        amplifyInstance.addPlugin(authPlugins: [auth],storagePlugins: [storage]);
        amplifyInstance.configure(amplifyconfig);
        _amplifyConfigured=true;
        print(">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>amplify configured in Wrapper Page");

      }catch(e){
        print("following error occurred during amplify configuration in wrapper page:- "+e.toString());
      }
    }
    try {
      isSigned = await _isSignedIn();
    } on AuthError catch(e) {
      print("User is not signed in.");
    }
  }

  Future<bool> _isSignedIn() async {
    final session = await Amplify.Auth.fetchAuthSession();
    setState(() {
      isSigned=session.isSignedIn;
    });
    return session.isSignedIn;
  }
  

  @override
  Widget build(BuildContext context) {
  configureAmplify();
  print("isSigned(inside build):"+isSigned.toString());
  if(isSigned)
       return Home();
    else  
       return Login();   
  }
}
