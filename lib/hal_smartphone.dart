import 'package:flutter/material.dart';

class Smartphone extends StatelessWidget {
  const Smartphone({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: new Center(
        child: new Column(
          children: [
            new Padding(padding: new EdgeInsets.all(20.0)),
            new Text("SMARTPHONE", style: new TextStyle(fontSize: 30.0),),
            new Padding(padding: new EdgeInsets.all(20.0)),
            new Icon(Icons.smartphone, size: 90.0,),
          ],
        ),
      ),
    );
  }
}