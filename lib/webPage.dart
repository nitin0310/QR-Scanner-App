import 'dart:async';

import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebPage extends StatelessWidget {

  String link;

  WebPage(String url){
    this.link=url;
  }

  WebViewController controller;
  void loadPage() {
    controller.loadUrl(link);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "webview",
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.refresh),
          onPressed: (){
            loadPage;
          },
        ),
        appBar: AppBar(title: Text("Web View"),),

        body: Builder(builder: (BuildContext context){
          return WebView(
            key: Key("webview"),
            initialUrl: link,
            javascriptMode: JavascriptMode.unrestricted,
            onWebViewCreated: (WebViewController webViewController){
              controller=webViewController;
            },

          );
        }),
      ),
    );
  }
}

