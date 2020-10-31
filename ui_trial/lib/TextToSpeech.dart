import 'package:flutter_tts/flutter_tts.dart';

class TextToSpeech{
 final FlutterTts tts= FlutterTts();
  
  void setTts() async{

    await tts.setLanguage('en-IN');
    await tts.setVolume(1.0);
    await tts.setSpeechRate(1.0);
     
  }

  void tellCurrentScreen(String screen) async{

    setTts();
    await tts.speak("You are on "+screen+"Screen");
   
  }

  void tellPress(String button) async{
    await tts.speak(button);

  }

}