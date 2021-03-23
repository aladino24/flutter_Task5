import 'package:flutter/material.dart';
import './galeri.dart';
import 'package:apedolan/network/network_request.dart';
import 'package:apedolan/detailGambar.dart';
import 'package:apedolan/galeri.dart';
import 'package:apedolan/gambar_json.dart';




class PhotoCell extends StatelessWidget {
  
@required
final Photo photo;
const PhotoCell(this.photo);

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10)
      ),
      color: Colors.white,
      child: Padding(
        padding: EdgeInsets.all(10),
        child: Container(
          alignment: Alignment.center,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              Flexible(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Hero(
                  tag: "image${photo.id}", 
                  child: FadeInImage.assetNetwork(
                    placeholder: "images/no_image.png", 
                    image: photo.url,
                    width: 150,
                    height: 150,
                    )
                  ),
                  )
                ),
                // Padding(
                //   padding: EdgeInsets.all(10),
                //   child: Text(
                //     photo.title,
                //   ),
                // ),
            ],
          ),
          ),
      ),
    );
  }
}