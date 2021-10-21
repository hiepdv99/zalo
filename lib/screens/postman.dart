import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../services/login.dart';
import 'package:zalo_app/storages/token_storage.dart';
import 'package:pretty_json/pretty_json.dart';

class MyHomePagePostMan extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePagePostMan>{
  String token = '';
  TokenStorage  tokenStorage = TokenStorage();
  int value ;
  String kq;
  String kq1 = '';
  List<TextEditingController> _controller = [
    for (int i = 0; i < 6; i++)
      TextEditingController()
  ];
  String url;
  String method ;
  @override
  void initState() {
    // TODO: implement initState
    value=0;
    kq = '';
    this.method = '';
    this.url = '';
  }
  void getToken() async {
    this.token = await this.tokenStorage.readToken();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("PostMan test"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              TextField(
                onChanged: (text){
                  setState(() {
                    this.url = text;
                  });
                } ,
                decoration: InputDecoration(
                    hintText: "URL",
                    labelText: "URL",
                    labelStyle: TextStyle(fontSize: 24, color: Colors.black),
                    border: InputBorder.none,
                    fillColor: Colors.black12,
                    filled: true),
                obscureText: false,
                maxLength: 200,
              ),
              SizedBox(
                height: 16,
              ),
              TextField(
                onChanged: (text){
                  setState(() {
                    this.method = text;
                  });
                },
                decoration: InputDecoration(
                    hintText: "post, get, put,...",
                    labelText: "method",
                    labelStyle: TextStyle(fontSize: 24, color: Colors.black),
                    border: InputBorder.none,
                    fillColor: Colors.black12,
                    filled: true),
                obscureText: false,
                maxLength: 200,
              ),
              SizedBox(
                height: 16,
              ),
              TextField(
                keyboardType: TextInputType.number,
                onChanged: (text) {
                  setState(() {
                    this.value=int.parse(text);
                    print(value);
                  });
                },
                decoration: InputDecoration(

                    hintText: "Số lượng",
                    labelText: "số lượng",
                    labelStyle: TextStyle(fontSize: 24, color: Colors.black),
                    border: InputBorder.none,
                    fillColor: Colors.black12,
                    filled: true),
                obscureText: false,
                maxLength: 200,
              ),
              SizedBox(
                height: 16,
              ),

              for(var i=0;i<this.value;i++)(

                  TextField(
                    controller: _controller[i],
                    decoration: InputDecoration(
                        hintText: "key:value",
                        labelText: "key-value", labelStyle: TextStyle(fontSize: 24, color: Colors.black),
                        filled: true),
                    obscureText: false,
                  )
              ),
              RaisedButton(
                child: new Text('Send'),
                onPressed: () {
                  Map data = {};
                  getToken();
                  data['token'] = this.token;
                  for(var i=0;i<value;i++){
                    data[_controller[i].text.split(":")[0]] = _controller[i].text.split(":")[1];
                  }
                  if(method == 'post'){
                    post_url(data, url).then((value) => {
                      setState(() {
                        this.kq = prettyJson(value,indent: 2);
                      }),
                    });
                  }
                  if(method == "get"){
                    get_url(data, url).then((value) => {
                      setState(() {
                        this.kq = prettyJson(value, indent: 2);
                      }),
                    });
                  }
                  if(method == "put"){
                    print(method);
                    print(url);
                    put_url(data, url).then((value) => {
                      setState(() {
                        this.kq = prettyJson(value, indent: 2);
                      }),
                    });
                  }
                  if(method == 'delete'){
                    print(method);
                    print(url);
                    delete_url(data, url).then((value) => {
                      setState(() {
                        this.kq = prettyJson(value, indent: 2);
                      }),
                    });
                  }
                  // setState(() {
                  //   this.kq = this.kq1;
                  // });
                  print(this.kq);
                  print(data);

              }),
              new Text(kq)
            ],
          ),
        ),
      ),
    );
  }

}