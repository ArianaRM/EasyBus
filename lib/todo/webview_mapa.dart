import 'package:flutter/material.dart';
import 'dart:async';
import 'switch.dart';
import 'package:webview_flutter/webview_flutter.dart';




class Mapa_San_Carlos extends StatefulWidget {
  @override
  _Mapa_San_CarlosState createState() => _Mapa_San_CarlosState();
}

class _Mapa_San_CarlosState extends State<Mapa_San_Carlos> {
 /*
  Completer<WebViewController> _controller = Completer<WebViewController>();
  final Set<String> _favorites = Set<String>();
*/

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(title: new Text("Cómo llegar",
          style: TextStyle (color: letter_color)
      ), backgroundColor: bar_color,
      ),
        // This drop down menu demonstrates that Flutter widgets can be shown over the web view.
      body: WebView(
        initialUrl: 'https://leoviquez.com/easybus/',
        javascriptMode: JavascriptMode.unrestricted,

      ),
    );
  }
  }

