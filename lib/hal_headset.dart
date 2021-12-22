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
            new Image(image: new NetworkImage('https://koran-jakarta.com/images/library/headset-120521151310.jpg'), width: 200.0,)
          ],
        ),
      ),
    );
  }
}