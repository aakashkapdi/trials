import 'dart:async';
import 'dart:ffi';
import 'dart:io';
import 'dart:typed_data';
import 'package:face_detection/utils.dart';
import 'package:flutter/material.dart';
import 'package:camera/camera.dart';
import 'package:firebase_ml_vision/firebase_ml_vision.dart';

List<CameraDescription> cameras;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  cameras = await availableCameras();
  runApp(CameraApp());
}

class CameraApp extends StatefulWidget {
  @override
  _CameraAppState createState() => _CameraAppState();
}

class _CameraAppState extends State<CameraApp> {
  List<Face> faces;
  int id;
  CameraController _camera;

  bool _isDetecting = false;
  CameraLensDirection _direction = CameraLensDirection.back;

  @override
  void initState() {
    super.initState();
    _initializeCamera();
  }

  void _initializeCamera() async {

    bool isInit=false;
    
    ImageRotation rotation = rotationIntToImageRotation(
      cameras[0].sensorOrientation,
    );

    _camera = CameraController(cameras[0],ResolutionPreset.low);
    try{
          await _camera.initialize();
          isInit=true;
    }catch(e){print(e.toString());}

    if(isInit){
          _camera.startImageStream((CameraImage image) {
      if (_isDetecting) return;

      _isDetecting = true;

       detect(image, FirebaseVision.instance.faceDetector(FaceDetectorOptions(enableTracking: true,)).processImage,
              rotation)
          .then(
        (dynamic result) {
          setState(() {
            faces = result;

          });
          if(faces.isEmpty)
          {
                print("Face not Detected");
                
          }
          else{
            print("Face Detected: "+faces.first.trackingId.toString()+"rectangle:"+faces.first.boundingBox.toString()+"angle="+faces.first.headEulerAngleZ.toString());
          }
         
        
            
        },
      ).catchError(

        (_) {
          print('Cathc error block');
          _isDetecting = false;


        },
      );
      _isDetecting=false; 
    });

    }
    


  }


  Widget _buildImage() {

      return Container(
      constraints: const BoxConstraints.expand(),
      child: _camera == null
          ? const Center(
              child: Text(
                'Initializing Camera...',
                style: TextStyle(
                  color: Colors.green,
                  fontSize: 30.0,
                ),
              ),
            )
          : Stack(
              fit: StackFit.expand,
              children: <Widget>[
                CameraPreview(_camera),
                Positioned(
                  bottom: 0.0,
                  left: 0.0,
                  right: 0.0,
                  child: Container(
                    color: Colors.white,
                    height: 50.0,
                    child: ListView(
                      children: faces
                          .map((face) =>
                              Text(faces. toString()))
                          .toList(),
                    ),
                  ),
                ),
              ],
            ),
    );
  }

  void _toggleCameraDirection() async {
    if (_direction == CameraLensDirection.back) {
      _direction = CameraLensDirection.front;
    } else {
      _direction = CameraLensDirection.back;
    }

    await _camera.stopImageStream();
    await _camera.dispose();

    setState(() {
      _camera = null;
    });

    _initializeCamera();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
      appBar: AppBar(
        title: Text("Face Detection with Smile"),
      ),
      body: _buildImage(),
      floatingActionButton: FloatingActionButton(
        onPressed: _toggleCameraDirection,
        child: _direction == CameraLensDirection.back
            ? const Icon(Icons.camera_front)
            : const Icon(Icons.camera_rear),
      ),
    )
    );
    
   
  }
}
