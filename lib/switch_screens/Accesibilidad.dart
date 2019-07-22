/*import 'package:flutter/material.dart';
import 'switch.dart';




class Configuracion extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: new AppBar(title: new Text("Configuración",
            style: TextStyle(color: letter_color)
        ), backgroundColor: BarColor,
        ),
        body: new Container(
            decoration: new BoxDecoration(color: BackColor),
            child: new Center(
                child: new Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      new RaisedButton(
                          child: new Text("Accesibilidad",
                              style: TextStyle(fontSize: 30.0,
                                  color: letter_color
                              )),
                          color: button_color,
                          onPressed: () {
                            Navigator.of(context).pushNamed("/Accesibilidad");
                          }
                      )
                    ]
                )
            )
        )
    );
  }
}


class Accesibilidad extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: new AppBar(title: new Text("Accesibilidad",
            style: TextStyle(color: letter_color)
        ), backgroundColor: BarColor,
        ),
        body: new Container(
            decoration: new BoxDecoration(color: BackColor),
              child: new Center(
                child: new Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  new RaisedButton(
                    child: new Text("Visión",
                    style: TextStyle(fontSize: 30.0,
                    color: letter_color
                    )),
                    color: button_color,
                    onPressed: () {
                    Navigator.of(context).pushNamed("/Vision");
                    }
                  )
                ]
                )
              )
        )
    );
  }
}


class Vision extends StatefulWidget{
  Vision({Key key, this.title}): super(key: key);
  final dynamic title;
  @override
  _VisionState createState() => new _VisionState();
}



class _VisionState extends State<Vision> {

  bool _value= true;
  dynamic BarColor = Colors.black;
  dynamic BackColor= Colors.black;
  dynamic letter_color= Colors.yellowAccent;
  dynamic icon_color= Colors.yellow;
  dynamic button_color=Colors.black;

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: new AppBar(title: new Text("Visión",
        style: TextStyle(color: letter_color)
        ), backgroundColor: BarColor,
        ),
        body: new Container(
            decoration: new BoxDecoration(color: BackColor),
        child: new Center(
            child: new Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  new ButtonBar(
                  children:<Widget>[
                      new Switch.adaptive(
                          value: _value,
                          onChanged:(bool value) => something(value),
                          activeColor: Colors.green),
                      new Text("Colores negativos",
                      style: TextStyle(fontSize: 20.0,
                        color: letter_color),
                        textAlign: TextAlign.left,
                      )
                    ]
                )
              ]
            )
        )
    )
    );
}


void something(bool value){
  setState(() {
    if (value){
      BarColor = Colors.black;
      BackColor= Colors.black;
      letter_color= Colors.yellowAccent;
      icon_color= Colors.yellow;
      button_color=Colors.black;
      value= true;
    }
    else{
      BarColor = Colors.blue;
      BackColor= Colors.white;
      letter_color= Colors.black;
      icon_color= Colors.blueGrey;
      button_color=Colors.grey;
      value= false;
    }
  }
  );
}
}
*/