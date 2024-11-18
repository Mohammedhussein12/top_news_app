class NewsResponse {
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

  String? status;
  String? code;
  String? message;
  int? totalResults;
  List<News>? news;
}

class News {
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
    source = json['source'] != null ? Source.fromJson(json['source']) : null;
    author = json['author'];
    title = json['title'];
    description = json['description'];
    url = json['url'];
    urlToImage = json['urlToImage'];
    publishedAt = DateTime.parse(json['publishedAt']);
    content = json['content'];
  }

  Source? source;
  dynamic author;
  String? title;
  String? description;
  String? url;
  String? urlToImage;
  DateTime? publishedAt;
  String? content;
}

class Source {
  Source({
    this.id,
    this.name,
  });

  Source.fromJson(dynamic json) {
    id = json['id'];
    name = json['name'];
  }

  String? id;
  String? name;
}
