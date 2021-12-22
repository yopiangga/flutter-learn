import 'package:flutter/material.dart';

class Headset extends StatelessWidget {
  const Headset({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: new Center(
        child: new Column(
          children: [
            new Padding(padding: new EdgeInsets.all(20.0)),
            new Text("HEADSET", style: new TextStyle(fontSize: 30.0),),
            new Padding(padding: new EdgeInsets.all(20.0)),
            new Icon(Icons.headset, size: 90.0,),
          ],
        ),
      ),
    );
  }
}