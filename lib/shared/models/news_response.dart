import 'package:hive/hive.dart';

part 'news_response.g.dart';

@HiveType(typeId: 3)
class NewsResponse extends HiveObject {
  NewsResponse({
    this.status,
    this.totalResults,
    this.news,
    this.code,
    this.message,
  });

  NewsResponse.fromJson(dynamic json) {
    status = json['status'];
    totalResults = json['totalResults'];
    if (json['articles'] != null) {
      news = [];
      json['articles'].forEach((v) {
        news?.add(News.fromJson(v));
      });
    }
  }

  @HiveField(11)
  String? status;
  @HiveField(12)
  String? code;
  @HiveField(13)
  String? message;
  @HiveField(14)
  int? totalResults;
  @HiveField(15)
  List<News>? news;
}

@HiveType(typeId: 4)
class News extends HiveObject {
  News({
    this.source,
    this.author,
    this.title,
    this.description,
    this.url,
    this.urlToImage,
    this.publishedAt,
    this.content,
  });

  News.fromJson(dynamic json) {
    source =
        json['source'] != null ? NewsSource.fromJson(json['source']) : null;
    author = json['author'];
    title = json['title'];
    description = json['description'];
    url = json['url'];
    urlToImage = json['urlToImage'];
    publishedAt = DateTime.parse(json['publishedAt']);
    content = json['content'];
  }

  @HiveField(16)
  NewsSource? source;
  @HiveField(17)
  dynamic author;
  @HiveField(18)
  String? title;
  @HiveField(19)
  String? description;
  @HiveField(20)
  String? url;
  @HiveField(21)
  String? urlToImage;
  @HiveField(22)
  DateTime? publishedAt;
  @HiveField(23)
  String? content;
}

@HiveType(typeId: 5)
class NewsSource extends HiveObject {
  NewsSource({
    this.id,
    this.name,
  });

  NewsSource.fromJson(dynamic json) {
    id = json['id'];
    name = json['name'];
  }

  @HiveField(24)
  String? id;
  @HiveField(25)
  String? name;
}
