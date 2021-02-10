// import 'dart:convert';

// import 'package:http/http.dart';
// //import "package:https_request/http_service.dart";
// import 'package:https_request/post_model.dart';

// import 'post_model.dart';

// class HttpService {
//   final String postUrl =
//       "https://api.data.gov.in/resource/9ef84268-d588-465a-a308-a864a43d0070?api-key=579b464db66ec23bdd00000133f585e2c6a244007be46a15bdf9ecf0&format=json&offset=0&limit=100";

//   Future<List<Post>> getPosts() async {
//     List<Post> list;
//     Response res = await get(postUrl);
//     print(res.statusCode);
//     // print(res.body);
//     if (res.statusCode == 200) {
//       var data = jsonDecode(res.body);
//       var rest = data["records"] as List;
//       print(rest);
//       // List<dynamic> body = jsonDecode(res.body);

//       // List<Post> posts =
//       //     body.map((dynamic item) => Post.fromJson(item)).toList();

//       list = rest.map<Post>((json) => Post.fromJson(json)).toList();

//       return list;
//     } else {
//       throw "Can't get posts";
//     }
//   }
// }
