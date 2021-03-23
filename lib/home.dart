import 'package:apedolan/view/wisata.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:apedolan/dashboard.dart';
import 'package:apedolan/galeri.dart';
import 'package:apedolan/googleMaps.dart';
import 'package:apedolan/googleMapsMain.dart';

class MenuPage extends StatefulWidget {
  @override
  _MenuPageState createState() => _MenuPageState();
}

class _MenuPageState extends State<MenuPage> {
  
  int _selectedTabIndex = 0;

  void _onNavBarTapped(int index) {
    setState(() {
      _selectedTabIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    
  final _listPage = <Widget>[
    HomePage(),
    WisataPage(),
    GaleriPage(),
    MyMap(),
    
  ];

  final _bottomNavBarItems = <BottomNavigationBarItem>[
    BottomNavigationBarItem(
      icon: Icon(Icons.home),
      title: Text('Beranda'),
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.search_sharp),
      title: Text('Cari'),
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.photo),
      title: Text('Galeri'),
    ),
     BottomNavigationBarItem(
      icon: Icon(Icons.place_sharp),
      title: Text('Lokasi'),
    ),
  ];

  final _bottomNavBar = BottomNavigationBar(
    backgroundColor: Colors.blueGrey[50],
    items: _bottomNavBarItems,
    currentIndex: _selectedTabIndex,
    selectedItemColor: Colors.blueAccent[700],
    unselectedItemColor: Colors.blueAccent[200],
    onTap: _onNavBarTapped,
  );

  return Scaffold(
      body: Center(
        child: _listPage[_selectedTabIndex]
      ),
      bottomNavigationBar: _bottomNavBar,
    ); 
  }
}

