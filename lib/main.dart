// ignore_for_file: unnecessary_new, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';
import 'package:flutter/src/material/scaffold.dart';
// import './detail.dart';

void main() {
  runApp(new MaterialApp(
    title: "GRID dan HERO",
    home: Home(),
    debugShowCheckedModeBanner: false,
  ));
}

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<Container> daftarSuperHero = [];

  var users = [
    {"nama": "Alfian Prisma Yopiangga", "gambar": "world-user-01.jpg"},
    {"nama": "Krisna Wahyu Setiawan", "gambar": "world-user-02.jpg"},
    {"nama": "Bintang Rezeka Ramadhani", "gambar": "world-user-03.jpg"},
    {"nama": "Muhamammad Rifqi lutfi", "gambar": "world-user-04.jpg"},
    {"nama": "Muqorroba Lada Sattar", "gambar": "world-user-05.jpg"},
    {"nama": "Rosalinda Dwi Vicessa", "gambar": "world-user-06.jpg"},
    {"nama": "Josepphine Kristianti", "gambar": "world-user-07.jpg"},
    {"nama": "Muadz Fatullah", "gambar": "world-user-08.jpg"},
  ];

  _buatList() async {
    for (var i = 0; i < users.length; i++) {
      final user = users[i];
      final String gambar = user["gambar"].toString();
      daftarSuperHero.add(
        new Container(
            padding: EdgeInsets.all(10),
            child: new Card(
              child: Column(
                children: [
                  new Hero(
                    tag: user["nama"].toString(),
                    child: new Material(
                      child: new InkWell(
                        onTap: () =>
                            Navigator.of(context).push(new MaterialPageRoute(
                          builder: (BuildContext context) => new Detail(
                              nama: user["nama"].toString(), gambar: gambar),
                        )),
                        child: new Image.asset(
                          "assets/images/$gambar",
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),

                  // new Text(user["nama"].toString(), style: new TextStyle(fontSize: 14.0),),
                ],
              ),
            )),
      );
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    _buatList();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: new Text("Super Hero 2",
            style: new TextStyle(
              color: Colors.white,
            )),
      ),
      body: GridView.count(
        crossAxisCount: 2,
        children: daftarSuperHero,
      ),
    );
  }
}

class Detail extends StatelessWidget {
  Detail({this.nama = "", this.gambar = ""});

  final String nama;
  final String gambar;

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: new ListView(
        children: [
          new Container(
              height: 240,
              child: new Hero(
                  tag: nama,
                  child: new Material(
                    child: new InkWell(
                      child: new Image.asset("assets/images/$gambar", fit: BoxFit.cover,),
                    ),
                  ))),
            new BagianNama(nama: nama),
            new BagianIcon(),
            new BagianKeterangan(),
        ],
      ),
    );
  }
}


class BagianNama extends StatelessWidget {

  BagianNama({this.nama = ""});

  final String nama;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: new EdgeInsets.all(10),
      child: Row(
        children: [
          Expanded(
            child: new Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                new Text(nama, style: new TextStyle(fontSize: 20.0, color: Colors.blue)),
                new Text("$nama@email.com", style: new TextStyle(fontSize: 17.0, color: Colors.grey)),
              ],
            ),
          ),

          new Row(
            children: [
              new Icon(Icons.star, size: 30.0, color: Colors.yellow,),
              new Text("12")
            ],
          )
        ],
      ),
    );
  }
}

class BagianIcon extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: new EdgeInsets.all(10),
      child: Row(
        children: [
          Expanded(
            child: new Column(
              children: [
                new Icon(Icons.phone, size: 50, color: Colors.blue,),
                new Text("Call", style: new TextStyle(fontSize: 18, color: Colors.blue))
              ],
            ),
          ),
          Expanded(
            child: new Column(
              children: [
                new Icon(Icons.message, size: 50, color: Colors.blue,),
                new Text("Message", style: new TextStyle(fontSize: 18, color: Colors.blue))
              ],
            ),
          ),
          Expanded(
            child: new Column(
              children: [
                new Icon(Icons.photo, size: 50, color: Colors.blue,),
                new Text("Photo", style: new TextStyle(fontSize: 18, color: Colors.blue))
              ],
            ),
          ),
        ],
      ),
    );
  }
}


class BagianKeterangan extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: new EdgeInsets.all(10),
      child: new Card(
        child: Padding(
          padding: new EdgeInsets.all(20),
          child: new Text("Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged.", style: new TextStyle(fontSize: 18), textAlign: TextAlign.justify,)),
      ),
    );
  }
}