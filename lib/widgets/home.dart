import 'package:flutter/material.dart';
import 'dart:async';
import 'package:flutter_flux_rss/models/parser.dart';
import 'package:webfeed/webfeed.dart';
import 'card_item.dart';

class Home extends StatefulWidget {
  Home({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  RssFeed feed;
  RssItem item;

  CardItem cardItem;

  Map data;
  List<List> dataList;

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
        centerTitle: true,
        title: Text(widget.title),
      ),
      body: Center(

        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: (feed!=null ? cardGenerator() : <Widget>[
            Text("Chargement en cours ...", textScaleFactor: 2.0 , style: TextStyle(
              color: Colors.indigo,
            ),)
          ]),
        ),
      ),
    );
  }

  List<Widget> cardGenerator() {
    List<Widget> l = [];
    feed.items.forEach((item) {
      item = item;
      Row row = Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          CardItem((item.author!=null ? item.author : ""), item.pubDate, item.enclosure.url, item.title)
        ],
      );
      l.add(row);
    });
    return l;
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