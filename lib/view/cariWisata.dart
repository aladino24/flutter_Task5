import 'package:flutter/material.dart';
import 'package:apedolan/view/components/wisataPopuler.dart';
import 'package:apedolan/view/components/wisataLainnya.dart';
import 'package:apedolan/view/components/wisataMurah.dart';

class CariWisata extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            children: <Widget>[
              Stack(
                children: <Widget>[
                  Container(
                    height: height * 0.3,
                    width: width,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage("images/pati.jpg"),
                        fit: BoxFit.cover
                      ),
                    ),
                    child: Container(
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [
                            Colors.black.withOpacity(0.0),
                             Colors.black.withOpacity(0.0),
                              Colors.black.withOpacity(0.1),
                              Colors.black.withOpacity(0.5),
                              Colors.black.withOpacity(1.0),
                          ],
                          begin: Alignment.topRight,end: Alignment.bottomLeft
                          ),
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 95,
                    left: 20,
                    child: RichText(
                      text: TextSpan(
                        text: "Enjoy Your Live",
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w300,
                          fontSize: 20
                        ),
                        children: [
                          TextSpan(
                            text: "\nBy Travelling",
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w500,
                              fontSize: 24
                            ),
                          ),
                        ]
                      ),
                    ),
                  ),
                ],
              ),
              Transform.translate(
                offset: Offset(0.0, - (height * 0.3 - height * 0.26)),
                child: Container(
                  width: width,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30),
                    ),
                  ),
                  child: DefaultTabController(
                    length: 3, 
                    child: Column(
                      children: <Widget>[
                        TabBar(
                          labelColor: Colors.black,
                          labelStyle: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 18
                          ),
                          unselectedLabelColor: Colors.grey[400],
                          unselectedLabelStyle: TextStyle(
                            fontWeight: FontWeight.normal,
                            fontSize: 17
                          ),
                          indicatorSize: TabBarIndicatorSize.label,
                          indicatorColor: Colors.transparent,
                        tabs: <Widget>[
                          Tab(child: Text("Terpopuler"),),
                          Tab(child: Text("Murah"),),
                          Tab(child: Text("Lainnya"),),
                         ],
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 20, right: 20, bottom: 10),
                          child: TextField(
                            decoration: InputDecoration(
                              contentPadding: EdgeInsets.symmetric(vertical:3),
                              prefixIcon: Padding(
                                padding: const EdgeInsets.only(left: 15, right: 15),
                                child: Icon(Icons.search,
                                 size: 30,
                                ),
                              ),
                              hintText: "Search",
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(30),
                                borderSide: BorderSide(
                                  width: 1.0, color: Colors.grey[400],
                                ),
                              ),
                            ),
                          ),
                        ),
                        Container(
                          height: height * 0.6,
                          child: TabBarView(
                            children: <Widget>[
                              Populer(),
                              Murah(),
                              Lainnya(),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}