import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:zalo_app/storages/token_storage.dart';
import 'package:zalo_app/responses/LoginResponse.dart';

Future isLogin(String numberphone, String password) async {
  final url =
      "https://quanlycongviec1591999.herokuapp.com/loginZalo?sdt=$numberphone&pas=$password";
  final http.Client httpClient = http.Client();
  try {
    final response = await httpClient.get(url);
    print("response:");
    print(response.body);
    if (response.statusCode == 200) {
      final responseData = json.decode(response.body);
      return responseData['is_login'];
    }
  } catch (exception) {
    print("exception send api:" + exception.toString());
  }
}

Future  IsLogin(String numberPhone, String password) async{
  // final url = "https://quanlycongviec1591999.herokuapp.com/api/isLogin";
  final url = "https://flutter-zalo-khmt.herokuapp.com/flutter/api/isLogin";
  // final url = "http://192.168.2.104:3000/api/isLogin";
  Map data = {
    "numberPhone": numberPhone,
    "password": password,
  };
  //final url = "localhost:3000/api/isLogin";
  try{
    var client = new http.Client();
    http.Response responseData = await client.post(
      url,
      body: data,
    );
    return json.decode(responseData.body);
  }catch(e){
    print("exception send api: " + e.toString());
  }
}

Future  login_token(String token, String numberPhone) async {
  final url = "https://flutter-zalo-khmt.herokuapp.com/flutter/api/loginToken";
  String Token = token;
  print(Token);
  Map data = {
    "token": Token,
    "numberPhone": numberPhone,
  };
  try{
    var client = new http.Client();
    http.Response rs = await client.post(
      url,
      body: data,
    );
    return json.decode(rs.body);
  }catch(e){
    print("exception send api: " + e.toString());
  }
}

Future post_url(Map data, String url) async {
  try{
    var client = new http.Client();
    http.Response rs = await client.post(
      url,
      body: data,
    );
    print(json.decode(rs.body));
    return json.decode(rs.body);
  }catch(e){
    print("exception send api: " + e.toString());
  }
}

Future get_url(Map data, String url) async {
  try{
    var client = new http.Client();
    http.Response rs = await client.get(
      url,
    );
    print(json.decode(rs.body));
    return (json.decode(rs.body));
  }catch(e){
    print("exception send api: " + e.toString());
  }
}

Future put_url(Map data, String url) async {
  try{
    var client = new http.Client();
    http.Response rs = await client.put(
      url,
      body: data,
    );
    print(json.decode(rs.body));
    return json.decode(rs.body);
  }catch(e){
    print("exception send api: " + e.toString());
  }
}

Future delete_url(Map data, String url) async {
  try{
    var client = new http.Client();
    http.Response rs = await client.post(
      url,
      body: data,
    );
    print(json.decode(rs.body));
    return json.decode(rs.body);
  }catch(e){
    print("exception send api: " + e.toString());
  }
}