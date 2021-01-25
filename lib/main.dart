import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:async'; // async / await functions
import 'dart:convert'; // parse json sata

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Http Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Flutter Http Demo Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  // start of http function
  Future<String> getData() async {
    var response = await http.get(
        Uri.encodeFull("https://jsonplaceholder.typicode.com/posts"),
        headers: {"Accept": "application/json"});
    // print(response.body);
    // print(response.body.length);

    List jsonData = jsonDecode(response.body);
    // print(jsonData.length);
    // print(jsonData[0]);
    print(jsonData[3]['id']);
    print(jsonData[3]['title']);
    
  }

  // end of http function
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('Press Button to Get Data'),
            RaisedButton(
              onPressed: getData,
              child: Text('Get Data'),
            ),
          ],
        ),
      ),
    );
  }
}
