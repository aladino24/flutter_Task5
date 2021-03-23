// TODO Implement this library.
import 'dart:convert';
import 'package:flutter/foundation.dart';
import '../galeri.dart';
import 'package:http/http.dart' as http;
import 'package:apedolan/gambar_json.dart';
import 'package:apedolan/detailGambar.dart';
import 'package:apedolan/galeri.dart';

class NetworkRequest {
  static const String url = 'http://azdev.my.id/galeri/';

  static List<Photo> parsePhotos(String responseBody) {
    var list = json.decode(responseBody) as List<dynamic>;
    List<Photo> photos = list.map((model) => Photo.fromJson(model)).toList();
    return photos;
  }
  static Future<List<Photo>> fetchPhotos() async{
    final response = await http.get('$url');
    if (response.statusCode == 200) {
      return compute(parsePhotos, response.body);
    }else {
      throw Exception('Can\'t get image');
    }
  }
}