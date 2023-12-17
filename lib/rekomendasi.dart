import 'package:buku/detail2.dart';
import 'package:buku/models/dtcomic.dart';
import 'package:buku/view_model/fectrekom.dart';
import 'package:flutter/material.dart';
import 'package:buku/models/Data.dart';
import 'package:buku/detail.dart';

class MyRekomendasi extends StatefulWidget {
  const MyRekomendasi({Key? key});

  @override
  State<MyRekomendasi> createState() => _MyRekomendasiState();
}

class _MyRekomendasiState extends State<MyRekomendasi> {
  Future<List<dynamic>>? _fetchKomik;

  @override
  void initState() {
    super.initState();
    _fetchKomik = FetchApi.fetchKomikList();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Rekomendasi',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Container(
            margin: const EdgeInsets.all(4),
            height: 150,
            child: FutureBuilder<List<dynamic>>(
              future: _fetchKomik,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return ListView.builder(
                    itemCount: snapshot.data!.length,
                    itemBuilder: (context, index) {
                      final komik = snapshot.data![index];
                      return Column(
                        children: [
                          SizedBox(height: 10,),
                          Container(
                            decoration: BoxDecoration(
                                color: Colors.blue,
                                borderRadius: BorderRadius.circular(10)),
                            padding: EdgeInsets.all(10),
                            child: ListTile(
                              title: Text(komik['title']),
                              subtitle: Text(komik['latestChapter']),
                              leading: Image.network(komik['cover']),
                              onTap: () {
                                final c = Comic(
                                    title: komik['title'],
                                    url: komik['url'],
                                    cover: komik['cover'],
                                    latestChapter: komik['latestChapter'],
                                    latestChapterUrl: komik['latestChapterUrl'],
                                    rating: komik['rating']);
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => ComicDetailPage(comic: c),
                                  ),
                                );
                              },
                            ),
                          ),
                        ],
                      );
                    },
                  );
                } else if (snapshot.hasError) {
                  return Center(
                    child: Text('${snapshot.error}'),
                  );
                }
                return Center(
                  child: CircularProgressIndicator(),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
