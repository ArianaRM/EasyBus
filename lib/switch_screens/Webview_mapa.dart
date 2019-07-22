import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'dart:async';
import 'switch.dart';

//import 'package:location/location.dart';



void main() => {
    runApp(MaterialApp(
      home: Mapa_San_Carlos(),
))
};



class Mapa_San_Carlos extends StatefulWidget {
  @override
  _Mapa_San_CarlosState createState() => _Mapa_San_CarlosState();
}

class _Mapa_San_CarlosState extends State<Mapa_San_Carlos> {
  Completer<WebViewController> _controller = Completer<WebViewController>();
  final Set<String> _favorites = Set<String>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(title: new Text("Cómo llegar",
          style: TextStyle (color: letter_color)
      ), backgroundColor: bar_color,
      ),
        // This drop down menu demonstrates that Flutter widgets can be shown over the web view.
      body: WebView(
        initialUrl: 'https://168.228.50.28/easybus/',
        javascriptMode: JavascriptMode.unrestricted,

      ),
    );
  }
  }


//_getLocation() async {
  //var location = new Location();
  //try {
    //currentLocation = await location.getLocation();

    //print("locationLatitude: ${currentLocation["latitude"]}");
    //print("locationLongitude: ${currentLocation["longitude"]}");
    //setState(
    //        () {}); //rebuild the widget after getting the current location of the user
  //} on Exception {
    //currentLocation = null;
  //}
//}



//@override
//void initState() {
  //_getLocation();
  //super.initState();
//}

//var location = new Location();

//location.onLocationChanged().listen((LocationData currentLocation) {
//print(currentLocation.latitude);
//print(currentLocation.longitude);
//});