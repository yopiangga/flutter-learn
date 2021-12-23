import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';
import 'package:flutter/src/material/scaffold.dart';

void main() {
  runApp(new MaterialApp(
    title: "Input Text, Alert & Snackbar",
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
  String teks = "";

  TextEditingController controllerInput = new TextEditingController();
  TextEditingController controllerAlert = new TextEditingController();
  TextEditingController controllerSnackbar = new TextEditingController();

  void _alertdialog(String str) {
    if (str.isEmpty) return;

    AlertDialog alertDialog = new AlertDialog(
      content: new Text(str, style: new TextStyle(fontSize: 20)),
      actions: [
        new RaisedButton(
          onPressed: () {
            Navigator.pop(context);
          },
          color: Colors.purple,
          child: new Text("Ok"),
        )
      ],
    );

    showDialog(
        context: context,
        builder: (context) {
          return alertDialog;
        });
  }

  final GlobalKey<ScaffoldState> _scaffoldState = new GlobalKey<ScaffoldState>();

  void _snackbar(String str){
    if(str.isEmpty) return;

    _scaffoldState.currentState!.showSnackBar(
      new SnackBar(
        content: new Text(str, style: new TextStyle(fontSize: 20)),
        duration: new Duration(seconds: 3),
        )
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldState,
      appBar: AppBar(
        title: new Text("INPUT TEXT, ALERT & SNACKBAR"),
        backgroundColor: Colors.purple,
      ),
      body: new Container(
        child: new Column(
          children: [
            new TextField(
                controller: controllerInput,
                decoration: new InputDecoration(hintText: "Tulis di sini"),
                onSubmitted: (String str) {
                  setState(() {
                    teks = str + '\n' + teks;
                    controllerInput.text = "";
                  });
                }),
            new Text(teks,
                style: new TextStyle(
                  fontSize: 20,
                )),
            new TextField(
                controller: controllerAlert,
                decoration:
                    new InputDecoration(hintText: "Tulis untuk alert ... "),
                onSubmitted: (String str) {
                  _alertdialog(str);
                  controllerAlert.text = "";
                }),

                new TextField(
                controller: controllerSnackbar,
                decoration:
                    new InputDecoration(hintText: "Tulis untuk snackbar ... "),
                onSubmitted: (String str) {
                  _snackbar(str);
                  controllerSnackbar.text = "";
                }),
          ],
        ),
      ),
    );
  }
}
