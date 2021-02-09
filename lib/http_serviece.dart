import 'dart:convert';

import 'package:http/http.dart';
//import "package:https_request/http_service.dart";
import 'package:https_request/post_model.dart';

class HttpService {
  final String postUrl =
      "https://api.data.gov.in/resource/9ef84268-d588-465a-a308-a864a43d0070?api-key=579b464db66ec23bdd00000133f585e2c6a244007be46a15bdf9ecf0&format=json&offset=1&limit=1";

  Future<List<Post>> getPosts() async {
    Response res = await get(postUrl);
    print(res.statusCode);
    print(res.body);
    /*if (res.statusCode == 200) {
      List<dynamic> body = jsonDecode(res.body);

      List<Post> posts =
          body.map((dynamic item) => Post.fromJson(item)).toList();

      return posts;
    } else {
      throw "Can't get posts";
    }*/
  }
}
