class Wisata {
  final String nama;
  final String deskripsi;
  final String alamat;
  final String image;
  final int nilai;
  final int harga;

  Wisata(
      {this.nama,
      this.deskripsi,
      this.alamat,
      this.image,
      this.nilai,
      this.harga});
}

List<Wisata> menu = [
  Wisata(
      nama: "Waduk Gunung Rawa",
      deskripsi:
          "Waduk ini terletak di lembah di antara beberapa puncak bukit di lereng Gunung Muria sebelah timur. Luas areal area waduknya sekitar +320 Ha",
      alamat: "Area Waduk Gunungrowo, Sitiluhur, Gembong, Kabupaten Pati",
      image: "images/menu/gambar1.jpg",
      nilai: 5,
      harga: 3000),
  Wisata(
      nama: "Embung Mini Jrahi",
      deskripsi:
          "Embung yang sejatinya digunakan untuk irigasi pertanian warga itu memiliki pemandangan yang apik, yakni hamparan hijau pepohonan dan lereng Gunung Muria",
      alamat: "Desa Jrahi, Kecamatan Gunungwungkal",
      image: "images/menu/gambar2.jpg",
      nilai: 5,
      harga: 3000),
  Wisata(
      nama: "Bendungan Kletek",
      deskripsi:
          "Bendungan air yang presentatif para pengunjung bisa menikmati beraneka ragam kuliner di komplek wisata yang tertata dengan apik dan nyaman.",
      alamat: "Desa Kletek, Kecamatan Pucakwangi, Kabupaten Pati",
      image: "images/menu/gambar3.jpg",
      nilai: 5,
      harga: 4000),
  Wisata(
      nama: "Juwana Water Fantasy",
      deskripsi:
          "Juwana Water Fantasy(JWF) adalah tempat wisata keluarga dengan bertemakan air",
      alamat: "Jalan Juwana-Rembang Km 7, Kabupaten Pati",
      image: "images/menu/gambar4.jpg",
      nilai: 5,
      harga: 25000),
  Wisata(
      nama: "Gua Pancur",
      deskripsi:
          "Kawasan wisata Gua Pancur berada di Kaki Pegunungan Kendeng Utara sebelah sisi barat laut. Pemandangan Pegunungan Kendeng Utara memberi sensasi tersendiri di kawasan ini",
      alamat: "Jimbaran,Kecamatan Kayen,Kabupaten Pati",
      image: "images/menu/gambar5.jpg",
      nilai: 5,
      harga: 20000),
  Wisata(
      nama: "Bukit Pandang Ki Santamulya",
      deskripsi:
          "Dari atas bukit, kita akan disajikan pemandangan wilayah Pati Selatan, layaknya objek wisata Eling Bening di Ambarawa.",
      alamat: "Desa Duren sawit,Kecamatan Kayen,Kabupaten Pati",
      image: "images/menu/gambar6.jpg",
      nilai: 5,
      harga: 3000),
];
