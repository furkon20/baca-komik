import 'package:flutter/material.dart';
import 'package:buku/models/update.dart';
import 'package:buku/TypeAll.dart';

class Search extends StatefulWidget {
  Search({Key? key}) : super(key: key);

  @override
  _SearchState createState() => _SearchState();
}

class _SearchState extends State<Search> {
  final TextEditingController _searchController = TextEditingController();
  List<Map<String, String>> komikterbaru = terbaru;
  List<Map<String, String>> searchResults = [];

  void _handleSearch() {
    String searchText = _searchController.text;
    setState(() {
      searchResults = _searchItems(searchText);
    });
  }

  List<Map<String, String>> _searchItems(String searchText) {
    return komikterbaru
        .where((item) =>
            item['title']!.toLowerCase().contains(searchText.toLowerCase()))
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Pencarian Komik'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.clear),
            onPressed: () {
              setState(() {
                _searchController.clear();
                searchResults.clear();
              });
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(8),
          color: Colors.blue,
          child: Column(
            children: [
              Row(
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
                              controller: _searchController,
                              onEditingComplete: _handleSearch,
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
                            onTap: _handleSearch,
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
              if (searchResults.isNotEmpty)
                _buildSearchResults()
              else if (searchResults.isEmpty && _searchController.text.isNotEmpty)
                Center(
                  child: Text('Tidak ada hasil yang cocok.'),
                ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSearchResults() {
    return Expanded(
      child: ListView.builder(
        itemCount: searchResults.length,
        itemBuilder: (BuildContext context, int index) {
          final item = searchResults[index];
          return SearchResultItem(item);
        },
      ),
    );
  }
}

class SearchResultItem extends StatelessWidget {
  final Map<String, String> item;

  SearchResultItem(this.item);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => detailkategori(
              title: item['title']!,
              genre: item['genre']!,
              deskripsi: item['deskripsi']!,
              imagePath: item['imagePath']!,
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

// Kelas DetailKategori tetap sama
