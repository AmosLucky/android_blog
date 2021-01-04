import 'package:flutter/material.dart';
import 'package:luckyblog/pages/getposts.dart';

class GossipsPage extends StatefulWidget {
  @override
  _GossipsPageState createState() => _GossipsPageState();
}

class _GossipsPageState extends State<GossipsPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child:  GetPosts(url:"https://luckyblog.ocashup.com/gossip.php") ,
      
    );
  }
}