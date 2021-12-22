import 'package:flutter/material.dart';
import './hal_headset.dart' as headset;
import './hal_komputer.dart' as komputer;
import './hal_radio.dart' as radio;
import './hal_smartphone.dart' as smartphone;

void main() {
  runApp(new MaterialApp(
    title: "List View",
    home: new Home(data: new List<String>.generate(300, (i) => "ini data ke $i"),),
    debugShowCheckedModeBanner: false,
  ));
}

class Home extends StatelessWidget {

  Home({this.data = const [""]});
  final List<String> data;

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: new AppBar(
          title: new Text("List View"),
        ),
        body: new Container(
          child: new ListView.builder(
            itemCount: data.length,
            itemBuilder: (context, index){
              return new ListTile(
                leading: new Icon(Icons.widgets),
                title: new Text("${data[index]}"),
              );
            }),
          ),
        );
  }
}
