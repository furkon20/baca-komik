import 'dart:convert';
import 'package:buku/models/dtcomic.dart';
import 'package:http/http.dart' as http;

class FetchApi3 {
  static Future<List<Comic>> fetchKomikList() async {
    final response = await http.get(
      Uri.parse('https://indonesia-komik.p.rapidapi.com/v1/browse'),
      headers: {
        'X-RapidAPI-Key': '7c3889998emsh547075a1d21f4a0p1f31b8jsnd9b2bfff0de0',
        'X-RapidAPI-Host': 'indonesia-komik.p.rapidapi.com',
      },
    );

    if (response.statusCode == 200) {
      final jsonResponse = json.decode(response.body);
      final List<dynamic> newsList = jsonResponse['trendingList'];

      return newsList.map((json) => Comic.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load komik');
    }
  }
}
