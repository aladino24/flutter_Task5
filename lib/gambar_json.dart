class Photo {
  String id;
  String title;
  String galeri;
  String url;

  Photo({this.id, this.title, this.galeri, this.url});

  Photo.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    galeri = json['galeri'];
    url = json['url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['galeri'] = this.galeri;
    data['url'] = this.url;
    return data;
  }
}