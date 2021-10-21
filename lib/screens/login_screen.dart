import 'dart:convert';
import 'package:flutter/material.dart';
import 'home_screen.dart';
import '../services/login.dart';
import 'package:zalo_app/storages/token_storage.dart';

class LoginScreen extends StatefulWidget {
  final String title;
  final TokenStorage storage;
  final NumberPhoneStorage numberPhoneStorage;
  final bool language;


  LoginScreen({
    @required this.title,
    @required this.storage,
    @required this.numberPhoneStorage,
    @required this.language,
  });

  @override
  State<StatefulWidget> createState() => _LoginScreen();
}

class _LoginScreen extends State<LoginScreen> {
  String info;
  String sdt;
  String pas;
  String recoverPassword;
  bool _isLoading;
  String _errorMessage;
  String statePassword ;
  bool isPassword = true;
  final txtPhoneController = TextEditingController();
  final txtPasswordController = TextEditingController();
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

  @override
  void initState() {
    _isLoading = false;
    _errorMessage = '';
    if(widget.language){
      info = 'Vui lòng nhập số điện thoại và mật khẩu để đăng nhập';
      sdt = 'Số điện thoại';
      pas = 'Mật khẩu';
      recoverPassword = 'Lấy lại mật khẩu';
      statePassword = 'Hiện';
    }else{
      info = 'Please enter phone number and password to log in';
      sdt = 'Phone number';
      pas = 'Password';
      recoverPassword = 'Recover password';
      statePassword = 'SHOW';
    }
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

  Widget txtPhone() {
    return Container(
      padding: EdgeInsets.only(left: 10.0),
      child: TextField(
        keyboardType: TextInputType.phone,
        controller: txtPhoneController,
        decoration: InputDecoration(
          border: InputBorder.none,
          hintText: sdt,
        ),
      ),
    );
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

  Widget btnLogin() {
    return Container(
      width: 200.0,
      child: Visibility(
        child: FlatButton(
          color: Colors.blue,
          child: Text(
              widget.title,
            style: TextStyle(color: Colors.white),
          ),
          onPressed: () {
            setState(() {
              _isLoading = true;
              _errorMessage = '';
            });
            String numberPhone = txtPhoneController.text;
            String password = txtPasswordController.text;
            IsLogin(numberPhone, password).then((value) => {
              if(value['is_login'] == 'true'){
                widget.storage.writeToken(value['data']['token']).then((value) => null),
                widget.numberPhoneStorage.writeNumberPhone(value['data']['numberPhone']).then((value) => null),
                // kế tiếp là thiết kế trang home
                    Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(builder: (BuildContext context) => HomeScreen()),
                    ModalRoute.withName('/'),
                    ),
              }
              else{
                setState(() {
                  _isLoading = false;
                  if(widget.language){
                    _errorMessage = 'Vui lòng kiểm tra lại số điện thoại và mật khẩu';
                  }else{
                    _errorMessage = '                Invaild login \nPlease double-check and again';
                  }
                }),
              }
            });
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

  Widget txtGetPassword() {
    return Container(
        padding: EdgeInsets.only(top: 10.0),
        child: new GestureDetector(
          child: Text(recoverPassword,
              style: TextStyle(fontSize: 12.0, color: Colors.blue)),
          onTap: () {},
        ));
  }

  @override
  void dispose() {
    txtPhoneController.dispose();
    txtPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
        appBar: AppBar(
          title: Text(
            widget.title,
            style: TextStyle(fontSize: 15),
          ),
          titleSpacing: 0.0,
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              lblInfo(info,
                  Colors.black),
              txtPhone(),
              txtPassword(),
              lblInfo(_errorMessage, Colors.red),
              btnLogin(),
              txtGetPassword(),
              _showCircularProgress()
            ],
          ),
        ));
  }
}
