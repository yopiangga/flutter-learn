import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';

void main() {
  runApp(new MaterialApp(
    title: "List View",
    home: new Home(),
    debugShowCheckedModeBanner: false,
  ));
}

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late List dataJSON = [
    {'title': "a", 'body': "b"}
  ];

  Future<String> ambilData() async {
    http.Response hasil = await http.get(
        Uri.encodeFull("https://jsonplaceholder.typicode.com/posts"),
        headers: {"Accept": "application/json"});

    this.setState(() {
      dataJSON = jsonDecode(hasil.body);
    });

    return hasil.body;
  }

  @override
  void initState() {
    // TODO: implement initState
    this.ambilData();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(
        title: new Text("List Data JSON"),
      ),
      body: new ListView.builder(
          itemCount: dataJSON == null ? 0 : dataJSON.length,
          itemBuilder: (context, i) {
            return new Card(
              child: new Container(
                padding: EdgeInsets.all(20),
                child: new Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  new Text(dataJSON[i]['title'] , style: new TextStyle(fontSize: 20.0, color: Colors.blue),),
                  new Container(
                    padding: EdgeInsets.only(top: 10),
                    child: new Text(dataJSON[i]['body']),
                  )
                ],
              )
              )
            );
          }),
    );
  }
}
