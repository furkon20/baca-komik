class Comic {
  final String title;
  final String url;
  final String cover;
  final String latestChapter;
  final String latestChapterUrl;
  final double rating;

  Comic({
    required this.title,
    required this.url,
    required this.cover,
    required this.latestChapter,
    required this.latestChapterUrl,
    required this.rating,
  });

  factory Comic.fromJson(Map<String, dynamic> json) {
    return Comic(
      title: json['title'] ?? '',
      url: json['url'] ?? '',
      cover: json['cover'] ?? '',
      latestChapter: json['latestChapter'] ?? '',
      latestChapterUrl: json['latestChapterUrl'] ?? '',
      rating: json['rating'] ?? 0,
    );
  }
}

class KomikDetail {
  final String synopsis;
  final String ratingNum;
  final String rating;
  final String rank;
  final String alternative;
  final String author;
  final String artist;
  final String genre;
  final String type;
  final String tags;

  KomikDetail({
    required this.synopsis,
    required this.ratingNum,
    required this.rating,
    required this.rank,
    required this.alternative,
    required this.author,
    required this.artist,
    required this.genre,
    required this.type,
    required this.tags,
  });

  factory KomikDetail.fromJson(Map<String, dynamic> json) {
    return KomikDetail(
      synopsis: json['synopsis'],
      ratingNum: json['detailList'][0]['value'],
      rating: json['detailList'][1]['value'],
      rank: json['detailList'][2]['value'],
      alternative: json['detailList'][3]['value'],
      author: json['detailList'][4]['value'],
      artist: json['detailList'][5]['value'],
      genre: json['detailList'][6]['value'],
      type: json['detailList'][7]['value'],
      tags: json['detailList'][8]['value'],
    );
  }
}
