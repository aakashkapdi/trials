import 'package:flutter/material.dart';
import 'package:aws_rekognition_api/rekognition-2016-06-27.dart' as rk;
import 'package:aws_kinesis_api/kinesis-2013-12-02.dart';



class rekognition extends StatefulWidget {
  @override
  _rekognitionState createState() => _rekognitionState();
}

class _rekognitionState extends State<rekognition> {

  rk.Rekognition obj= new rk.Rekognition(region:'us-east-1',credentials: AwsClientCredentials(accessKey: "AKIAQMSRPZQUYIDYW7VK",secretKey: "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"));
  Kinesis ken_obj=new Kinesis(region:'us-east-1',credentials: AwsClientCredentials(accessKey: "AKIAQMSRPZQUYIDYW7VK",secretKey: "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"));

  void createCollection() async{
    rk.CreateCollectionResponse collectionResponse=await obj.createCollection(collectionId: "collection");
    for(int i=1;i<6;i++)
      {
        rk.IndexFacesResponse indexResponse= await obj.indexFaces(collectionId: "collection", image: rk.Image(s3Object: rk.S3Object(bucket: "bucketfromauthtrial62805-dev",name: "public/1d37e73f-8873-4297-bcce-f862fe1f0087/rishi/"+i.toString())));
        print("public/1d37e73f-8873-4297-bcce-f862fe1f0087/rishi/"+i.toString()+" Uploaded to Collection");
      }
  }

  void startVideoStream() async{
        rk.KinesisVideoStream stream = rk.KinesisVideoStream(arn:"arn:aws:kinesis:us-east-1:027014450217:stream/RekognitionVideo-Blog");
        rk.GetFaceSearchResponse()
  }


  @override
  Widget build(BuildContext context) {
    createCollection();

    return MaterialApp(
          title:"Rekognition",
          home: Builder(builder: (context)=>
             Scaffold(
               appBar: AppBar(title:Text("Rekognition")),
               body: Center(child:RaisedButton(onPressed: (){},child:Text("Start Video Processor")),)
               
             )
          ),
    );
  }
}