import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'models/image_model.dart' as image_model;
import 'dart:convert' as convert;
import 'widgets/image_list.dart' as image_list;

class App extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return AppState();
  }
}

class AppState extends State<App> {
  num _counter = 0;
  List<image_model.ImageModel> images = [];

  void fetchImage() async {
    this._counter ++;
    final http.Response response = await http.get('https://jsonplaceholder.typicode.com/photos/${this._counter}');
    image_model.ImageModel imageModel = image_model.ImageModel.fromJson(convert.json.decode(response.body));
    setState(() => this.images.add(imageModel));
    print(imageModel);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(title: Text('Great app starts here!')),
        body: image_list.ImageList(this.images),
        floatingActionButton: FloatingActionButton(
          onPressed: this.fetchImage,
          child: Icon(Icons.add, color: Colors.white, size: 30),
        ),
      ),
    );
  }
}
