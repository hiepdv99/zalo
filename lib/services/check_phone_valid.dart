import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

Future vaid_number_phobe(String numberPhone, String language) async{
  final url = 'https://quanlycongviec1591999.herokuapp.com/api/checkPhone?numberPhone=$numberPhone&language=$language';
  try{
    var client = new http.Client();
    http.Response rs = await client.get(url);
    return json.decode(rs.body);
  }catch(e){
    print("exception send api: " + e.toString());
  }
}