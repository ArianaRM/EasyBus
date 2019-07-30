import 'package:flutter/material.dart';
import 'package:speech_recognition/speech_recognition.dart';
import 'switch.dart';
import 'package:permission/permission.dart';


void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: VoiceHome(),
    );
  }
}

class VoiceHome extends StatefulWidget {
  @override
  _VoiceHomeState createState() => _VoiceHomeState();
}

class _VoiceHomeState extends State<VoiceHome> {
  SpeechRecognition _speechRecognition;
  bool _isAvailable = false;
  bool _isListening = false;

  String resultText = "";

  @override
  void initState() {
    super.initState();
    initSpeechRecognizer();
  }

  void initSpeechRecognizer() {
    _speechRecognition = SpeechRecognition();


    print(resultText.contains("campus"));
    if(resultText.contains("campus")==true)
    {
      print("funciona");
      Navigator.push(context,
      new MaterialPageRoute(builder: (context)=> new San_Carlos())
      );
    }



    _speechRecognition.setAvailabilityHandler(
          (bool result) => setState(() => _isAvailable = result),
    );

    _speechRecognition.setRecognitionStartedHandler(
          () => setState(() => _isListening = true),
    );

    _speechRecognition.setRecognitionResultHandler(
          (String speech) => setState(() => resultText = speech),


    );



    _speechRecognition.setRecognitionCompleteHandler(
          () => setState(() => _isListening = false),
    );

    _speechRecognition.activate().then(
          (result) => setState(() => _isAvailable = result),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: new BoxDecoration(color: back_color),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                SizedBox(
                  width: 80.0,
                  height: 80.0,
                  child:
                  FloatingActionButton(
                  child:
                  Icon(Icons.cancel, color: button_color, size: 50.0),
                  mini: true,
                  backgroundColor: icon_color,
                  onPressed: () {
                    if (_isListening)
                      _speechRecognition.cancel().then(
                            (result) => setState(() {
                          _isListening = result;
                          resultText = "";




                        }),
                      );
                  },
                  )
                ),
                SizedBox(
                  width: 80.0,
                  height: 80.0,
                  child:
                FloatingActionButton(
                  child:
                  Icon(Icons.mic, color: button_color, size: 50.0),
                  onPressed: () {
                    if (_isAvailable && !_isListening)
                      _speechRecognition
                          .listen(locale: "es_ES")
                          .then((result) => print('$result'));




                  },
                  backgroundColor: icon_color,
                ),
                ),

                SizedBox(
                  width: 80.0,
                  height: 80.0,
                  child:
                FloatingActionButton(
                  child: Icon(Icons.stop, color: button_color, size: 50.0),
                  mini: true,
                  backgroundColor: icon_color,
                  onPressed: () {
                    if (_isListening)
                      _speechRecognition.stop().then(
                            (result) => setState(() => _isListening = result),
                      );
                  },
                ),
                ),
              ],
            ),
            Container(
              width: MediaQuery.of(context).size.width * 0.8,
              decoration: BoxDecoration(
                color: back_color,
                borderRadius: BorderRadius.circular(6.0),
              ),
              padding: EdgeInsets.symmetric(
                vertical: 8.0,
                horizontal: 14.0,
              ),
              child: Text(
                resultText,
                style: TextStyle(fontSize: 24.0, color: letter_color),


              ),

            )
          ],
        ),
      ),
    );



  }


}


requestPermission() async {
  final res = await Permission.requestSinglePermission(PermissionName.Microphone);
  print(res);
}




