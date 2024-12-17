// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'news_response.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class NewsResponseAdapter extends TypeAdapter<NewsResponse> {
  @override
  final int typeId = 3;

  @override
  NewsResponse read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return NewsResponse(
      status: fields[11] as String?,
      totalResults: fields[14] as int?,
      news: (fields[15] as List?)?.cast<News>(),
      code: fields[12] as String?,
      message: fields[13] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, NewsResponse obj) {
    writer
      ..writeByte(5)
      ..writeByte(11)
      ..write(obj.status)
      ..writeByte(12)
      ..write(obj.code)
      ..writeByte(13)
      ..write(obj.message)
      ..writeByte(14)
      ..write(obj.totalResults)
      ..writeByte(15)
      ..write(obj.news);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is NewsResponseAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class NewsAdapter extends TypeAdapter<News> {
  @override
  final int typeId = 4;

  @override
  News read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return News(
      source: fields[16] as NewsSource?,
      author: fields[17] as dynamic,
      title: fields[18] as String?,
      description: fields[19] as String?,
      url: fields[20] as String?,
      urlToImage: fields[21] as String?,
      publishedAt: fields[22] as DateTime?,
      content: fields[23] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, News obj) {
    writer
      ..writeByte(8)
      ..writeByte(16)
      ..write(obj.source)
      ..writeByte(17)
      ..write(obj.author)
      ..writeByte(18)
      ..write(obj.title)
      ..writeByte(19)
      ..write(obj.description)
      ..writeByte(20)
      ..write(obj.url)
      ..writeByte(21)
      ..write(obj.urlToImage)
      ..writeByte(22)
      ..write(obj.publishedAt)
      ..writeByte(23)
      ..write(obj.content);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is NewsAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class NewsSourceAdapter extends TypeAdapter<NewsSource> {
  @override
  final int typeId = 5;

  @override
  NewsSource read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return NewsSource(
      id: fields[24] as String?,
      name: fields[25] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, NewsSource obj) {
    writer
      ..writeByte(2)
      ..writeByte(24)
      ..write(obj.id)
      ..writeByte(25)
      ..write(obj.name);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is NewsSourceAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
