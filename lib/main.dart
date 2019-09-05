import 'package:flutter/material.dart';
import 'package:speech_recognition/speech_recognition.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:permission/permission.dart';

dynamic bar_color = Colors.black;
dynamic back_color= Colors.black;
dynamic letter_color= Colors.yellow;
dynamic icon_color= Colors.yellow;
dynamic button_color=Colors.black;
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
  String appBarText = "Elija la sede deseada";
  dynamic bar_change= null;

  ContainerGen genericContainer;




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
          setState(() => {resultText = speech.toLowerCase(), print(resultText)}),

            if(resultText.contains("elija") ||
                resultText.contains("elección")||
                resultText.contains("elegir")||
                resultText.contains("campus")||
                resultText.contains("sede") ){
              setState(() {
                genericContainer = _getDrawerItemWidget(0);
              })
            }

            else if(
            resultText.contains("campus") ||
                resultText.contains("tecnológico")||
                resultText.contains("tec")|
                resultText.contains("local")||
                resultText.contains("san carlos")||
                resultText.contains("punto de partida")){
                  setState(() {
                    genericContainer = _getDrawerItemWidget(1);
                  })
                }

            else if(
              resultText.contains("tec") ||
                  resultText.contains("tecnológico")||
                  resultText.contains("sede")||
                  resultText.contains("campus")&&
                  resultText.contains("a ciudad quesada")){
                  setState(() {
                    genericContainer = _getDrawerItemWidget(4);
                  })
                }

            else if(
                resultText.contains("ciudad") ||
                resultText.contains("quesada") ||
                resultText.contains("a tec")){
                  setState(() {
                    genericContainer = _getDrawerItemWidget(2);
                  }),
                }

              else if(
                    resultText.contains("horario") &&
                    (
                    resultText.contains("tec")||
                    resultText.contains("tecnológico")||
                    resultText.contains("a ciudad quesada"))){

                    setState(() {
                      genericContainer = _getDrawerItemWidget(5);
                    }),
              }

              else if(
                    resultText.contains("horario ") &&
                        (
                    resultText.contains("ciudad quesada")||
                    resultText.contains("a tec")||
                    resultText.contains("a tecnológico")
                    ))
                {
                  setState(() {
                    genericContainer = _getDrawerItemWidget(3);
                  }),
                }


              }

    );


    _speechRecognition.setRecognitionCompleteHandler(
          () => setState(() => _isListening = false),

    );


    _speechRecognition.activate().then(
          (result) => setState(() => _isAvailable = result),
    );
  }



  void _incrementTab(index) {
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
          setState(() {
            genericContainer= _getDrawerItemWidget(0);
          });
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


  _getDrawerItemWidget(int pos) {
    switch (pos) {
      case 0: // inicio
        setState(() {
          appBarText = "Elija la sede deseada";
        });
        return new ContainerGen(new Container(
            decoration: new BoxDecoration(color: back_color),
            child: new Center(
                child: new Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: <Widget>[
                      new RaisedButton(
                          child: new Text("Campus Tecnológico\nLocal San Carlos",
                              style: TextStyle(fontSize: 30.0,
                                  color: letter_color
                              )),
                          color: button_color,
                          onPressed: (){
                            setState(() {
                              genericContainer = _getDrawerItemWidget(1);
                            });
                          }
                      )
                    ]
                )
            )));
      case 1: // san carlos
        bar_change= {_getDrawerItemWidget(0)};
        setState(() {
          appBarText = "Campus San Carlos";

        });
        return ContainerGen(new Container(
            decoration: new BoxDecoration(color: back_color),
            child: new Center(
                child: new Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      new Text("Elija su punto de partida",
                          style: TextStyle(fontSize: 30.0,
                              color: letter_color
                          )
                      ),
                      new RaisedButton(
                          child: new Text("TEC",
                              style: TextStyle(fontSize: 30.0,
                                  color: letter_color
                              )),
                          color: button_color,
                          onPressed: (){
                            setState(() {
                              genericContainer = _getDrawerItemWidget(4);
                            });
                          }
                      ),
                      new RaisedButton(
                          child: new Text("Ciudad Quesada",
                              style: TextStyle(fontSize: 30.0,
                                  color: letter_color
                              )),
                          color: button_color,
                          onPressed: (){
                            setState(() {
                              genericContainer = _getDrawerItemWidget(2);
                            });
                          }
                      ),

                    ]
                )
            )
        ));
      case 2: // CQ-TEC
        bar_change= {_getDrawerItemWidget(1)};
        setState(() {
          appBarText = "Ciudad Quesada-TEC";

        });
        return new ContainerGen(Container(
            decoration: new BoxDecoration(color: back_color),
            child: new Center(
                child: new Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      new IconButton(
                          icon: new Icon(Icons.map, color: icon_color),
                          iconSize: 70.0,
                          onPressed: () {
                            setState(() {
                              genericContainer = _getDrawerItemWidget(6);
                            });
                          }
                      ),
                      new Text("Cómo llegar",
                          style: TextStyle(fontSize: 40.0,
                              color: letter_color
                          )
                      ),
                      new IconButton(
                          icon: new Icon(Icons.departure_board, color: icon_color),
                          iconSize: 70.0,
                          onPressed: (){
                            setState(() {
                              genericContainer = _getDrawerItemWidget(3);
                            });
                          }
                      ),
                      new Text("Horarios",
                          style: TextStyle(fontSize: 40.0,
                              color: letter_color
                          )
                      )

                    ]
                )
            )
        ));
      case 3: // horario cq - tec
        bar_change= _getDrawerItemWidget(2);
        setState(() {
          appBarText = "Horario CQ-TEC";

        });
        return new ContainerGen(Container(
            decoration: new BoxDecoration(color: back_color),
            child: new Center(
              child: new Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    new Text("6:20 a.m.",
                        style: TextStyle(fontSize: 30.0,
                            color: letter_color
                        )
                    ),
                  ]
              ),
            )
        ));
      case 4: // TEC-CQ
        bar_change= _getDrawerItemWidget(1);
        setState(() {
          appBarText = "TEC-CQ";

        });
        return new ContainerGen(new Container(
            decoration: new BoxDecoration(color: back_color),
            child: new Center(
                child: new Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      new IconButton(
                          icon: new Icon(Icons.map, color: icon_color),
                          iconSize: 70.0,
                          onPressed: (){
                            setState(() {
                              genericContainer = _getDrawerItemWidget(6);
                            });
                          }
                      ),
                      new Text("Cómo llegar",
                          style: TextStyle(fontSize: 40.0,
                              color: letter_color
                          )
                      ),
                      new IconButton(
                          icon: new Icon(Icons.departure_board, color: icon_color),
                          iconSize: 70.0,
                          onPressed: (){
                            setState(() {
                              genericContainer = _getDrawerItemWidget(5);
                            });
                          }
                      ),
                      new Text("Horarios",
                          style: TextStyle(fontSize: 40.0,
                              color: letter_color
                          )
                      )

                    ]
                )
            )
        ));
      case 5: // horario tec - cq
        bar_change= _getDrawerItemWidget(4);
        setState(() {
          appBarText = "Horario TEC-CQ";
        });
        return new ContainerGen(new Container(
            decoration: new BoxDecoration(color: back_color),
            child: new Center(
                child: new Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      new Text("12:00 p.m.",
                          style: TextStyle(fontSize: 30.0,
                              color: letter_color
                          )
                      ),
                      new Text("4:15 p.m.",
                          style: TextStyle(fontSize: 30.0,
                              color: letter_color
                          )
                      ),
                      new Text("9:00 p.m.",
                          style: TextStyle(fontSize: 30.0,
                              color: letter_color
                          )
                      )
                    ]
                )
            )
        )
        );
      case 6:
        bar_change = _getDrawerItemWidget(4);

        setState(() {
          appBarText = "Cómo llegar";


        });
        return new ContainerGen(new Container(
          constraints: BoxConstraints(maxHeight: 300,),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(20)),
              color: Color(0xffffffff)
          ),
          child: WebView(
              initialUrl: 'https://leoviquez.com/easybus/',
              javascriptMode: JavascriptMode.unrestricted
          ),
        ),
        );

    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(title: new Text(this.appBarText,
        style: TextStyle (color: letter_color),
      ), backgroundColor: bar_color,
        leading: new Row
        (
        children:<Widget>[
            IconButton(
                icon: Icon(Icons.arrow_back, color: icon_color),
                iconSize: 30.0,
                onPressed: (){
                  setState(() {
                    genericContainer = this.bar_change;
                  }
                  );
                }
            )
        ],
        )
    ),
      body: genericContainer == null ? _getDrawerItemWidget(0) : genericContainer,
        bottomNavigationBar: BottomNavigationBar(
          backgroundColor: back_color,


          currentIndex: _cIndex,
          type: BottomNavigationBarType.fixed ,
          items: [
            BottomNavigationBarItem(
                icon: Icon(Icons.cancel,color: icon_color, size: 40),
                title: new Text('Cancelar | Inicio',
                    style: TextStyle (color: letter_color)
                )
            ),
            BottomNavigationBarItem(
                icon: Icon(Icons.mic,color: icon_color, size: 40),
                title: new Text('Micrófono',
                    style: TextStyle (color: letter_color)
                )
            ),
            BottomNavigationBarItem(
                icon: Icon(Icons.stop,color: icon_color, size: 40),
                title: new Text('Detener',
                    style: TextStyle (color: letter_color))
            )
          ],
          onTap: (index){
            _incrementTab(index);
          },
        )
    );



  }


}


requestPermission() async {
  final res = await Permission.requestSinglePermission(PermissionName.Microphone);
  print(res);
}

class ContainerGen extends StatelessWidget {
  Container gen;
  ContainerGen(Container container) {
    this.gen = container;
  }
  @override
  Widget build(BuildContext context) {
    return new Scaffold(

        body: this.gen,
    );
  }
}

