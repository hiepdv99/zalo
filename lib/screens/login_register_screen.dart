import 'package:flutter/material.dart';
import 'login_screen.dart';
import 'register_screen_name.dart';
import 'package:zalo_app/storages/token_storage.dart';
class LoginRegister extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<LoginRegister> {
  String _login;
  String _logup;
  bool _fontWeight;
  bool _fontSize;
  bool _language;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _login = 'ĐĂNG NHẬP';
    _logup = "ĐĂNG KÍ";
    _fontWeight = true;
    _fontSize = true;
    _language = true;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Container(
            child: MyHomePage(),
            width: MediaQuery.of(context).size.width * 3 / 2,
            height: MediaQuery.of(context).size.height * 2 / 3,
            // width: MediaQuery.of(context).size.width * 3 / 2,
            // height: MediaQuery.of(context).size.height * 2 / 3,
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height / 3,
            child: Center(
              child: Column(
                children: <Widget>[
                  SizedBox(
                    width: 220.0,
                    height: 50.0,
                    child: FlatButton(
                      color: Colors.blue,
                      child: Text(
                        _login,
                        style: TextStyle(color: Colors.white, fontSize: 15),
                      ),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => LoginScreen(
                                title: _login,
                                storage: TokenStorage(),
                                numberPhoneStorage: NumberPhoneStorage(),
                                language: _language,
                              )),
                        );
                      },
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30.0)),
                    ),
                  ),
                  Container(
                    width: 220.0,
                    height: 50.0,
                    margin: EdgeInsets.only(top: 15.0),
                    child: FlatButton(
                      color: Colors.grey,
                      child: Text(
                        _logup,
                        style: TextStyle(color: Colors.black, fontSize: 15),
                      ),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => RegisterScreen(
                                language: _language,
                              )),
                        );
                      },
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30.0)),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.fromLTRB(0, 25, 0, 0),
                    padding: EdgeInsets.only(
                        top: MediaQuery.of(context).size.height / 4 - 145),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        FlatButton(
                          child: Text(
                            'Tiếng Việt',
                            style: TextStyle(
                              fontSize: (_fontSize ? 17 : 15),
                              fontWeight: (_fontWeight ? FontWeight.bold : FontWeight.normal),
                            ),
                          ),
                          onPressed: () {
                            setState(() {
                              _fontSize = true;
                              _fontWeight = true;
                              _login = 'ĐĂNG NHẬP';
                              _logup = "ĐĂNG KÍ";
                              _language = true;
                            });
                          },
                        ),
                        SizedBox(width: MediaQuery.of(context).size.height * 0.1,),
                        FlatButton(
                          child: Text(
                            'English',
                            style: TextStyle(
                              fontSize: (_fontSize ? 17 : 15),
                              fontWeight: (!_fontWeight ? FontWeight.bold : FontWeight.normal),
                            ),
                          ),
                          onPressed: () {
                            setState(() {
                              _fontSize = false;
                              _fontWeight = false;
                              _login = 'LOGIN';
                              _logup = 'REGISTER';
                              _language = false;
                            });
                          },
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  State createState() => new MyHomePageState();
}

class MyHomePageState extends State<MyHomePage> {
  int counter = 1;
  String _imageZalo = 'assets/zalo_';
  String _png = '.png';

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: new Dismissible(
        resizeDuration: null,
        onDismissed: (DismissDirection direction) {
          setState(() {
            counter += direction == DismissDirection.endToStart ? 1 : -1;
            if (counter == 6) counter = 1;
            if (counter == 0) counter = 5;
          });
        },
        key: new ValueKey(counter),
        child:
          Container(
            margin: EdgeInsets.fromLTRB(0, 25, 0, 0),
            width: MediaQuery.of(context).size.width,
            height: 450,
            alignment: Alignment.center,
            decoration: new BoxDecoration(
                image: DecorationImage(
                    image: AssetImage(_imageZalo + (counter).toString() + _png),
                    fit: BoxFit.fill
                )
            ),
          ),
        // new Center(
        //   child: Image.asset(
        //     _imageZalo + (counter).toString() + _png,
        //     width: MediaQuery.of(context).size.width,
        //     height: MediaQuery.of(context).size.height,
        //   ),
        // ),
      ),
    );
  }
}
