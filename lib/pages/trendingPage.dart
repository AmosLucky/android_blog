import 'package:flutter/material.dart';
import 'package:luckyblog/pages/getposts.dart';
class Trending extends StatefulWidget {
  @override
  _TrendingState createState() => _TrendingState();
}

class _TrendingState extends State<Trending> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child:  GetPosts(url:"https://luckyblog.ocashup.com/trending.php") ,
      
    );
  }
}