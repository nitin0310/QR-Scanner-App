import 'package:flutter/material.dart';
import 'package:qrscanner/home.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.green[600],
          title: Text("Qr Scanner",style: TextStyle(color: Colors.white),)
        ),
        body: Home(),
      ),
    );
  }
}
