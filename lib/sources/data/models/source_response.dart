class SourceResponse {
  SourceResponse({
    this.status,
    this.sources,
    this.code,
    this.message,
  });

  SourceResponse.fromJson(dynamic json) {
    status = json['status'];
    if (json['sources'] != null) {
      sources = [];
      json['sources'].forEach((v) {
        sources?.add(Source.fromJson(v));
      });
    }
  }

  String? status;
  String? code;
  String? message;
  List<Source>? sources;
}

class Source {
  Source({
    this.id,
    this.name,
    this.description,
    this.url,
    this.category,
    this.language,
    this.country,
  });

  Source.fromJson(dynamic json) {
    id = json['id'];
    name = json['name'];
    description = json['description'];
    url = json['url'];
    category = json['category'];
    language = json['language'];
    country = json['country'];
  }

  String? id;
  String? name;
  String? description;
  String? url;
  String? category;
  String? language;
  String? country;
}
