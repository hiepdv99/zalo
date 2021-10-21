import 'dart:math';

List<String> avatarUrl = [
  "https://images.unsplash.com/photo-1518806118471-f28b20a1d79d?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=700&q=80",
  "https://images.unsplash.com/photo-1457449940276-e8deed18bfff?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=500&q=60",
  "https://images.unsplash.com/photo-1522075469751-3a6694fb2f61?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=800&q=80",
  "https://images.unsplash.com/photo-1525879000488-bff3b1c387cf?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=634&q=80",
];
List<String> storyUrl = [
  "https://thethao99.com/wp-content/uploads/2020/05/gai-xinh-366.jpg",
  "https://lh3.googleusercontent.com/proxy/w8pXtgr8oUSAdcwpec1ss13sDnKlWNm64v2HYaFQygUArGqjPyABpyJ9BpU9TzYv3Cg62IfXlHTZ9PvQj74ghil-Es7cQi_wxuzswBea_YUOm_As2q3oBS0TEwyRUYhSAFRIJg",
  "https://i.pinimg.com/originals/a3/0a/49/a30a49923011bc6e59a5ca802d61f894.png",
  "https://uploads-ssl.webflow.com/5f5f2b58b1af780151375838/606915c9d28c5c66749a370d_GaiHot2k__hinh-anh-gai-xinh-nguc-to-veu-khung%252B%2525282%252529.jpeg",
  "https://2.bp.blogspot.com/-igowB6lTUvE/XJjuw6xkXGI/AAAAAAAAAII/Gv4ch1sfNJE2Ejcm6fLFfGLiNSigF6G2QCLcBGAs/s1600/hinh-anh-girl-xinh-gai-dep-mac-bikini_5.jpg",
  "https://images.unsplash.com/photo-1600055882386-5d18b02a0d51?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=621&q=80",
  "https://images.unsplash.com/photo-1600174297956-c6d4d9998f14?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=634&q=80",
  "https://images.unsplash.com/photo-1600008646149-eb8835bd979d?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=666&q=80",
  "https://images.unsplash.com/photo-1502920313556-c0bbbcd00403?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=967&q=80",
];

List<String> videoUrls = [
  "https://github.com/NguyenQuyPhuc20173302/nodejs_flutter/blob/main/test.mp4",
  "http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/BigBuckBunny.mp4",
  "https://flutter.github.io/assets-for-api-docs/assets/videos/butterfly.mp4",
  'https://www.sample-videos.com/video123/mp4/480/asdasdas.mp4'
];

class Post {
  String avatar;
  String name;
  String time;
  String content;
  List<String> images;
  List<String> videos;
  Post(
      {this.avatar,
      this.name,
      this.time,
      this.content,
      this.images,
      this.videos});
}

