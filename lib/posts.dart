import 'dart:convert';

import 'package:flutter/cupertino.dart';

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:https_request/http_serviece.dart';
//import 'package:https_request/http_service.dart';
import 'package:https_request/post_model.dart';

import 'post_model.dart';

class Postpage extends StatefulWidget {
  @override
  _PostpageState createState() => _PostpageState();
}

class _PostpageState extends State<Postpage> {
//   var queryParameters = {
//   'state': 'Andhra Pradesh',
//   'district': 'Chittor',
// };
  // final HttpService httpService = HttpService();
  final String postUrl =
      "https://api.data.gov.in/resource/9ef84268-d588-465a-a308-a864a43d0070?api-key=579b464db66ec23bdd00000133f585e2c6a244007be46a15bdf9ecf0&format=json&offset=0&limit=100";
  List<Post> templist;
  Future<List<Post>> getPosts() async {
    List<Post> list;
    Response res = await get(postUrl);
    print(res.statusCode);
    // print(res.body);
    if (res.statusCode == 200) {
      var data = jsonDecode(res.body);
      var rest = data["records"] as List;
      print(rest);
      // List<dynamic> body = jsonDecode(res.body);

      // List<Post> posts =
      //     body.map((dynamic item) => Post.fromJson(item)).toList();

      list = rest.map<Post>((json) => Post.fromJson(json)).toList();
      templist = list;
      return list;
    } else {
      throw "Can't get posts";
    }
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("Posts "),
      ),
      body: FutureBuilder(
        future: getPosts(),
        builder: (BuildContext context, AsyncSnapshot<List<Post>> snapshot) {
          if (snapshot.hasData) {
            List<Post> post = snapshot.data;
            return ListView(
              children: post
                  .map((Post post) => ListTile(
                        title: Text(post.state),
                        subtitle: Text(post.timestamp.toString() +
                            "[ Variety -" +
                            post.variety +
                            "] =Rs." +
                            post.modal_price),
                        isThreeLine: true,
                      ))
                  .toList(),
            );
          }
          return Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}
