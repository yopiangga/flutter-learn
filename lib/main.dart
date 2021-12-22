import 'package:flutter/material.dart';
import './hal_headset.dart' as headset;
import './hal_komputer.dart' as komputer;
import './hal_radio.dart' as radio;
import './hal_smartphone.dart' as smartphone;

void main(){
  runApp(new MaterialApp(
    title: "Tab Bar",
    home: new Home(),
  ));
}

class Home extends StatefulWidget {
  const Home({ Key? key }) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> with SingleTickerProviderStateMixin{

  late TabController controller;

  @override
  void initState(){
    controller = new TabController(vsync: this, length: 4);
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        backgroundColor: Colors.amber,
        title: new Text("Daftar Elektronik"),
        bottom: new TabBar(
          controller: controller,
          indicatorColor: Colors.white,
          tabs: [
            new Tab(icon: new Icon(Icons.computer), text: "Komputer",),
            new Tab(icon: new Icon(Icons.radio), text: "Radio"),
            new Tab(icon: new Icon(Icons.smartphone), text: "Smartphone"),
            new Tab(icon: new Icon(Icons.headset), text: "Headset",),
          ],
        ),
      ),

      body: new TabBarView(
        controller: controller,
        children: [
          new komputer.Komputer(),
          new radio.Radio(),
          new smartphone.Smartphone(),
          new headset.Headset()
        ],
      ),
    );
  }
}