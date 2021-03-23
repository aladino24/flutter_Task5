import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:apedolan/gambar_json.dart';
import 'package:apedolan/detailGambar.dart';
import 'package:apedolan/grid_cell.dart';
import 'package:apedolan/network/network_request.dart';



class GaleriPage extends StatefulWidget {
  @override
  _GaleriPageState createState() => _GaleriPageState();
}

class _GaleriPageState extends State<GaleriPage> {
  gridView(AsyncSnapshot<List<Photo>> snapshot){
    return Padding(
      padding: EdgeInsets.all(5),
      child: GridView.count(
        crossAxisCount: 2,
        childAspectRatio: 1,
        mainAxisSpacing: 4,
        children: snapshot.data.map((photo) {
          return GestureDetector(
            child: GridTile(
              child: PhotoCell(photo),
              ),
              onTap: (){
                gotoDetailPage(context, photo);
              },
          );
        }).toList(),
        ),
      );
  }

  gotoDetailPage(BuildContext context, Photo photo){
    Navigator.push(
      context, 
      MaterialPageRoute(
        builder: (BuildContext context)=> GridDetails(photo: photo)
      )
      );
  }

  circularProgress(){
    return Center(
      child: CircularProgressIndicator(),
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Galeri Wisata di Pati'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          Flexible(
            child: FutureBuilder<List<Photo>>(
              future: NetworkRequest.fetchPhotos(),
              builder: (context, snapshot){
                if (snapshot.hasError) {
                  return Text('Error ${snapshot.error}');
                } else if(snapshot.hasData){
                  return gridView(snapshot);
                }
                return circularProgress();
              },
            )
            )
        ],
      ),
    );
  }
}