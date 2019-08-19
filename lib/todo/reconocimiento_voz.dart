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
  int _cIndex = 0;


  String resultText = "";

  @override
  void initState() {
    super.initState();
    initSpeechRecognizer();
  }

  void initSpeechRecognizer() {
    _speechRecognition = SpeechRecognition();
    
    _speechRecognition.setAvailabilityHandler(
          (bool result) => setState(() => _isAvailable = result),
    );

    _speechRecognition.setRecognitionStartedHandler(
          () => setState(() => _isListening = true),
    );

    _speechRecognition.setRecognitionResultHandler(
          (String speech) => {
          setState(() => resultText = speech),


            if(speech.contains("campus")){
                print("funciona"),
                Navigator.push(context,
                new MaterialPageRoute(builder: (context)=> new San_Carlos()))
            }

            else if(speech.contains("campus"))
                print("funciona"),
                Navigator.push(context,
                    new MaterialPageRoute(builder: (context)=> new San_Carlos())
                )
            // else
          }

    /*        else if(speech.contains("campus"))
              {
                print("funciona"),
                Navigator.push(context,
                    new MaterialPageRoute(builder: (context)=> new San_Carlos())
                )
              },

            else if(speech.contains("campus"))
              {
                print("funciona"),
                Navigator.push(context,
                    new MaterialPageRoute(builder: (context)=> new San_Carlos())
                )
              },
              else if(speech.contains("campus"))
              {
              print("funciona"),
              Navigator.push(context,
              new MaterialPageRoute(builder: (context)=> new San_Carlos())
              )
              },
    */



    );

    _speechRecognition.setRecognitionCompleteHandler(
          () => setState(() => _isListening = false),

    );


    _speechRecognition.activate().then(
          (result) => setState(() => _isAvailable = result),
    );
  }

  void _incrementTab(index) {
    print(index);
    switch (index) {
      case 0:
        if (_isListening)
          _speechRecognition.cancel().then(
                (result) => setState(() {
              _isListening = result;
              resultText = "";
              print(resultText="");
            }),
          );
        break;
      case 1:
        if (_isAvailable && !_isListening)
          _speechRecognition
              .listen(locale: "es_ES")
              .then((result) => print('$result'));
        break;
      case 2:
        if (_isListening)
        _speechRecognition.stop().then(
              (result) => setState(() => _isListening = result),
        );

        break;
    }
    setState(() {
      _cIndex = index;
    });
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
      bottomNavigationBar:BottomNavigationBar(
        currentIndex: _cIndex,
        type: BottomNavigationBarType.fixed ,
        items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.cancel,color: Color.fromARGB(255, 0, 0, 0)),
              title: new Text('Home')
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.mic,color: Color.fromARGB(255, 0, 0, 0)),
              title: new Text('Power')
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.stop,color: Color.fromARGB(255, 0, 0, 0)),
              title: new Text('Power')
          )
        ],
        onTap: (index){
          _incrementTab(index);
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      floatingActionButton: new FloatingActionButton(

        onPressed:(){ _incrementTab(1); },
        tooltip: 'Increment',
        child: new Icon(Icons.add),
      ),
    );



  }


}



requestPermission() async {
  final res = await Permission.requestSinglePermission(PermissionName.Microphone);
  print(res);
}




/*
 if(resultText.contains("campus"))
    {
      print("funciona");
      Navigator.push(context,
          new MaterialPageRoute(builder: (context)=> new San_Carlos())
      );
    }
 */