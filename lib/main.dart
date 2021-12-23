// ignore_for_file: unnecessary_new, prefer_const_constructors

import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';
// import './detail.dart';
import 'package:flutter/scheduler.dart';

void main() {
  runApp(new MaterialApp(
    title: "Gradient, Circle Hero, Menu Dropdown",
    home: Home(),
    debugShowCheckedModeBanner: false,
  ));
}

class Home extends StatefulWidget {
  const Home({ Key? key }) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  final List<String> gambar = [
    "world-user-01.jpg",
    "world-user-02.jpg",
    "world-user-03.jpg",
    "world-user-04.jpg",
    "world-user-05.jpg",
    "world-user-06.jpg",
    "world-user-07.jpg",
    "world-user-08.jpg",
    ];

  @override
  Widget build(BuildContext context) {
    timeDilation = 2;
    return new Scaffold(
        body: new Container(
          decoration: new BoxDecoration(
            gradient: new LinearGradient(
              begin: FractionalOffset.topRight,
              end: FractionalOffset.bottomLeft,
              colors: [
                Colors.red,
                Colors.yellow,
                Colors.green
              ]
            )
          ),
          child: new PageView.builder(
            controller: new PageController(viewportFraction: 0.92),
            itemCount: gambar.length,
            itemBuilder: (BuildContext context, int i){
              return Padding(
                padding: new EdgeInsets.symmetric(
                  horizontal: 5,
                  vertical: 22
                ),
                child: new Material(
                  borderRadius: new BorderRadius.all(Radius.circular(20)),
                  elevation: 8,
                  child: new Stack(
                    fit: StackFit.expand,
                    children: [
                      new Hero(
                        tag: gambar[i], 
                        child: new Material(
                          child: new InkWell(
                            onTap: ()=> Navigator.of(context).push(
                              new MaterialPageRoute(
                                  builder: (BuildContext context)=> new HalamanDua(gambar: gambar[i],)
                                )
                            ),
                            child: new Image.asset("assets/images/${gambar[i]}", fit: BoxFit.cover,)),
                          ),
                        )
                    ],
                  ),
                ),
              );
            },
          ),
        ),
    );
  }
}

class HalamanDua extends StatefulWidget {
  HalamanDua({this.gambar = ""});
  final String gambar;

  @override
  State<HalamanDua> createState() => _HalamanDuaState();
}

class _HalamanDuaState extends State<HalamanDua> {

  Color warna = Colors.grey;

  void _pilihannya(Pilihan pilihan){
    setState(() {
      warna = pilihan.warna;
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("DATA MANUSIA",),
        backgroundColor: Colors.grey,
        actions: [
          new PopupMenuButton<Pilihan>(
            onSelected: _pilihannya,
            itemBuilder: (BuildContext context){
              return listPilihan.map((Pilihan x){
                return new PopupMenuItem<Pilihan>(
                  child: new Text(x.teks),
                  value: x,
                );
              }).toList();
            },
          )
        ],
      ),
      body: new Stack(
        children: [
          new Container(
            decoration: new BoxDecoration(
              gradient: new RadialGradient(
                center: Alignment.center,
                colors: [
                  Colors.blue,
                  warna,
                  Colors.black.withOpacity(0.9)
                ]
              )
            ),
          ),

          new Center(
            child: new Hero(
              tag: widget.gambar,
              child: ClipOval(
                child: SizedBox(
                  width: 200,
                  height: 200,
                  child: new Material(
                    child: new InkWell(
                      onTap: () => Navigator.of(context).pop(),
                      child: new Image.asset("assets/images/${widget.gambar}", fit: BoxFit.cover,),
                    ),
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}


class Pilihan{
  const Pilihan({this.teks = "", this.warna = Colors.white});
  final String teks;
  final Color warna;
}

List<Pilihan> listPilihan = const <Pilihan>[
  const Pilihan(teks: "Strength", warna: Colors.red),
  const Pilihan(teks: "Agility", warna: Colors.green),
  const Pilihan(teks: "Intelligence", warna: Colors.blue),
];