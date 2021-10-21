import 'dart:async';
import 'package:flutter/material.dart';
import 'package:zalo_app/services/login.dart';
import 'screens/login_register_screen.dart';
import 'screens/home_screen.dart';
import 'storages/token_storage.dart';
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashScreen(
        token_storage: TokenStorage(),
        numberPhoneStorage: NumberPhoneStorage(),
      ),
      routes: {
        'login': (context) => LoginRegister(),
        "home": (context) => HomeScreen(),
      },
    );
  }
}

class SplashScreen extends StatefulWidget {
  // khởi tạo
  final TokenStorage token_storage;
  final NumberPhoneStorage numberPhoneStorage;
  SplashScreen({
    @required this.token_storage,
    @required this.numberPhoneStorage,
  });

  // tạo một state
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  void startTime() {
    Timer(Duration(seconds: 5), () {
      // Navigator.of(context).pushReplacementNamed('login');
      widget.token_storage.readToken().then((token){
        widget.numberPhoneStorage.readNumberPhone().then((numberPhone){
          login_token(token, numberPhone).then((va) => {
            print('value: '),
            print(va),
            if(va['is_login'] == 'true'){
              Navigator.of(context).pushReplacementNamed('home'),
            } else{
              Navigator.of(context).pushReplacementNamed('login'),
            }
          });
        });
      });
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    startTime();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/zalo123.png'), fit: BoxFit.cover)),
        child: Center(
          child: Image.asset(
            'assets/zalo123.png',
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
          ),
        ),
      ),
    );
  }
}
