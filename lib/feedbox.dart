import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import 'actionbtn.dart';
import 'show_images.dart';
import 'models/videoPlay.dart';

//the feed box will have for parameters :
// the user name , the user avatar, the pub date, the content text and content img
Widget feedBox(String avatarUrl, String userName, String date,
    String contentText, List<String> contentImg, List<String> contextVideo, VideoPlayerController _controller) {
  return Container(
    margin: EdgeInsets.only(bottom: 5.0),
    width: double.infinity,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(12.0),
      color: Colors.white,
    ),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 8, top: 10),
          child: Row(
            children: [
              CircleAvatar(
                backgroundImage: NetworkImage(avatarUrl),
                radius: 20.0,
              ),
              SizedBox(
                width: 12.0,
              ),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      userName,
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 14.0,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    SizedBox(
                      height: 5.0,
                    ),
                    Text(
                      date,
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 12.0,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        SizedBox(
          height: 10.0,
        ),
        if (contentText != "")
          Padding(
            padding: const EdgeInsets.only(left: 8),
            child: Text(
              contentText,
              style: TextStyle(color: Colors.black, fontSize: 14.0),
            ),
          ),
        SizedBox(
          height: 5.0,
        ),
        if (contentImg.length==1)
          OneImage(
            images: contentImg,
          )
        else if (contentImg.length == 2)
          TwoImage(
            images: contentImg,
          )
        else if (contentImg.length == 3)
          ThreeImage(
            images: contentImg,
          )
        else if (contentImg.length == 4)
          FourImage(
            images: contentImg,
          ),

        if (contextVideo.length == 1)
          Container(
            width: double.infinity,
            height: 300,
            child: ChewieListItem(
              videoPlayerController: _controller,
            ),
          ),
        SizedBox(
          height: 5.0,
        ),
        Row(
          children: [
            FlatButton.icon(
              icon: Icon(Icons.favorite_border, size: 25),
              label: Text("1"),
              padding: EdgeInsets.only(left: 2),
            ),
            FlatButton.icon(
              icon: Icon(Icons.comment_outlined, size: 25),
              label: Text("1"),
              padding: EdgeInsets.only(left: 10),
            ),
            // SizedBox(
            //   width: 140.0,
            // ),
            FlatButton.icon(
              icon: Icon(Icons.keyboard_control, size: 25),
              label: Text(" "),
              padding: EdgeInsets.only(left: 140),
            ),
          ],
        )
      ],
    ),
  );
}
