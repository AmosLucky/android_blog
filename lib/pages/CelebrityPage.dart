import 'package:flutter/material.dart';
import 'package:luckyblog/pages/getposts.dart';
class CelebrityPage extends StatefulWidget {
  @override
  _CelebrityPageState createState() => _CelebrityPageState();
}

class _CelebrityPageState extends State<CelebrityPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: GetPosts(url:"https://luckyblog.ocashup.com/celebrity.php") ,
      
    );
  }
}

