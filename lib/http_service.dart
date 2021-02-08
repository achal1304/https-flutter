import 'dart:convert';

import 'package:http/http.dart';
import "package:https_request/http_service.dart";
import 'package:https_request/post_model.dart';

class HttpService {
  final String postUrl = "http://jsonplaceholder.typicode.com/posts";

  Future<List<Post>> getPosts() async {
    Response res = await get(postUrl);
 
    if (res.statusCode == 200) {
      List<dynamic> body = jsonDecode(res.body);

      List<Post> posts =
          body.map((dynamic item) => Post.fromJson(item)).toList();

      return posts;
    } else {
      throw "Can't get posts";
    }
  }
}
