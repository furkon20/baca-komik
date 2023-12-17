import 'package:flutter/material.dart';
import 'package:buku/home.dart';
import 'package:buku/komikterbaru.dart';

class detail extends StatelessWidget {
  final String title;
  final String genre;
  final String deskripsi;
  final String imagePath;
  final String cover;
  final String jenis;
  final String status;
  final String author;
  final String rilis;
  final String artist;
  final String awal;
  final String akhir;
  final String chapter;

  detail({
    required this.title,
    required this.genre,
    required this.deskripsi,
    required this.imagePath,
    required this.cover,
    required this.jenis,
    required this.status,
    required this.author,
    required this.rilis,
    required this.artist,
    required this.awal,
    required this.akhir,
    required this.chapter,
  });

  @override
  Widget build(BuildContext context) {
    String angkaString = chapter;
    int chapt = int.parse(angkaString);
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Image.asset(cover, fit: BoxFit.cover),
            Row(
              children: [
                Container(
                  padding: EdgeInsets.only(top: 20, bottom: 10, right: 10, left: 10),
                  child: Image.asset(
                    imagePath,
                    width: 120,
                    height: 190,
                  ),
                ),
                Container(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                        child: Row(
                          children: [
                            Text(
                              "Judul : ",
                              style: TextStyle(fontSize: 12),
                            ),
                            Text(
                              title,
                              style: TextStyle(fontSize: 12),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 10),
                      Container(
                        child: Row(
                          children: [
                            Text(
                              "Status : ",
                              style: TextStyle(fontSize: 12),
                            ),
                            Text(
                              status,
                              style: TextStyle(fontSize: 12),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 10),
                      Container(
                        child: Row(
                          children: [
                            Text(
                              "Jenis Komik : ",
                              style: TextStyle(fontSize: 12),
                            ),
                            Text(
                              jenis,
                              style: TextStyle(fontSize: 12),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 10),
                      Container(
                        child: Row(
                          children: [
                            Text(
                              "Genre : ",
                              style: TextStyle(fontSize: 12),
                            ),
                            Text(
                              genre,
                              style: TextStyle(fontSize: 12),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 10),
                      Container(
                        child: Row(
                          children: [
                            Text(
                              "Author : ",
                              style: TextStyle(fontSize: 12),
                            ),
                            Text(
                              author,
                              style: TextStyle(fontSize: 12),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 10),
                      Container(
                        child: Row(
                          children: [
                            Text(
                              "Artist : ",
                              style: TextStyle(fontSize: 12),
                            ),
                            Text(
                              artist,
                              style: TextStyle(fontSize: 12),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 10),
                      Container(
                        child: Row(
                          children: [
                            Text(
                              "Rilis : ",
                              style: TextStyle(fontSize: 12),
                            ),
                            Text(
                              rilis,
                              style: TextStyle(fontSize: 12),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 10),
                    ],
                  ),
                ),
              ],
            ),
            Container(
              padding: EdgeInsets.only(right: 16),
              margin: EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    'sinopsis',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 10),
                  Text(
                    deskripsi,
                    style: TextStyle(fontSize: 12),
                    textAlign: TextAlign.justify,
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.all(10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {},
                      child: Text(awal),
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {},
                      child: Text(akhir),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
                padding: EdgeInsets.only(top: 10, bottom: 24, right: 10, left: 10),
                child: Container(
                  padding: EdgeInsets.only(bottom: 16, top: 16),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(8)),
                    color: Colors.blue,
                  ),
                  child: Column(
                    children: [
                      Align(
                        alignment: Alignment.center,
                        child: Padding(
                          padding: const EdgeInsets.only(bottom: 10, top: 10),
                          child: Text("CHAPTER", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 16),),
                        ),
                      ),
                      Container(
                        height: 200,
                        child: ListView.builder( 
                          itemCount: chapt,
                          itemBuilder: (context, index) {
                            // Mengembalikan widget ListTile dengan teks angka
                            return ListTile(
                              title: Text("Chapter "+(index + 1)
                                  .toString(), style: TextStyle(color: Colors.white),), // Mengonversi indeks ke angka
                              onTap: () {
                                // Tambahkan logika ketika item diklik di sini.
                              },
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                )),
              komikterbaru()
          ],
        ),
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: MyHome(),
  ));
}
