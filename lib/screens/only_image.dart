import 'package:flutter/material.dart';

class OnlyImage extends StatelessWidget{
  String url;
  OnlyImage({this.url});
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Container(
          margin: EdgeInsets.fromLTRB(0, 23, 0, 0),
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.width *1.8,
          child: Image.network(
            this.url,
            fit: BoxFit.cover,
            loadingBuilder:(BuildContext context, Widget child,ImageChunkEvent loadingProgress) {
              if (loadingProgress == null) return child;
              return Center(
                child: CircularProgressIndicator(
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}