List<Post> FakeDate = [
  Post(
      avatar: avatarUrl[3],
      name: 'Nguyễn Quý Đức',
      time: '6 min',
      content: 'Ông nội chúng mày',
      images: [],
      videos: [videoUrls[1]]),
  Post(
      avatar: avatarUrl[0],
      name: 'Nguyễn Quý Phúc',
      time: '6 min',
      content: 'Ông nội chúng mày',
      images: [storyUrl[0], storyUrl[1]],
      videos: []),
  Post(
      avatar: avatarUrl[3],
      name: 'Nguyễn Quý Đức',
      time: '6 min',
      content: 'Ông nội chúng mày',
      images: [],
      videos: [videoUrls[0]]),
  Post(
      avatar: avatarUrl[1],
      name: 'Nguyễn Quý Phúc',
      time: '6 min',
      content: 'Ông nội chúng mày',
      images: [storyUrl[1], storyUrl[1]],
      videos: []),
  Post(
      avatar: avatarUrl[2],
      name: 'Nguyễn Quý Phúc',
      time: '6 min',
      content: 'Ông nội chúng mày',
      images: [storyUrl[2], storyUrl[1]],
      videos: []),
  Post(
      avatar: avatarUrl[3],
      name: 'Nguyễn Quý Đức',
      time: '6 min',
      content: 'Ông nội chúng mày',
      images: [],
      videos: [videoUrls[0]]),
  Post(
      avatar: avatarUrl[3],
      name: 'Nguyễn Quý Phúc',
      time: '6 min',
      content: 'Ông nội chúng mày',
      images: [storyUrl[3], storyUrl[1]],
      videos: []),
  Post(
      avatar: avatarUrl[0],
      name: 'Nguyễn Quý Phúc',
      time: '6 min',
      content: 'Ông nội chúng mày',
      images: [storyUrl[0], storyUrl[1]],
      videos: []),
  Post(
      avatar: avatarUrl[1],
      name: 'Nguyễn Quý Phúc',
      time: '6 min',
      content: 'Ông nội chúng mày',
      images: [storyUrl[1], storyUrl[1]],
      videos: []),
  Post(
      avatar: avatarUrl[3],
      name: 'Nguyễn Quý Đức',
      time: '6 min',
      content: 'Ông nội chúng mày',
      images: [],
      videos: [videoUrls[2]]),
  Post(
      avatar: avatarUrl[2],
      name: 'Nguyễn Quý Phúc',
      time: '6 min',
      content: 'Ông nội chúng mày',
      images: [storyUrl[2], storyUrl[1]],
      videos: []),
  Post(
      avatar: avatarUrl[3],
      name: 'Nguyễn Quý Phúc',
      time: '6 min',
      content: 'Ông nội chúng mày',
      images: [storyUrl[3], storyUrl[1]],
      videos: []),
  Post(
      avatar: avatarUrl[0],
      name: 'Nguyễn Quý Phúc',
      time: '6 min',
      content: 'Ông nội chúng mày',
      images: [storyUrl[1], storyUrl[1]],
      videos: []),
  Post(
      avatar: avatarUrl[1],
      name: 'Nguyễn Quý Phúc',
      time: '6 min',
      content: 'Ông nội chúng mày',
      images: [storyUrl[2], storyUrl[1]],
      videos: []),
  Post(
      avatar: avatarUrl[2],
      name: 'Nguyễn Quý Phúc',
      time: '6 min',
      content: 'Ông nội chúng mày',
      images: [storyUrl[3], storyUrl[1]],
      videos: []),
  Post(
      avatar: avatarUrl[3],
      name: 'Nguyễn Quý Phúc',
      time: '6 min',
      content: 'Ông nội chúng mày',
      images: [storyUrl[0], storyUrl[1]],
      videos: []),
  Post(
      avatar: avatarUrl[0],
      name: 'Nguyễn Quý Phúc',
      time: '6 min',
      content: 'Ông nội chúng mày',
      images: [storyUrl[1], storyUrl[1]],
      videos: []),
  Post(
      avatar: avatarUrl[1],
      name: 'Nguyễn Quý Phúc',
      time: '6 min',
      content: 'Ông nội chúng mày',
      images: [storyUrl[2], storyUrl[1]],
      videos: []),
  Post(
      avatar: avatarUrl[2],
      name: 'Nguyễn Quý Phúc',
      time: '6 min',
      content: 'Ông nội chúng mày',
      images: [storyUrl[3], storyUrl[1]],
      videos: []),
  Post(
      avatar: avatarUrl[3],
      name: 'Nguyễn Quý Phúc',
      time: '6 min',
      content: 'Ông nội chúng mày',
      images: [storyUrl[0], storyUrl[1]],
      videos: []),
  Post(
      avatar: avatarUrl[0],
      name: 'Nguyễn Quý Phúc',
      time: '6 min',
      content: 'Ông nội chúng mày',
      images: [storyUrl[1], storyUrl[1]],
      videos: []),
  Post(
      avatar: avatarUrl[1],
      name: 'Nguyễn Quý Phúc',
      time: '6 min',
      content: 'Ông nội chúng mày',
      images: [storyUrl[2], storyUrl[1]],
      videos: []),
  Post(
      avatar: avatarUrl[2],
      name: 'Nguyễn Quý Phúc',
      time: '6 min',
      content: 'Ông nội chúng mày',
      images: [storyUrl[3], storyUrl[1]],
      videos: []),
  Post(
      avatar: avatarUrl[3],
      name: 'Nguyễn Quý Phúc',
      time: '6 min',
      content: 'Ông nội chúng mày',
      images: [storyUrl[0], storyUrl[1]],
      videos: []),
  Post(
      avatar: avatarUrl[0],
      name: 'Nguyễn Quý Phúc',
      time: '6 min',
      content: 'Ông nội chúng mày',
      images: [storyUrl[1], storyUrl[1]],
      videos: []),
  Post(
      avatar: avatarUrl[1],
      name: 'Nguyễn Quý Phúc',
      time: '6 min',
      content: 'Ông nội chúng mày',
      images: [storyUrl[2], storyUrl[1]],
      videos: []),
  Post(
      avatar: avatarUrl[2],
      name: 'Nguyễn Quý Phúc',
      time: '6 min',
      content: 'Ông nội chúng mày',
      images: [storyUrl[3], storyUrl[1]],
      videos: []),
  Post(
      avatar: avatarUrl[3],
      name: 'Nguyễn Quý Phúc',
      time: '6 min',
      content: 'Ông nội chúng mày',
      images: [storyUrl[0], storyUrl[1]],
      videos: []),
  Post(
      avatar: avatarUrl[0],
      name: 'Nguyễn Quý Phúc',
      time: '6 min',
      content: 'Ông nội chúng mày',
      images: [storyUrl[1], storyUrl[1]],
      videos: []),
  Post(
      avatar: avatarUrl[1],
      name: 'Nguyễn Quý Phúc',
      time: '6 min',
      content: 'Ông nội chúng mày',
      images: [storyUrl[2], storyUrl[1]],
      videos: []),
  Post(
      avatar: avatarUrl[2],
      name: 'Nguyễn Quý Phúc',
      time: '6 min',
      content: 'Ông nội chúng mày',
      images: [storyUrl[3], storyUrl[1]],
      videos: []),
  Post(
      avatar: avatarUrl[3],
      name: 'Nguyễn Quý Phúc',
      time: '6 min',
      content: 'Ông nội chúng mày',
      images: [storyUrl[0], storyUrl[1]],
      videos: []),
  Post(
      avatar: avatarUrl[0],
      name: 'Nguyễn Quý Phúc',
      time: '6 min',
      content: 'Ông nội chúng mày',
      images: [storyUrl[1], storyUrl[1]],
      videos: []),
  Post(
      avatar: avatarUrl[1],
      name: 'Nguyễn Quý Phúc',
      time: '6 min',
      content: 'Ông nội chúng mày',
      images: [storyUrl[2], storyUrl[1]],
      videos: []),
  Post(
      avatar: avatarUrl[2],
      name: 'Nguyễn Quý Phúc',
      time: '6 min',
      content: 'Ông nội chúng mày',
      images: [storyUrl[3], storyUrl[1]],
      videos: []),
  Post(
      avatar: avatarUrl[2],
      name: 'Nguyễn Quý Phúc',
      time: '6 min',
      content: 'Ông nội chúng mày',
      images: [storyUrl[2], storyUrl[1]],
      videos: []),
];

Post firstData = FakeDate[Random().nextInt(20)];
