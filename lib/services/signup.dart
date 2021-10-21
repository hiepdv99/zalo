import 'package:http/http.dart' as http;
import 'dart:convert';

Future SignUp(String numberPhone, String password, String username) async{
  Map data = {
    'numberPhone' :numberPhone,
    'password' : password,
    'username' :username,
  };
  final url = 'https://quanlycongviec1591999.herokuapp.com/api/signup';
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