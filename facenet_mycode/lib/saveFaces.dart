import 'package:flutter/material.dart';
import 'package:image/image.dart' as imglib;
import 'package:tflite_flutter/tflite_flutter.dart' as tfl;
import 'package:image_picker/image_picker.dart';
import 'package:firebase_ml_vision/firebase_ml_vision.dart';
import 'dart:io' as io;
import 'cameraHome.dart';
import 'util.dart';
import 'dart:convert';


class saveFaces extends StatefulWidget {
 
  io.File jsonFile;
  saveFaces({this.jsonFile});
  @override
  _saveFacesState createState() => _saveFacesState(this.jsonFile);
}

class _saveFacesState extends State<saveFaces> {

    io.File jsonFile;
  _saveFacesState(this.jsonFile);
  
  TextEditingController _textController=TextEditingController();
  var interpreter;
  Image img;
  bool isLoaded=false;
  imglib.Image convertedImage;
  dynamic data={};
  dynamic data1={};
  io.Directory tempDir;
  

 
  void pick_image()async{
     try{
        final FaceDetector faceDetector = FirebaseVision.instance.faceDetector();
        final _imagepicker=ImagePicker();
        var temp_img=await _imagepicker.getImage(source: ImageSource.gallery);
        var file=io.File(temp_img.path).readAsBytesSync();
        img=Image.memory(file); //to display on widget
        convertedImage=imglib.decodeImage(file);//converted picked Image to Image class
        FirebaseVisionImage image=FirebaseVisionImage.fromFilePath(temp_img.path);  //Created firebase image
        List<Face>result=await faceDetector.processImage(image);
        Face _face;
        if(result.isEmpty)
          {
            print("No Face");
          }
        else
        { 

              for(_face in result)
          
              {
                double x, y, w, h;
                x = (_face.boundingBox.left - 10);
                y = (_face.boundingBox.top - 10);
                w = (_face.boundingBox.width + 10);
                h = (_face.boundingBox.height + 10);
                print("y:"+_face.headEulerAngleY.toString()+" z:"+_face.headEulerAngleZ.toString());
                
                imglib.Image croppedImage = imglib.copyCrop(convertedImage, x.round(), y.round(), w.round(), h.round());
                print("1:  "+croppedImage.width.toString()+" "+croppedImage.height.toString());
                croppedImage = imglib.copyResizeCropSquare(croppedImage, 112);
                print("2:  "+croppedImage.width.toString()+" "+croppedImage.height.toString());
                var op=preProcess(croppedImage);
                if (jsonFile.existsSync()) data = json.decode(jsonFile.readAsStringSync());          
                data[_textController.text] = List.from(op);
                jsonFile.writeAsStringSync(json.encode(data));
                if (jsonFile.existsSync()) data1 = json.decode(jsonFile.readAsStringSync());

              }
        }  

        setState(() {
          isLoaded=true;
        });
     
    }catch(e){print("error while picking Image"+e.toString());}
  

  }

  void save_face()async{
    try{ 
        final gpuDelegateV2 = tfl.GpuDelegateV2(
        options: tfl.GpuDelegateOptionsV2(
        false,
        tfl.TfLiteGpuInferenceUsage.fastSingleAnswer,
        tfl.TfLiteGpuInferencePriority.minLatency,
        tfl.TfLiteGpuInferencePriority.auto,
        tfl.TfLiteGpuInferencePriority.auto,
      ));

      var interpreterOptions = tfl.InterpreterOptions()
        ..addDelegate(gpuDelegateV2);
      interpreter = await tfl.Interpreter.fromAsset('mobilefacenet.tflite',
          options: interpreterOptions);

    }catch(e){print("error while loading model"+e.toString());}

    pick_image();
   
  }

Widget showPicture(){
     if(isLoaded)
        return img;
     else
        return Icon(Icons.face);
  }

  
List<dynamic> preProcess(imglib.Image img){
  List input = imageToByteListFloat32(img, 112, 128, 128);
  input = input.reshape([1, 112, 112, 3]);
  List output = List(1 * 192).reshape([1, 192]);
  interpreter.run(input, output);
  output = output.reshape([192]);
  return output;
}

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home:Builder(builder: (context)=>Scaffold(
        appBar: AppBar(),
        body: Center(child:  Column(children: <Widget>[
          Container(
            height:200,
            child:TextField(
              controller: _textController,
            )
          ),
          
          Container(
            height: 300,
            child: showPicture()
            
          ),
          RaisedButton(onPressed: (){
              save_face();
          },
          child:Text("Save Face")),
          RaisedButton(onPressed: (){
              Navigator.of(context).push(MaterialPageRoute(builder: (context)=>cameraHome(jsonFile:jsonFile)));
          },
          child:Text("Go Back")),

        ],),
        )
        
       
      ) )
     

    );
  }
}

