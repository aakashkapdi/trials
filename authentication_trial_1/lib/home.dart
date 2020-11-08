import 'dart:io';
import 'dart:typed_data';
import 'package:amplify_auth_cognito/amplify_auth_cognito.dart';
import 'package:authentication_trial/UploadImages.dart';
import 'package:authentication_trial/wrapper.dart';
import 'package:flutter/material.dart';
import 'package:amplify_core/amplify_core.dart';
import 'package:amplify_storage_s3/amplify_storage_s3.dart';
import 'amplifyconfiguration.dart';
import 'package:file_picker/file_picker.dart';
import 'package:aws_rekognition_api/rekognition-2016-06-27.dart' as rk;




class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  TextEditingController img1_controller=TextEditingController();
  TextEditingController img2_controller=TextEditingController();

  bool isSignedIn=true;
  bool _amplifyConfigured=false;

  Image img1,img2;

  Amplify amplifyInstance = Amplify();
  AmplifyAuthCognito auth = AmplifyAuthCognito();
  AmplifyStorageS3 storage = AmplifyStorageS3();


  //Rekognition
  rk.Rekognition obj= new rk.Rekognition(region:'us-east-1',credentials: rk.AwsClientCredentials(accessKey: "AKIAQMSRPZQUYIDYW7VK",secretKey: "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"));


  void _signout()async{
     try{
       await Amplify.Auth.signOut();
       setState(() {
         isSignedIn=false;
       });
     }catch(e){
       print("Error Occurred during Signout"+e.toString());
     }

  }

  void configureAuthStorage() async{
  if(_amplifyConfigured){
    return;
  }
  try{
        amplifyInstance.addPlugin(authPlugins: [auth],storagePlugins: [storage]);
        amplifyInstance.configure(amplifyconfig);
        _amplifyConfigured=true;
        print(">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>.amplify configured in Home Page");
      }catch(e){
        print("following error occurred during amplify configuration in home page:- "+e.toString());
      }
    }

  

  void uploadImage(String key1) async{
    configureAuthStorage();
    AuthUser auth_result=await Amplify.Auth.getCurrentUser();
    String key=auth_result.userId.toString()+"/"+key1;
    File res,local;
    try{
      res= await FilePicker.getFile(type:FileType.image);
      local= File(res.absolute.path); 
      

    }catch(e){
      print("Error while Picking the file:- "+e.toString());
    }
    try{

      UploadFileResult result= await Amplify.Storage.uploadFile(local: local, key: key);
      print(">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>File uploaded Successfully");
      print(">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>"+result.toString());
      




         
    }catch(e){
      print("Error in the second try block"+e.toString());}

  }

  void get_uid() async{
      AuthUser result=await Amplify.Auth.getCurrentUser();
      print("User id is:- "+result.userId);

  }

  void pickImage1() async{
        uploadImage(img1_controller.text);
  }

  void pickImage2() async{
      uploadImage(img2_controller.text);
  }

  void compareFaces() async{
    try{

       rk.S3Object compare1=rk.S3Object(bucket: "bucketfromauthtrial62805-dev",name: "public/1d37e73f-8873-4297-bcce-f862fe1f0087/p2");
       rk.S3Object compare2=rk.S3Object(bucket: "bucketfromauthtrial62805-dev",name: "public/1d37e73f-8873-4297-bcce-f862fe1f0087/h1");
       rk.CompareFacesResponse res = await obj.compareFaces(sourceImage:rk.Image(s3Object: compare1) , targetImage:rk.Image(s3Object: compare2));
       print("Faces Matched. Confidence Level:- "+res.faceMatches.first.face.confidence.toString()+"%");
 
       

    }catch(e){
      if(e.toString()=="Bad state: No element")
      {
        print("Faces Not Matched");
      }
    }
  }
      
     
  


  


  @override
  Widget build(BuildContext context) {
    if(!isSignedIn)
       return Wrapper();
    else    
      return MaterialApp(
        routes: {
          '/upload':(context)=>UploadImages()
        },
        title: 'home',
        home: Builder(builder: (context)=>
                Scaffold(
          appBar: AppBar(title: Text("Home"),),
          body: Column(children:<Widget>[
                                  Center(
                                    child: RaisedButton(onPressed: (){
                                      _signout();
                                    }
                                    ,
                                              child:Text("Signout"))
                                  ),
                                  Center(child: TextField(controller:img1_controller)),
                                  
                                   Center(
                                    child: RaisedButton(onPressed: (){
                                          pickImage1();
                                    },
                                              child:Text("Image 1"))
                                  ),
                                  Center(child: TextField(controller:img2_controller)),
                                   Center(
                                    child: RaisedButton(onPressed: (){
                                          pickImage2();
                                    },
                                              child:Text("Image 2"))
                                  ),
                                  Center(
                                    child: RaisedButton(onPressed: (){
                                          compareFaces();
                                    },
                                              child:Text("Compare"))
                                  ),
                                  Center(
                                    child: RaisedButton(onPressed: (){
                                        get_uid();
                                    },
                                              child:Text("Get Uid"))
                                  ),
                                    Center(
                                    child: RaisedButton(onPressed: (){
                                        Navigator.pushNamed(context, '/upload');
                                    },
                                              child:Text("Go to Upload Images"))
                                  ),
                                  




          ])
          
          
          
          
        ))
        

      );
  }
}