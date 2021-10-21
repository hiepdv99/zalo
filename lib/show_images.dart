import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'screens/only_image.dart';

Widget showImage(String url, BuildContext context){
  return GestureDetector(
    onTap: () {
      Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => OnlyImage(
              url: url,
            )
        ),
      );
    }, // handle your image tap here
    child: Image.network(
      url,
      fit: BoxFit.cover,
      loadingBuilder:(BuildContext context, Widget child,ImageChunkEvent loadingProgress) {
        if (loadingProgress == null) return child;
        return Center(
          child: CircularProgressIndicator(
          ),
        );
      },
    )
  );
}

class OneImage extends StatelessWidget {
  final List<String> images;
  OneImage({this.images});
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    // return Image.network(
    //   this.images[0],
    // );
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.width ,
      // child: Expanded(
      child: showImage(this.images[0], context),
      // ),
    );
  }
}

class TwoImage extends StatelessWidget {
  final List<String> images;
  TwoImage({this.images});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Container(
          width: MediaQuery.of(context).size.width * 0.495,
          height: MediaQuery.of(context).size.width * 0.9,
          // child: Expanded(
          child: showImage(this.images[0], context),
          // ),
        ),
        SizedBox(
          width: MediaQuery.of(context).size.width * 0.01,
        ),
        Container(
          width: MediaQuery.of(context).size.width *0.495,
          height: MediaQuery.of(context).size.width * 0.9,
          // child: Expanded(
          child: showImage(this.images[1], context),
          // ),
        ),
      ],
    );
  }
}

class ThreeImage extends StatelessWidget {
  final List<String> images;
  ThreeImage({this.images});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Column(
      children: <Widget>[
        Row(
          children: <Widget>[
            Container(
              width: MediaQuery.of(context).size.width*0.495,
              height: MediaQuery.of(context).size.width *0.5,
              // child: Expanded(
              child: showImage(this.images[0], context),
              // ),
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.01,
            ),
            Container(
              width: MediaQuery.of(context).size.width * 0.495,
              height: MediaQuery.of(context).size.width * 0.5,
              // child: Expanded(
              child: showImage(this.images[1], context),
              // ),
            )
          ],
        ),
        SizedBox(
          height: 2,
        ),
        Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.width * 0.7,
          // child: Expanded(
          child: showImage(this.images[2], context),
          // ),
        ),
      ],
    );
  }
}

class FourImage extends StatelessWidget {
  final List<String> images;
  FourImage({this.images});
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Column(
      children: <Widget>[
        Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.width * 0.5,
          // child: Expanded(
          child: showImage(this.images[0], context),
          // ),
        ),
        SizedBox(
          height: 2,
        ),
        Row(
          children: <Widget>[
            Container(
              width: MediaQuery.of(context).size.width * 49/150,
              height: MediaQuery.of(context).size.width *0.4,
              // child: Expanded(
              child: showImage(this.images[1], context),

              // ),
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.01,
            ),
            Container(
              width: MediaQuery.of(context).size.width * 49/150,
              height: MediaQuery.of(context).size.width * 0.4,
              // child: Expanded(
              child: showImage(this.images[2],context),
              // ),
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.01,
            ),
            Container(
              width: MediaQuery.of(context).size.width * 49/150,
              height: MediaQuery.of(context).size.width *0.4,
              // child: Expanded(
              child:showImage(this.images[3], context),
              // ),
            ),
          ],
        )
      ],
    );
  }
}
