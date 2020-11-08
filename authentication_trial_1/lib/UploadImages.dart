

import 'dart:io';

import 'package:authentication_trial/rekognition.dart';
import 'package:flutter/material.dart';
import 'package:amplify_core/amplify_core.dart';
import 'package:amplify_storage_s3/amplify_storage_s3.dart';
import 'package:amplify_auth_cognito/amplify_auth_cognito.dart';
import 'amplifyconfiguration.dart';
import 'package:file_picker/file_picker.dart';




class UploadImages extends StatefulWidget {
  @override
  _UploadImagesState createState() => _UploadImagesState();
}


class _UploadImagesState extends State<UploadImages> {

    String _uploaded=null;   
    bool _amplifyConfigured=false;
    Amplify amplifyInstance = Amplify();
    AmplifyAuthCognito auth = AmplifyAuthCognito();
    AmplifyStorageS3 storage = AmplifyStorageS3();
    TextEditingController folderController=new TextEditingController();
    TextEditingController nameController=new TextEditingController();

  
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
        print("following error occurred during amplify configuration in Upload Images page:- "+e.toString());
      }
    }


void uploadImages(String folder,String name)async{
   configureAuthStorage();
   AuthUser auth_result=await Amplify.Auth.getCurrentUser();
   String key=auth_result.userId.toString()+"/"+folder+"/"+name;
   File res,local;
   try{
      res= await FilePicker.getFile(type:FileType.image);
      local= File(res.absolute.path); 


   }catch(e){print("Error while picking Image "+e.toString());}

   try{
    
    UploadFileResult result= await Amplify.Storage.uploadFile(local: local, key: key);
    setState(() {
      _uploaded=folder+"/"+name+" uploaded";
    });

   }catch(e){print("Error while uploading the file"+e.toString());}


   }

   void uploadVideo(String folder,String name)async{
      configureAuthStorage();
      AuthUser auth_result=await Amplify.Auth.getCurrentUser();
      String key=auth_result.userId.toString()+"/"+folder+"/"+name;
     File res,local;
      try{
      res= await FilePicker.getFile(type:FileType.video);
      local= File(res.absolute.path);   


       }catch(e){print("_________________________________________________Error while picking video "+e.toString());}
        try{
    
    UploadFileResult result= await Amplify.Storage.uploadFile(local: local, key: key);
    setState(() {
      _uploaded=folder+"/"+name+" video uploaded";
    });

   }catch(e){print("____________________________________________________________________________Error while uploading the video"+e.toString());}

   }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        '/rekog':(context)=>rekognition()
      },
      title: "Uploading Batch Images",
      home: Builder(builder: (context)=> 
            Scaffold(
        appBar: AppBar(title:Text("Upload Images")),
        body: Center(child: Column(children:
        <Widget>[
          TextField(
            controller:folderController,
            decoration: InputDecoration(labelText: "Folder Name"),
          ),
          TextField(
            controller:nameController,
            decoration: InputDecoration(labelText: "File Name"),
          ),
          SizedBox(height:30),
          Text(_uploaded==null? "No Image Uploaded":_uploaded),
          SizedBox(height:30),
          RaisedButton(onPressed: (){
                       uploadImages(folderController.text,nameController.text);
          },
                       child: Text("Pick and Upload Image")),
          RaisedButton(onPressed: (){
                       Navigator.popAndPushNamed(context, '/rekog');
          },
                       child: Text("Go to Rekognition")),
          RaisedButton(onPressed: (){
                       uploadVideo(folderController.text,nameController.text);
          },
                       child: Text("Upload Video"))
        ]
        ),),
      )
      )

    );
  
    }
}