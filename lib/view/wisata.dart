import 'package:apedolan/view/cariWisata.dart';
import 'package:flutter/material.dart';

void main() => runApp(WisataPage());

class WisataPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Cari Wisata',
      theme: ThemeData(
      primarySwatch: Colors.green,
      ),
      home: CariWisata(),
    );
  }
}