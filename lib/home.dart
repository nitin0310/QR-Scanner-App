import 'package:flutter/material.dart';
import 'dart:io';
import 'package:qrscan/qrscan.dart' as scanner;
import 'package:image_picker/image_picker.dart';
import 'package:qrscanner/webPage.dart';
import 'package:webview_flutter/webview_flutter.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  File finalImage,tempImage;
  String codeResult,tempResult;

  @override
  Widget build(BuildContext context) {
    return codeResult == null? options():showImage();
  }
  
  Widget options(){
    return Column(
      children: <Widget>[
        Container(
          height: 300.0,
          width: 300.0,
          child: Center(
            child: Text("Please select an option!",style: TextStyle(
              fontSize: 20.0
            ),),
          ),
        ),
        
        SizedBox(
          height: 30.0,
        ),
        
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            RaisedButton(
              elevation: 10.0,
              child: Text("Camera",style: TextStyle(color: Colors.white),),
              onPressed: (){
                pickImage(true);
              },
              color: Colors.green[800],
              splashColor: Colors.lightGreenAccent,
            ),

            RaisedButton(
              elevation: 10.0,
              child: Text("Gallery",style: TextStyle(color: Colors.white),),
              onPressed: (){
                pickImage(false);
              },
              color: Colors.green[800],
              splashColor: Colors.lightGreenAccent,
            ),
            
          ],
        )
      ],
    );
  }
  
  Widget showImage() {
    return Column(
      children: <Widget>[
        
        SizedBox(
          height: 30.0,
        ),
        
        Center(
          child: Text("$codeResult",style: TextStyle(
            fontSize: 20.0,
            color: Colors.black
          ),),
        ),

        SizedBox(
          height: 30.0,
        ),
        
        RaisedButton(
          elevation: 10.0,
          color: Colors.green[700],
          child: Text("Visit",style: TextStyle(color: Colors.white),),
          onPressed: (){
            Navigator.push((context),MaterialPageRoute(builder: (context)=>WebPage(codeResult)));
          },
        )
      ],
    );
  }
  
  Future<File> pickImage(bool value) async {

    if(value == true){
      tempResult = await scanner.scan().catchError((e){
        print(e.toString());
      });
    }else{
      tempResult = await scanner.scanPhoto().catchError((e){
        print(e.toString());
      });
    }

    setState(() {
      codeResult = tempResult;
    });
  }
  
}
