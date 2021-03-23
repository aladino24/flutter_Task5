import 'package:flutter/material.dart';

class DetailBerita extends StatefulWidget {
  List list;
  int index;

  DetailBerita({this.list,this.index});
  @override
  _DetailBeritaState createState() => _DetailBeritaState();
}

class _DetailBeritaState extends State<DetailBerita> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('${widget.list[widget.index]['judul']}'),
        backgroundColor: Colors.blue[400],
      ),
      body: new ListView(
        children: <Widget>[
          new Image.network("http://azdev.my.id/berita/gambar/" + widget.list[widget.index]['gambar']),
          new Container(
            padding: const EdgeInsets.all(20.0),
            child: new Row(
              children: [
                new Expanded(
                  child: new Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      new Container(
                        padding: const EdgeInsets.only(bottom : 5.0),
                        child: new Text(
                          widget.list[widget.index]['judul'],
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      new Text(
                        'Tanggal : '+ widget.list[widget.index]['tanggal'],
                        style: new TextStyle(
                          color: Colors.blue[700],
                        ),
                      ),
                    ],
                  )
                  ),
                  new Icon(
                    Icons.star,
                    color: Colors.blue[700],
                  ),
              ],
            ),
          ),
          new Container(
            padding: const EdgeInsets.all(20.0),
            child: new Text(
              widget.list[widget.index]['konten'],
              softWrap: true,
            ),
          ),
        ],
      ),
    );
  }
}