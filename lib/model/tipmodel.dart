// To parse this JSON data, do
//
//     final tip = tipFromJson(jsonString);

import 'dart:convert';

Tip tipFromJson(String str) => Tip.fromJson(json.decode(str));

String tipToJson(Tip data) => json.encode(data.toJson());

class Tip {
  String message;
  int statusCode;
  List<Datum> data;

  Tip({
    required this.message,
    required this.statusCode,
    required this.data,
  });

  factory Tip.fromJson(Map<String, dynamic> json) => Tip(
    message: json["message"],
    statusCode: json["statusCode"],
    data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "message": message,
    "statusCode": statusCode,
    "data": List<dynamic>.from(data.map((x) => x.toJson())),
  };
}

class Datum {
  String id;
  Media media;
  String title;
  String content;
  DateTime createdAt;
  Stats stats;
  Flags flags;

  Datum({
    required this.id,
    required this.media,
    required this.title,
    required this.content,
    required this.createdAt,
    required this.stats,
    required this.flags,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    id: json["id"],
    media: Media.fromJson(json["media"]),
    title: json["title"],
    content: json["content"],
    createdAt: DateTime.parse(json["createdAt"]),
    stats: Stats.fromJson(json["stats"]),
    flags: Flags.fromJson(json["flags"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "media": media.toJson(),
    "title": title,
    "content": content,
    "createdAt": createdAt.toIso8601String(),
    "stats": stats.toJson(),
    "flags": flags.toJson(),
  };
}

class Flags {
  bool liked;

  Flags({
    required this.liked,
  });

  factory Flags.fromJson(Map<String, dynamic> json) => Flags(
    liked: json["liked"],
  );

  Map<String, dynamic> toJson() => {
    "liked": liked,
  };
}

class Media {
  String source;
  String type;

  Media({
    required this.source,
    required this.type,
  });

  factory Media.fromJson(Map<String, dynamic> json) => Media(
    source: json["source"],
    type: json["type"],
  );

  Map<String, dynamic> toJson() => {
    "source": source,
    "type": type,
  };
}

class Stats {
  int likeCount;

  Stats({
    required this.likeCount,
  });

  factory Stats.fromJson(Map<String, dynamic> json) => Stats(
    likeCount: json["likeCount"],
  );

  Map<String, dynamic> toJson() => {
    "likeCount": likeCount,
  };
}
