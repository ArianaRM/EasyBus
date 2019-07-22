import 'package:flutter/material.dart';
import 'Webview_mapa.dart';
import 'reconocimiento_voz.dart';

void main() {
  runApp(MaterialApp(
    home: new pantalla_inicio(),
    routes:<String, WidgetBuilder>{
      "/Estudiantes":(BuildContext context)  => new San_Carlos(),
      "/TEC_CQ":(BuildContext context)  => new TEC_CQ(),
      "/CQ_TEC":(BuildContext context)  => new CQ_TEC(),
      "/Mapa_San_Carlos":(BuildContext context)  => new Mapa_San_Carlos(),
      "/Horario_TEC_CQ":(BuildContext context)  => new Horario_TEC_CQ(),
      "/Horario_CQ_TEC":(BuildContext context)  => new Horario_CQ_TEC(),

    }
  ));
}


dynamic bar_color = Colors.black;
dynamic back_color= Colors.black;
dynamic letter_color= Colors.yellow;
dynamic icon_color= Colors.yellow;
dynamic button_color=Colors.black;




class pantalla_inicio extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: new AppBar(title: new Text("Elija la sede deseada",
            style: TextStyle (color: letter_color),
        ), backgroundColor: bar_color
        ),
        body: new Container(
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
                         onPressed: (){Navigator.push(context, new MaterialPageRoute(builder: (context) =>new San_Carlos())
                         );
                        }
                    )
                  ]
                )
            ),
        )
    );
  }
}






class San_Carlos extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: new AppBar(title: new Text("Campus Tecnológico\nLocal San Carlos",
            style: TextStyle (color: letter_color)
        ), backgroundColor: bar_color,
        ),
        body: new Container(
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
                          onPressed: (){Navigator.of(context).pushNamed("/TEC_CQ");}
                      ),
                      new RaisedButton(
                          child: new Text("Ciudad Quesada",
                              style: TextStyle(fontSize: 30.0,
                              color: letter_color
                              )),
                          color: button_color,
                          onPressed: (){Navigator.of(context).pushNamed("/CQ_TEC");}
                      ),

                    ]
                )
            )
        )
    );
  }
}





class TEC_CQ extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: new AppBar(title: new Text("TEC a\nCiudad Quesada",
            style: TextStyle (color: letter_color)), backgroundColor: bar_color,
        ),
        body: new Container(
            decoration: new BoxDecoration(color: back_color),
            child: new Center(
            child: new Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
              new IconButton(
                icon: new Icon(Icons.map, color: icon_color),
                iconSize: 70.0,
                onPressed: (){Navigator.of(context).pushNamed("/Mapa_San_Carlos");}
                ),
              new Text("Cómo llegar",
                style: TextStyle(fontSize: 40.0,
                color: letter_color
                )
                ),
              new IconButton(
                icon: new Icon(Icons.departure_board, color: icon_color),
                iconSize: 70.0,
                onPressed: (){Navigator.of(context).pushNamed("/Horario_TEC_CQ");}
                ),
              new Text("Horarios",
                style: TextStyle(fontSize: 40.0,
                color: letter_color
                )
              )

              ]
            )
          )
        )
    );
  }
}







class CQ_TEC extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: new AppBar(title: new Text("Ciudad Quesada\na TEC",
            style: TextStyle (color: letter_color)
        ), backgroundColor: bar_color,
        ),
        body: new Container(
            decoration: new BoxDecoration(color: back_color),
            child: new Center(
                child: new Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      new IconButton(
                          icon: new Icon(Icons.map, color: icon_color),
                          iconSize: 70.0,
                          onPressed: (){Navigator.of(context).pushNamed("/Mapa_San_Carlos");}
                      ),
                      new Text("Cómo llegar",
                          style: TextStyle(fontSize: 40.0,
                          color: letter_color
                          )
                      ),
                      new IconButton(
                          icon: new Icon(Icons.departure_board, color: icon_color),
                          iconSize: 70.0,
                          onPressed: (){Navigator.of(context).pushNamed("/Horario_CQ_TEC");}
                      ),
                      new Text("Horarios",
                          style: TextStyle(fontSize: 40.0,
                          color: letter_color
                          )
                      )

                    ]
                )
            )
        )
    );
  }
}













class Horario_TEC_CQ extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: new AppBar(title: new Text("Horario buses TEC\na Ciudad Quesada",
            style: TextStyle (color: letter_color)
        ),
          backgroundColor: bar_color,
        ),
        body: new Container(
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
  }
}







class Horario_CQ_TEC extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: new AppBar(title: new Text("Horario buses\nCiudad Quesada a TEC",
            style: TextStyle (color: letter_color)
        ),
          backgroundColor: bar_color,
        ),
        body: new Container(
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
        )
    );
  }
}






