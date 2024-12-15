import 'package:hive/hive.dart';

part 'source_response.g.dart';

@HiveType(typeId: 1)
class SourceResponse extends HiveObject {
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

  @HiveField(0)
  String? status;
  @HiveField(1)
  String? code;
  @HiveField(2)
  String? message;
  @HiveField(3)
  List<Source>? sources;
}

@HiveType(typeId: 2)
class Source extends HiveObject {
  Source({
    this.id,
    this.name,
    this.description,
    this.url,
    this.category,
    this.language,
    this.country,
  });

  @HiveField(4)
  String? id;

  @HiveField(5)
  String? name;

  @HiveField(6)
  String? description;

  @HiveField(7)
  String? url;

  @HiveField(8)
  String? category;

  @HiveField(9)
  String? language;

  @HiveField(10)
  String? country;

  Source.fromJson(dynamic json) {
    id = json['id'];
    name = json['name'];
    description = json['description'];
    url = json['url'];
    category = json['category'];
    language = json['language'];
    country = json['country'];
  }
}
