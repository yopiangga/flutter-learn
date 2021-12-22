import 'package:flutter/material.dart';
import './hal_headset.dart' as headset;
import './hal_komputer.dart' as komputer;
import './hal_radio.dart' as radio;
import './hal_smartphone.dart' as smartphone;

void main() {
  runApp(new MaterialApp(
    title: "Tab Bar",
    home: new Home(),
    debugShowCheckedModeBanner: false,
  ));
}

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: new AppBar(
          backgroundColor: Colors.amber[900],
          title: new Text("List View"),
        ),
        body: new ListView(
          children: [
            new ListTutorial(
              gambar:
                  "https://m.media-amazon.com/images/I/81s5S0s2IGL._AC_SL1500_.jpg",
              judul: "RADIO",
            ),
            new ListTutorial(
              gambar:
                  "https://selular.id/wp-content/uploads/2020/01/Simo-Luna-black-696x522.jpg",
              judul: "SMARTPHONE",
            ),
            new ListTutorial(
              gambar:
                  "https://img.beritasatu.com/cache/beritasatu/620x350-2/1493280043.jpg",
              judul: "KOMPUTER",
            ),
            // new ListTutorial(gambar: "https://koran-jakarta.com/images/library/headset-120521151310.jpg", judul: "HEADSET",),
          ],
        ));
  }
}

class ListTutorial extends StatelessWidget {
  ListTutorial({this.gambar = "", this.judul = ""});

  final String gambar;
  final String judul;

  @override
  Widget build(BuildContext context) {
    return new Container(
      height: 200.0,
      width: 200.0,
      decoration: BoxDecoration(
        color: Colors.yellow[50],
      ),
      padding: new EdgeInsets.all(20.0),
      child: new Center(
        child: Column(
          children: [
            new Image(
              image: new NetworkImage(gambar),
              width: 200.0,
            ),
            new Text(
              judul,
              style: new TextStyle(fontSize: 20.0),
            )
          ],
        ),
      ),
    );
  }
}
