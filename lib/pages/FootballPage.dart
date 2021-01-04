import 'package:flutter/material.dart';
import 'package:luckyblog/pages/getposts.dart';
class FootballPage extends StatefulWidget {
  @override
  _FootballPageState createState() => _FootballPageState();
}

class _FootballPageState extends State<FootballPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child:  GetPosts(url:"https://luckyblog.ocashup.com/football.php") ,
      
    );
  }
}