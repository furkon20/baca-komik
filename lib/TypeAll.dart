import 'package:flutter/material.dart';
import 'package:buku/detail.dart';
import 'models/data.dart';


class AllType extends StatelessWidget {
   AllType({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ALL'),
      ),
      body: Column(
        children: [
           Container(
          padding: const EdgeInsets.all(8),
          color: Colors.blue,
          child: Row(
            children: [
              Expanded(
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(30.0),
                  ),
                  child: Row(
                    children: [
                      Icon(
                        Icons.search_outlined,
                        color: Colors.grey,
                      ),
                      const SizedBox(width: 8.0),
                      Expanded(
                        child: TextField(
                          // controller: _searchController, // Menghubungkan controller
                          // onEditingComplete: _handleSearch, // Menangani pencarian saat tombol "Enter" ditekan
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: 'Cari komik',
                            hintStyle: TextStyle(
                              color: Colors.grey,
                            ),
                          ),
                        ),
                      ),
                      GestureDetector(
                        // onTap: _handleSearch, // Menangani pencarian saat ikon pencarian ditekan
                        child: Icon(
                          Icons.search,
                          color: Colors.blue,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
          Container(
            child: Expanded(
              child: ListView.builder(
                itemCount: Rekomendasi.length,
                itemBuilder: (BuildContext context, int index) {
                  final item = Rekomendasi[index];
                  return buildListItem(item, context);
                },
              ),
            ),
          ),
        ],
      ),
    );
  }

  

  Widget buildListItem(Map<String, dynamic> item, BuildContext context) {

    final String imagePath = item['imagePath'] ?? '';
    final String cover = item['cover'] ?? '';
    final String title = item['title'] ?? '';
    final String genre = item['genre'] ?? '';
    final String deskripsi = item['deskripsi'] ?? '';
    final String jenis = item['jenis'] ?? '';
    final String status = item['status'] ?? '';
    final String author = item['author'] ?? '';
    final String rilis= item['rilis'] ?? '';
    final String artist = item['artist'] ?? '';
    final String awal = item['awal'] ?? '';
    final String akhir = item['baru'] ?? '';
    final String chapter = item['isi'] ?? '';   

    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => detail(
              title: title,
              genre: genre,
              deskripsi: deskripsi,
              imagePath: imagePath,
              cover: cover,
              jenis: jenis,
              status: status,
              author: author,
              artist: artist,
              rilis: rilis,
              awal: awal,
              akhir: akhir,
              chapter: chapter,
            ),
          ),
        );
      },
      child: Container(
        height: 120,
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(color: Colors.black),
        ),
        child: Center(
          child: Row(
            children: [
              Padding(padding: EdgeInsets.all(16)),
              Container(
                width: 80,
                height: 100,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(item['imagePath']!),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              SizedBox(width: 10),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    item['title']!,
                    style: TextStyle(fontSize: 16),
                  ),
                  SizedBox(height: 5),
                  Text(
                    item['genre']!,
                    style: TextStyle(fontSize: 12),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// Widget MyDetailScreen ...
class detailkategori extends StatelessWidget {
  final String title;
  final String genre;
  final String deskripsi;
  final String imagePath;

  detailkategori({
    required this.title,
    required this.genre,
    required this.deskripsi,
    required this.imagePath,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Detail Page'),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Container(
              padding: EdgeInsets.all(16),
              child: Image.asset(
                imagePath,
                width: 200,
                height: 200,
              ),
            ),
            Container(
              padding: EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Text(
                    title,
                    style: TextStyle(fontSize: 16),
                  ),
                  SizedBox(height: 10),
                  Text(
                    genre,
                    style: TextStyle(fontSize: 16),
                  ),
                  SizedBox(height: 10),
                  Text(
                    deskripsi,
                    style: TextStyle(fontSize: 16),
                    textAlign: TextAlign.justify,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

