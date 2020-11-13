import 'package:flutter/material.dart';
import 'cameraHome.dart';
import 'saveFaces.dart';
import 'dart:io' as io;
import 'package:path_provider/path_provider.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
 
  io.File jsonFile;

  void loadJson()async{
    io.Directory tempDir = await getApplicationDocumentsDirectory();
    String _embPath = tempDir.path + '/emb.json';
    jsonFile = new io.File(_embPath);

  }

  @override
  Widget build(BuildContext context) {
    loadJson();
    return MaterialApp(
      home:Builder( builder:
        (context){
              Navigator.of(context).push(MaterialPageRoute(builder: (context)=>saveFaces(jsonFile:jsonFile)));
        } 
      )
    );
  }
}
