import 'package:flutter/material.dart';

void main() {
  runApp(new MaterialApp(
    title: "Kang Service Application",
    home: new HalamanSatu(),
    routes: <String, WidgetBuilder>{
      '/HalamanSatu' : (BuildContext context) => new HalamanSatu(),
      '/HalamanDua' : (BuildContext context) => new HalamanDua(),
    },
  ));
}

class HalamanSatu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(title: new Text("MUSIC")),
      body: new Center(
        child: new IconButton(icon: new Icon(Icons.headset, size: 50), onPressed: (){
          Navigator.pushNamed(context, '/HalamanDua');
        },),
      ),
    );
  }
}

class HalamanDua extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(title: new Text("SPEAKER")),
      body: new Center(
        child: new IconButton(icon: new Icon(Icons.speaker, size: 50, color: Colors.red[300],), onPressed: (){
          Navigator.pushNamed(context, '/HalamanSatu');
        },),
      ),
    );
  }
}

