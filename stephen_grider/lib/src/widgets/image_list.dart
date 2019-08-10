import 'package:flutter/material.dart';
import '../models/image_model.dart' as image_model;

class ImageList extends StatelessWidget {
  final List<image_model.ImageModel> images;

  ImageList(this.images);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: this.images.length,
        itemBuilder: (BuildContext context, int index) {
          return this.buildImage(this.images[index]);
        });
  }

  Widget buildImage(image_model.ImageModel image) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.grey,
        ),
      ),
      padding: EdgeInsets.all(20.0),
      margin: EdgeInsets.all(20.0),
      child: Column(
        children: <Widget>[
          Padding(
            child: Image.network(image.url),
            padding: EdgeInsets.only(bottom: 10.0),
          ),
          Text(image.title),
        ],
      ),
    );
  }
}
