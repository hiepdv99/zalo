import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:zalo_app/data.dart';

Future<List<Post>> GetPost(String numberPhone, int start, int end) async {
  List<Post> Posts = [];
  final url =
      "https://flutter-zalo-khmt.herokuapp.com/flutter/api/getPost?numberPhone=$numberPhone&start=$start&end=$end";
  var client = new http.Client();
  http.Response responseData = await client.get(url);
  var data = json.decode(responseData.body);
  List<String> images = [];
  List<String> videos = [];
  for (var d in data) {
    if (d['images'] != null) {
      for (var i in d['images']) {
        images.add(i);
      }
    } else {
      images = [];
    }
    if (d['video'] != null)
      videos.add(d['video']);
    else
      videos = [];

    Posts.add(Post(
      avatar: d['avatar'],
      name: d['name'],
      time: d['time'],
      content: d['content'],
      images: images,
      videos: videos,
    ));
    images = [];
    videos = [];
  }
  return Posts;
}
