import 'dart:convert';
import 'package:http/http.dart' as http;

class ComicApi {
  static Future<String> fetchComicData() async {
    const String url =
        'https://indonesia-komik.p.rapidapi.com/v1/comic';

    final Map<String, String> headers = {
      'X-RapidAPI-Key': 'd7059524b9mshc70b830d916cd3bp12c42fjsn22cf4934ecb3',
      'X-RapidAPI-Host': 'indonesia-komik.p.rapidapi.com',
    };

    try {
      final response = await http.get(Uri.parse(url), headers: headers);

      if (response.statusCode == 200) {
        return response.body;
      } else {
        throw Exception('Failed to fetch comic data');
      }
    } catch (error) {
      throw Exception('Error: $error');
    }

    
  }
  static Future<String> fetchComicDetail(String urlComic) async {
    const String url =
        'https://indonesia-komik.p.rapidapi.com/v1/comic';

    final Map<String, String> headers = {
      'X-RapidAPI-Key': '7c3889998emsh547075a1d21f4a0p1f31b8jsnd9b2bfff0de0',
      'X-RapidAPI-Host': 'indonesia-komik.p.rapidapi.com',
    };

    try {
      final response = await http.get(Uri.parse(url), headers: headers);

      if (response.statusCode == 200) {
        return response.body;
      } else {
        throw Exception('Failed to fetch comic data');
      }
    } catch (error) {
      throw Exception('Error: $error');
    }

    
  }
}
