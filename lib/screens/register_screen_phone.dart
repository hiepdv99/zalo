import 'package:flutter/material.dart';
import 'package:zalo_app/register_continue.dart';
import 'package:zalo_app/screens/register_enter_password_screen.dart';
import 'package:zalo_app/services/check_phone_valid.dart';
class RegisterScreenPhone extends StatefulWidget {
  final String name;
  final bool language;
  RegisterScreenPhone({
    @required this.language,
    @required this.name,
  });
  @override
  _RegisterScreenPhoneState createState() => _RegisterScreenPhoneState();
}

class _RegisterScreenPhoneState extends State<RegisterScreenPhone> {
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
  @override
  void initState(){
    _error = Colors.black;
    _isLoading = false;
    _messageError='';
    if(widget.language){
      _info = 'Nhập số điện thoại của bạn để tạo tài khoản mới';
      _title = 'Tạo tài khoản';
      _enterName = 'Tên đầy đủ';
      _next = 'Tiếp';
      _enterPhone = 'Nhập số điện thoại';

    }else{
      _title = "Create a new account";
      _enterName="Enter your full name";
      _info = "Enter your phone number to create new account";
      _next = "Next";
      _enterPhone = 'Enter your phone number';
    }
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
            String NumberPhone = txtNumberPhone.text;
            if (NumberPhone.trim().isNotEmpty) {
              vaid_number_phobe(NumberPhone.trim(), (widget.language ? 'vn' : 'english')).then((value) => {
                if(value['valid_number_phone'] == 'true'){
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => RegisterScreenPassword(
                            language: widget.language,
                            name: widget.name,
                            numberPhone: NumberPhone.trim(),
                      )),
                  )
                }else{
                  setState(() {
                      _messageError = value['message'];
                  })
                }
              });
            } else {
              setState(() {
                _error = Colors.red;
              });
            }
            setState(() {
              _isLoading=false;
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
            txtPhone(),
            lblInfo(_messageError, Colors.red),
            btnRegister(),
            _showCircularProgress(),
          ],
        ),
      ),
    );
  }
}
