import 'package:flutter/material.dart';

class Komputer extends StatelessWidget {
  const Komputer({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: new Center(
        child: new Column(
          children: [
            new Padding(padding: new EdgeInsets.all(20.0)),
            new Text("KOMPUTER", style: new TextStyle(fontSize: 30.0),),
            new Padding(padding: new EdgeInsets.all(20.0)),
            new Image(image: new NetworkImage('https://img.beritasatu.com/cache/beritasatu/620x350-2/1493280043.jpg'), width: 200.0,)
          ],
        ),
      ),
    );
  }
}