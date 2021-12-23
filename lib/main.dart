import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';
import 'package:flutter/src/material/scaffold.dart';
import './detail.dart';

void main() {
  runApp(new MaterialApp(
    title: "Side Bar",
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
  String gambar1 =
      "https://cdn5.f-cdn.com/ppic/165305021/logo/45880587/KuLJp/profile_logo_IUJMP_d0efebb2c82aa49ca00f954fd1cb2804.png";
  String gambar2 =
      "https://upload.wikimedia.org/wikipedia/commons/3/3c/Punctuation_Idem.png";
  String backup = "";

  String nama1 = "Alfian Prisma Yopiangga";
  String nama2 = "Web Petikdua";
  String backupNama = "";

  String email1 = "yopiangga@email.com";
  String email2 = "petikdua@email.com";
  String backupEmail = "";

  void gantiuser() {
    this.setState(() {
      backup = gambar1;
      gambar1 = gambar2;
      gambar2 = backup;

      backupNama = nama1;
      nama1 = nama2;
      nama2 = backupNama;

      backupEmail = email1;
      email1 = email2;
      email2 = backupEmail;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: new Text("Demo Sidebar (DRAWER)"),
        backgroundColor: Colors.green[500],
      ),
      drawer: new Drawer(
        child: new ListView(
          children: [
            new UserAccountsDrawerHeader(
              accountName: new Text(nama1),
              accountEmail: new Text(email1),
              // currentAccountPicture: new Image(image: NetworkImage("https://cdn5.f-cdn.com/ppic/165305021/logo/45880587/KuLJp/profile_logo_IUJMP_d0efebb2c82aa49ca00f954fd1cb2804.png")),
              currentAccountPicture: new GestureDetector(
                onTap: () {
                  Navigator.of(context).pop();
                  Navigator.of(context).push(new MaterialPageRoute(
                      builder: (BuildContext context) =>
                          new Detail(nama: nama1, gambar: gambar1)));
                },
                child: new CircleAvatar(
                  backgroundColor: Colors.white,
                  backgroundImage: new NetworkImage(gambar1),
                ),
              ),
              decoration: new BoxDecoration(
                  image: new DecorationImage(
                      image: new NetworkImage(
                          "https://wallpapercave.com/wp/SlF16Av.jpg"),
                      fit: BoxFit.cover)),
              otherAccountsPictures: [
                new GestureDetector(
                  onTap: () => gantiuser(),
                  child: new CircleAvatar(
                    backgroundImage: new NetworkImage(gambar2),
                    backgroundColor: Colors.white,
                  ),
                )
              ],
            ),
            new ListTile(
              title: new Text("Setting"),
              trailing: new Icon(Icons.settings),
            ),
            new ListTile(
                title: new Text("Close"), trailing: new Icon(Icons.close)),
          ],
        ),
      ),
      body: new Container(),
    );
  }
}
