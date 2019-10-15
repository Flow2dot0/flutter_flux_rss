import 'package:flutter/material.dart';
import 'dart:async';
import 'package:flutter_flux_rss/models/parser.dart';
import 'package:webfeed/webfeed.dart';

class Home extends StatefulWidget {
  Home({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  RssFeed feed;
  RssItem item;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    parsing();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(

        title: Text(widget.title),
      ),
      body: Center(

        child: Column(

        ),
      ),
    );
  }

  Future<Null> parsing() async {
    RssFeed response = await Parser().loadRSS();
    print(response);
    if(response!=null) {
      setState(() {
        feed = response;
        feed.items.forEach((item) {
          item = item;
          print(item.title);
          print(item.description);
          print(item.pubDate);
          print(item.enclosure.url);
        });
      });
    } else {
      print("request didn't succeed");
    }
  }
}