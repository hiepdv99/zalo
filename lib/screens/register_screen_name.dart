import 'package:flutter/material.dart';
import 'package:zalo_app/register_continue.dart';
import 'register_screen_phone.dart';
class RegisterScreen extends StatefulWidget {
  final bool language;
  RegisterScreen({
    @required this.language
  });
  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final txtCreateNameCotroller = TextEditingController();
  final txtNumberPhone = TextEditingController();
  String _info;
  String _title;
  String _enterName;
  String _next;
  String _enterPhone;
  Color _error;
  @override
  void initState(){
    _error = Colors.black;
    if(widget.language){
      _info = 'Sử dụng tên thật giúp bạn bè dễ dàng nhận ra bạn';
      _title = 'Tạo tài khoản';
      _enterName = 'Tên đầy đủ';
      _next = 'Tiếp';
      _enterPhone = 'Nhập số điện thoại';

    }else{
      _title = "Create a new account";
      _enterName="Enter your full name";
      _info = "Using real name makes you more recognizable";
      _next = "Next";
      _enterPhone = 'Enter your phone number';
    }
  }

  Widget lblInfo() {
    return Container(
      height: 50.0,
      width: MediaQuery.of(context).size.width,
      color: Colors.white30,
      child: Center(
        child: Text(_info, style: TextStyle(fontSize: 10, color: _error),),
      ),
    );
  }

  Widget txtCreateName() {
    return Container(
      padding: EdgeInsets.only(left: 10.0),
      child: TextField(
        keyboardType: TextInputType.name,
        controller: txtCreateNameCotroller,
        decoration: InputDecoration(
            border: InputBorder.none, hintText: _enterName),
      ),
    );
  }
  Widget txtPhone() {
    return Container(
      padding: EdgeInsets.only(left: 10.0),
      child: TextField(
        keyboardType: TextInputType.phone,
        controller: txtNumberPhone,
        decoration: InputDecoration(
            border: InputBorder.none, hintText: _enterPhone),
      ),
    );
  }

  Widget btnRegister() {
    return Container(
      width: 200.0,
      child: Visibility(
        child: FlatButton(
          color: Colors.blue,
          child: Text(_next),
          onPressed: () {
            String CreateName = txtCreateNameCotroller.text;
            if (CreateName.trim().isNotEmpty) {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => RegisterScreenPhone(
                      language: widget.language,
                      name: CreateName.trim(),
                    )
                ),
              );
            } else {
              setState(() {
                _error = Colors.red;
              });
            }
          },
          shape: new RoundedRectangleBorder(
              borderRadius: new BorderRadius.circular(30.0)),

        ),
        maintainSize: true,
        maintainAnimation: true,
        maintainState: true,
        visible: true,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_title, style: TextStyle(fontSize: 15),),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            lblInfo(),
            txtCreateName(),
            btnRegister()
          ],
        ),
      ),
    );
  }
}
