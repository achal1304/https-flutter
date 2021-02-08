import 'package:flutter/cupertino.dart';

import 'package:flutter/material.dart';
import 'package:https_request/http_service.dart';
import 'package:https_request/post_model.dart';

class Postpage extends StatelessWidget {
  final HttpService httpService = HttpService();

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("Posts "),
      ),
      body: FutureBuilder(
        future: httpService.getPosts(),
        builder: (BuildContext context, AsyncSnapshot<List<Post>> snapshot) {
          /*if (snapshot.hasData) {
            List<Post> post = snapshot.data;
            return ListView(
              children: post  
                  .map((Post post) => ListTile(
                        title: Text(post.title),
                        subtitle: Text(post.id.toString()),
                      ))
                  .toList(),
            );
          }*/
          return Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}
