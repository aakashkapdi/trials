import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';


import 'dart:io';


void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {


  void _uploadpic() async{
     File res= await FilePicker.getFile(type:FileType.image);
   

  }



 Widget page() {
    
    return Scaffold(
      appBar: AppBar(),
      body: RaisedButton(onPressed: (){
             _uploadpic();

      },
      child: Text("Upload"),)
      ,    );


 } 


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title:"Hello",
      home:page()
    );
  }
}