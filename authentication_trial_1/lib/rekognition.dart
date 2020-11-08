import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:aws_rekognition_api/rekognition-2016-06-27.dart' as rk;
import 'package:aws_kinesisvideo_api/kinesisvideo-2017-09-30.dart';
import 'package:camera/camera.dart';
import 'package:flutter/services.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:ui' as ui;
import 'dart:io';
import 'package:file_picker/file_picker.dart';

class rekognition extends StatelessWidget {

  rk.Rekognition obj= new rk.Rekognition(region:'us-east-1',credentials: AwsClientCredentials(accessKey: "AKIAQMSRPZQUYIDYW7VK",secretKey: "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"));
  
  void checkCollection() async{
      rk.ListCollectionsResponse responseList=await obj.listCollections();
      if(responseList.collectionIds.isEmpty)
         {
           rk.CreateCollectionResponse responseCollection=await obj.createCollection(collectionId: "collection");     
           print("Collection created:"+responseCollection.collectionArn);
         }      
  }

  void pick() async{
    
  File res,local;
  ByteData imageData;
   try{
      res= await FilePicker.getFile(type:FileType.image);
      local= File(res.absolute.path);
      print(res.absolute.path);
      imageData=await rootBundle.load(res.absolute.path);
      Uint8List list = imageData.buffer.asUint8List();  
      indexFaces(list);
      
      

   }catch(e){print("Error while picking Image "+e.toString());}

  }

  void indexFaces(Uint8List list) async{
    print("inside Index Faces");
    try{
        rk.IndexFacesResponse responseIndexFaces= await obj.indexFaces(collectionId:"collection" , image: rk.Image(bytes: list));
        print("recently added:"+responseIndexFaces.faceRecords.first.face.faceId.toString());
        
       
    }catch(e){print("error while indexing"+e.toString());}
    listFaces();
  
  }

  void listFaces() async{
     try{
        rk.ListFacesResponse responseListFaces=await obj.listFaces(collectionId: "collection");
        responseListFaces.faces.forEach((element) {print(element.faceId);});
        print("done");      
       
    }catch(e){print("error while listing"+e.toString());}
    rk.SearchFacesResponse response=await obj.searchFaces(collectionId: "collection", faceId: "491528ee-31fc-4531-a720-c91431b5e06d");
    response.faceMatches.forEach((element) {print("id:"+element.face.faceId+" similarity:"+element.similarity.toString());});
      
      }


  @override
  Widget build(BuildContext context) {
   

    return MaterialApp(
      home:Scaffold(appBar: AppBar(title:Text("Rekognition")),
      body:Center(child: RaisedButton(onPressed: (){

         pick();
      },
      ),
      ))
    );
  }
}
