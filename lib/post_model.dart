import 'package:flutter/cupertino.dart';

class Post {
  final int useId;
  final int id;
  final String title;
  final String body;

  Post(
      {@required this.useId,
      @required this.id,
      @required this.title,
      @required this.body});

  factory Post.fromJson(Map<String, dynamic> json) {
    Post(
        useId: json["userId"] as int,
        id: json["id"] as int,
        body: json["body"] as String,
        title: json["title"] as String);
  }
}
