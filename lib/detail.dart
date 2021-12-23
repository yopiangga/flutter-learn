import 'package:flutter/material.dart';

class Detail extends StatelessWidget {

  Detail({this.nama = "Nama", this.gambar = ""});

  final String nama;
  final String gambar;

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(title: new Text("Detail $nama"), backgroundColor: Colors.green[500],),
      body: new Container(
        child: new Center(
          child: new Image(image: new NetworkImage(gambar))
        ),
      ),
    );
  }
}