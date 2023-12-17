import 'package:buku/detail2.dart';
import 'package:buku/models/dtcomic.dart';
import 'package:buku/view_model/fetcnews.dart';
import 'package:flutter/material.dart';
import 'package:buku/models/update.dart';
import 'package:buku/detail.dart';

class komikterbaru extends StatefulWidget {
  const komikterbaru({super.key});

  @override
  State<komikterbaru> createState() => _komikterbaruState();
}

class _komikterbaruState extends State<komikterbaru> {
  Future<List<Comic>>? _fetchKomik;

  @override
  void initState() {
    super.initState();
    _fetchKomik = FetchApi2.fetchKomikList();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(right: 10, left: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Komik Terbaru',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Container(
            height: 500,
            child: FutureBuilder<List<Comic>>(
              future: _fetchKomik,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return GridView.builder(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 3,
                      mainAxisSpacing: 4,
                    ),
                    itemCount: snapshot.data!.length,
                    itemBuilder: (context, index) {
                      final comic = snapshot.data![index];
                      return GestureDetector(
                        onTap: () {
                          final c = Comic(
                              title: comic.title,
                              url: comic.url,
                              cover: comic.cover,
                              latestChapter: comic.latestChapter,
                              latestChapterUrl: comic.latestChapterUrl,
                              rating: comic.rating);
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => ComicDetailPage(comic: c),
                            ),
                          );
                        },
                        child: Card(
                          child: Container(
                            decoration: BoxDecoration(
                                color: Colors.blue,
                                borderRadius: BorderRadius.circular(10)),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  child: Column(
                                    children: [
                                      Container(
                                        padding: EdgeInsets.all(5),
                                        height: 80,
                                        child: Image.network(
                                          comic.cover,
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                      Text(
                                        comic.title,
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold),
                                        textAlign: TextAlign.center,
                                      ),
                                      Text('Latest Chapter: '),
                                      Text('${comic.latestChapter}'),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
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
