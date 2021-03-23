import 'package:apedolan/widgets/movie_box.dart';
import 'package:flutter/material.dart';
import 'package:apedolan/widgets/movie_box.dart';
import 'package:apedolan/style/styles.dart';
import 'package:apedolan/drawer.dart';
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:apedolan/detailBerita.dart';


String urlnya= "http://azdev.my.id/berita/";
class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
   Future<List> getData() async{
    final responseData = await http.get(urlnya + "berita.php");
    return json.decode(responseData.body);
  }
  @override
  Widget build(BuildContext context) {
    PageController controller = PageController(initialPage:0, viewportFraction: 0.7);
    List<String> url = [
      "http://azdev.my.id/images/gambar1.jpg",
      "http://azdev.my.id/images/gambar2.jpg",
      "http://azdev.my.id/images/gambar3.jpeg",
      "http://azdev.my.id/images/gambar4.jpg",
      "http://azdev.my.id/images/gambar5.jpg",
      "http://azdev.my.id/images/gambar6.jpg",
      "http://azdev.my.id/images/gambar7.jpg",
      "http://azdev.my.id/images/gambar8.jpg",
      "http://azdev.my.id/images/gambar9.jpg",
      "http://azdev.my.id/images/gambar10.jpg",
      "http://azdev.my.id/images/gambar11.jpg",
      "http://azdev.my.id/images/gambar12.jpg"
    ];
    Size size= MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.green[400],
      appBar: AppBar(
        title: Text("Menu Wisata di Pati",
        style: TextStyle(
          fontFamily: 'Akaya',
          fontSize: 24
        ),
        ),
        backgroundColor: Colors.green[400],
      ),
      drawer: DrawerWidget(),
      body: Column(
        children: [
          Container(    
            height: size.height * 0.22,
            decoration: BoxDecoration(
              color: Colors.green[400],
            ),
            child: PageView.builder(
                controller:controller ,
                itemCount: url.length,
                itemBuilder: (context, index)=>Column(
                  children: [
                    Container(
                      child: Column(
                        children: [
                        MovieBox(url[index]),
                        ],
                      ), 
                    ),
                  ],
                ),
            ),
          ),
          Column(
            children: [
              Container(  
                height: size.height * 0.5956,
                 decoration: BoxDecoration(
                  color: Colors.blue[100],
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(28),
                    topRight: Radius.circular(28),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: FutureBuilder(
                     future: getData(),
                      builder: (context, snapshot){
                        if (snapshot.hasError)print(snapshot.error) ;
                          return snapshot.hasData
                          ? new ItemList(list: snapshot.data)
                          : new Center(child: CircularProgressIndicator(),
                          );
                        
                      }
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}


class ItemList extends StatelessWidget {
  final List list;
  ItemList({this.list});
  @override
  Widget build(BuildContext context) {
    return new ListView.builder(
      itemCount: list== null ? 0 : list.length,
      itemBuilder: (context, i){
        return new Container(
          height: 130.0,
          padding: const EdgeInsets.only(left:5.0,right: 5.0,top: 3.0,bottom: 3.0),
          child: new GestureDetector(
            onTap: (){
              // klik akan tampil detail halaman berita
              Navigator.of(context).push(new MaterialPageRoute(
                builder: (context) => DetailBerita(
                  list :list,
                  index : i,
                )
             ));
            },
            child: new Card(
              child: new ListTile(
                title: new Text(
                  list[i]['judul'],
                  style: new TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.blue[400],
                  ),
                ),
                subtitle: new Text(
                  "Tanggal : ${list[i]['tanggal']}"
                ),
                trailing: new Image.network(
                  urlnya + 'gambar/'+list[i]['gambar'],
                  fit: BoxFit.cover,
                  height: 100.0,
                  width: 100.0,
                ),
              ),
            ),
          ),
        );
      }
    );
  }
}






