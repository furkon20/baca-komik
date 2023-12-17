import 'package:buku/models/dtcomic.dart';
import 'package:buku/view_model/fectrekom.dart';
import 'package:flutter/material.dart';

class ComicDetailPage extends StatefulWidget {
  final Comic comic;

  ComicDetailPage({required this.comic});

  @override
  State<ComicDetailPage> createState() => _ComicDetailPageState();
}

class _ComicDetailPageState extends State<ComicDetailPage> {
  late Future<KomikDetail> _fetchKomikDetail;

  @override
  void initState() {
    super.initState();
    _fetchKomikDetail = FetchApi.fetchKomikDetail(widget.comic.url);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Comic Detail'),
      ),
      body: FutureBuilder<KomikDetail>(
        future: _fetchKomikDetail,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else if (snapshot.hasError) {
            return Center(
              child: Text('Error: ${snapshot.error}'),
            );
          } else if (!snapshot.hasData) {
            return Center(
              child: Text('No data available'),
            );
          }

          KomikDetail komikDetail = snapshot.data!;

          return SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Center(
                    child: Container(
                      child: Image.network(
                        widget.comic.cover,
                        height: 300,
                        width: 200,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  SizedBox(height: 16),
                  Padding(padding: EdgeInsets.only(right: 20)),
                  Container(
                    child: Text(
                      widget.comic.title,
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                  ),
                  SizedBox(height: 8),
                  Container(
                    child: Text(
                      'Latest Chapter: ${widget.comic.latestChapter}',
                      style: TextStyle(fontSize: 16),
                    ),
                  ),
                  SizedBox(height: 16),
                  Container(child: Text('Synopsis: ${komikDetail.synopsis}')),
                  Container(child: Text('Rank: ${komikDetail.rank}')),
                  Container(child: Text('Author(s): ${komikDetail.author}')),
                  Container(child: Text('Artist(s): ${komikDetail.artist}')),
                  Container(child: Text('Genre(s): ${komikDetail.genre}')),
                  Container(child: Text('Type: ${komikDetail.type}')),
                  Container(child: Text('Tag(s): ${komikDetail.tags}')),
                  SizedBox(height: 16),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
