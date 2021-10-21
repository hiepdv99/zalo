import 'package:flutter/material.dart';
import 'package:zalo_app/services/check_phone_valid.dart';
import 'package:zalo_app/services/signup.dart';
import 'package:zalo_app/storages/token_storage.dart';
import 'home_screen.dart';
class RegisterScreenPassword extends StatefulWidget {
  final String name;
  final bool language;
  final String numberPhone;
  RegisterScreenPassword({
    @required this.language,
    @required this.name,
    @required this.numberPhone,
  });
  @override
  _RegisterScreenPasswordState createState() => _RegisterScreenPasswordState();
}

class _RegisterScreenPasswordState extends State<RegisterScreenPassword> {
  final txtCreateNameCotroller = TextEditingController();
  final txtNumberPhone = TextEditingController();
  String _info;
  String _title;
  String _enterName;
  String _next;
  String _enterPhone;
  Color _error;
  bool _isLoading;
  String _messageError;
  bool isPassword = true;
  String statePassword ;
  String pas;
  TokenStorage token_storage;
  NumberPhoneStorage numberPhoneStorage;
  final txtPasswordController = TextEditingController();
  @override
  void initState(){
    _error = Colors.black;
    _isLoading = false;
    _messageError='';
    token_storage = TokenStorage();
    numberPhoneStorage  = NumberPhoneStorage();
    if(widget.language){
      _info = 'Nhập số điện thoại của bạn để tạo tài khoản mới';
      _title = 'Tạo tài khoản';
      _enterName = 'Tên đầy đủ';
      _next = 'Tiếp';
      _enterPhone = 'Nhập số điện thoại';
      statePassword = 'Hiện';
      pas = 'Mật khẩu';

    }else{
      _title = "Create a new account";
      _enterName="Enter your full name";
      _info = "Enter your phone number to create new account";
      _next = "Next";
      _enterPhone = 'Enter your phone number';
      statePassword = 'SHOW';
      pas = 'Password';
    }
  }
  Widget txtPassword() {
    return Container(
      width: MediaQuery.of(context).size.width,
      padding: EdgeInsets.only(left: 10.0, top: 10.0),
      child: Row(
        children: <Widget>[
          Container(
            width: MediaQuery.of(context).size.width - 100,
            child: TextField(
              controller: txtPasswordController,
              obscureText: isPassword,
              decoration: InputDecoration(
                  border: InputBorder.none, hintText: pas),
            ),
          ),
          Container(
            width: 90,
            child: FlatButton(
              child: Text(statePassword),
              onPressed: () {
                setState(() {
                  if(widget.language){
                    statePassword == 'Hiện'
                        ? statePassword = 'Ẩn'
                        : statePassword = 'Hiện';
                    isPassword = !isPassword;
                  }else{
                    statePassword == 'SHOW'
                        ? statePassword = 'HIDE'
                        : statePassword = 'SHOW';
                    isPassword = !isPassword;
                  }
                });
              },
            ),
          )
        ],
      ),
    );
  }

  Widget lblInfo(String a, Color b) {
    return Container(
      height: 50.0,
      width: MediaQuery.of(context).size.width,
      color: Colors.white30,
      child: Center(
        child: Text(
          a,
          style: TextStyle(color: b, fontSize: 10),
        ),
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
            setState(() {
              _isLoading = true;
            });
            String password = txtPasswordController.text;
            if (password.trim().isNotEmpty) {
              SignUp(widget.numberPhone, password, widget.name).then((value) => {
                token_storage.writeToken(value['token']),
                numberPhoneStorage.writeNumberPhone(value['numberPhone']),
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => HomeScreen()),
                )
              });
            } else {
              setState(() {
                _error = Colors.red;
              });
            }
            // setState(() {
            //   _isLoading=false;
            // });
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
  Widget _showCircularProgress() {
    if (_isLoading) {
      return Center(child: CircularProgressIndicator());
    }
    return Container(
      height: 0.0,
      width: 0.0,
    );
  }

  @override
  Widget build(BuildContext context) {
    print('name: ' + widget.name);
    return Scaffold(
      appBar: AppBar(
        title: Text(_title, style: TextStyle(fontSize: 15),),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            lblInfo(_info, Colors.black),
            txtPassword(),
            lblInfo(_messageError, Colors.red),
            btnRegister(),
            _showCircularProgress(),
          ],
        ),
      ),
    );
  }
}
