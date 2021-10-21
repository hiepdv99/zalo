import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../actionbtn.dart';
import '../feedbox.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:zalo_app/data.dart';
import 'package:zalo_app/services/getPost.dart';
import 'package:zalo_app/storages/token_storage.dart';
import 'postman.dart';
import 'package:video_player/video_player.dart';
class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Zalo Clone",
      home: MyHomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  NumberPhoneStorage numberPhoneStorage = NumberPhoneStorage();
  List<Post> indexPost = [];
  List<String> images;
  List<String> videos;
  int _currentIndex = 3;
  Color bgBlack = Color(0xFF1a1a1a);
  Color mainBlack = Color(0xFF262626);
  Color fbBlue = Color(0xFF2D88FF);
  Color mainGrey = Color(0xFF505050);
  int _start;
  int _end;
  VideoPlayerController _controller;

  @override
  void initState() {
    _start = 0;
    _end = 5;
    _onLoading();
    _controller = VideoPlayerController.network(
        'https://sample-videos.com/video123/mp4/720/big_buck_bunny_720p_20mb.mp4');
  }

  //Here I'm going to import a list of images that we will use for the profile picture and the storys
  RefreshController _refreshController =
      RefreshController(initialRefresh: false);

  void _onRefresh() async {
    // monitor network fetch
    await Future.delayed(Duration(milliseconds: 1000));
    // if failed,use refreshFailed()
    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(builder: (BuildContext context) => HomeScreen()),
      ModalRoute.withName('/'),
    );
    _refreshController.refreshCompleted();
  }

  void _onLoading() async {
    String numberPhone = await numberPhoneStorage.readNumberPhone();
    await Future.delayed(Duration(milliseconds: 1000));
    GetPost(numberPhone, _start, _end).then((value) => {
          for (var v in value)
            {
              indexPost.add(v),
            }
        });
    await Future.delayed(Duration(milliseconds: 2000));
    setState(() {
      _start = _end;
      _end = _end + 5;
    });
    _refreshController.loadComplete();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        titleSpacing: 0.0,
        title: ListTile(
          //contentPadding: const EdgeInsets.only(top: 0.0, left: 2.0),
          title: TextField(
            decoration: InputDecoration(
                border: InputBorder.none,
                hintText: 'Tìm bạn bè, tin nhắn...',
                hintStyle: TextStyle(color: Colors.white)),
            onChanged: (text) {
              print(text);
            },
          ),
          leading: Icon(
            Icons.search,
            size: 30,
            color: Colors.white,
          ),
        ),
        actions: <Widget>[
          IconButton(
            icon: Icon(
              Icons.broken_image_outlined,
              size: 30,
            ),
            onPressed: () {},
          ),
          IconButton(
            icon: Icon(
              Icons.notifications_none,
              size: 30,
            ),
            onPressed: () {},
          )
        ],
      ),
      body: SmartRefresher(
        enablePullDown: true,
        enablePullUp: true,
        header: WaterDropMaterialHeader(
          backgroundColor: Colors.white,
          color: Colors.blue,
        ),
        footer: CustomFooter(
          builder: (BuildContext context, LoadStatus mode) {
            Widget body;
            if (mode == LoadStatus.idle) {
              body = Text("pull up load");
            } else if (mode == LoadStatus.loading) {
              body = CupertinoActivityIndicator();
            } else if (mode == LoadStatus.failed) {
              body = Text("Load Failed!Click retry!");
            } else if (mode == LoadStatus.canLoading) {
              body = Text("release to load more");
            } else {
              body = Text("No more Data");
            }
            return Container(
              height: 55.0,
              child: Center(child: body),
            );
          },
        ),
        controller: _refreshController,
        onRefresh: _onRefresh,
        onLoading: _onLoading,
        child: SingleChildScrollView(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Container(
              width: double.infinity,
              decoration: BoxDecoration(color: Colors.white),
              child: Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: 12.0, vertical: 15.0),
                child: Column(
                  children: [
                    Row(
                      children: [
                        CircleAvatar(
                          radius: 25.0,
                          backgroundImage: NetworkImage(avatarUrl[0]),
                        ),
                        SizedBox(
                          width: 10.0,
                        ),
                        Expanded(
                          child: TextField(
                            style: TextStyle(
                              color: Colors.black,
                            ),
                            decoration: InputDecoration(
                                contentPadding: EdgeInsets.only(left: 5.0),
                                hintText: "Hôm nay bạn thế nào?",
                                filled: true,
                                fillColor: Colors.white,
                                border: OutlineInputBorder(
                                  borderSide: BorderSide.none,
                                )),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 7.0,
                    ),
                    Divider(
                      color: Colors.grey[300],
                      thickness: 0.5,
                    ),
                    Row(
                      children: [
                        actionButton(
                            Icons.photo,
                            "Đăng hình",
                            Colors.lightGreen,
                            MediaQuery.of(context).size.width * 0.06),
                        actionButton(
                            Icons.videocam,
                            "Đăng video",
                            Colors.pinkAccent,
                            MediaQuery.of(context).size.width * 0.06),
                        actionButton(
                            Icons.color_lens,
                            "Hình nền",
                            Colors.purpleAccent,
                            MediaQuery.of(context).size.width * 0.06),
                      ],
                    )
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 20.0,
            ),
            Container(
              child: (indexPost.length == 0
                  ? Center(child: CircularProgressIndicator())
                  : null),
            ),
            for (var i in indexPost)
              feedBox(i.avatar, i.name, i.time, i.content, i.images, i.videos, this._controller),
          ],
        )),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.chat_outlined,
              size: MediaQuery.of(context).size.width * 0.06,
            ),
            label: "Tin nhắn",
            //backgroundColor: Colors.blue
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_box_outlined,
                size: MediaQuery.of(context).size.width * 0.06),
            label: "Danh bạ",
            //backgroundColor: Colors.blue
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.group_rounded,
                size: MediaQuery.of(context).size.width * 0.06),
            label: "Nhóm",
            //backgroundColor: Colors.blue
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.watch_later_outlined,
                size: MediaQuery.of(context).size.width * 0.06),
            label: "Nhật ký",
            //backgroundColor: Colors.blue
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.border_all_rounded,
                size: MediaQuery.of(context).size.width * 0.06),
            label: "PostMan",
            //backgroundColor: Colors.blue
          )
        ],
        onTap: (value) {
          if(value == 3){
            _onRefresh();
            setState(() => _currentIndex = value);
          }
          if(value == 4){
            Navigator.push(
                context,
              MaterialPageRoute(
                  builder: (context) => MyHomePagePostMan()
              ),
            );
          }
          setState(() => _currentIndex = value);
        },
      ),
    );
  }
}
