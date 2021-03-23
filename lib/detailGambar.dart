import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:apedolan/grid_cell.dart';
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:apedolan/detailBerita.dart';
import 'package:apedolan/galeri.dart';
import 'package:apedolan/network/network_request.dart';
import 'package:apedolan/gambar_json.dart';

class GridDetails extends StatefulWidget {
  final Photo photo;
  GridDetails({@required this.photo});
  @override
  _GridDetailsState createState() => _GridDetailsState();
}

class _GridDetailsState extends State<GridDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[350],
      body: Container(
        alignment: Alignment.center,
        margin: EdgeInsets.all(30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Hero(
              tag: "image${widget.photo.id}", 
              child: FadeInImage.assetNetwork(
                placeholder: "images/no_image.png", 
                image: widget.photo.url
                )
              ),
              SizedBox(
                height: 30,
              ),
              OutlineButton(
                child: Icon(Icons.close),
                onPressed:() => Navigator.of(context).pop() 
                ),
          ],
        ),
      ),
    );
  }
}