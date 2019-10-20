import 'dart:math';

import 'package:flutter/material.dart';
import 'dart:async';
import 'package:flutter_flux_rss/models/parser.dart';
import 'package:flutter_flux_rss/widgets/custom_list_view.dart';
import 'package:webfeed/webfeed.dart';
import 'card_item.dart';
import 'loading_screen.dart';

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
  List<CardItem> dataList;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    parsing();
  }

  @override
  Widget build(BuildContext context) {

    Orientation orientation = MediaQuery.of(context).orientation;

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(widget.title),
      ),
      body: Center(
        child: displayBodyContent(),
      )
    );
  }

  Widget displayBodyContent() {
    if(feed == null) {
      return LoadingScreen();
    } else {
      Orientation orientation = MediaQuery.of(context).orientation;
      if(orientation==Orientation.portrait){
        // list
        return CustomListView(feed);
      } else {
        // grid
      }
    }
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
    feed.items.forEach((item) {
      item = item;
      GridView grid = GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 4),
          itemBuilder: (context, i) {
            return Container(
              margin: EdgeInsets.all(2.5),
              child: CardItem((item.author!=null ? item.author : ""), item.pubDate, item.enclosure.url, item.title),
            );
          }
      );
      l.add(grid);
    });
    return l;
  }

  Widget widgetsGrid() {
    feed.items.forEach((item) {
      item = item;
      return GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 4),
          itemCount: dataList.length,
          itemBuilder: (context, i) {
            return Container(
              margin: EdgeInsets.all(2.5),
              child: dataList[i],
            );
          }
      );
    });
  }

  Future<Null> parsing() async {
    RssFeed response = await Parser().loadRSS();
    print(response);
    if(response!=null) {
      setState(() {
        feed = response;
        feed.items.forEach((item) {
          item = item;
          CardItem card = CardItem((item.author!=null ? item.author : ""), item.pubDate, item.enclosure.url, item.title);
          dataList.add(card);
        });
      });
    } else {
      print("request didn't succeed");
    }
  }

}