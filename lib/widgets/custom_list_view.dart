import 'package:flutter/material.dart';
import 'package:flutter_flux_rss/models/date_convert.dart';
import 'package:flutter_flux_rss/widgets/card_item.dart';
import 'package:webfeed/domain/atom_feed.dart';
import 'package:webfeed/domain/rss_feed.dart';
import 'package:webfeed/domain/rss_item.dart';
import 'package:flutter_flux_rss/models/date_convert.dart';
import 'package:intl/intl.dart';

class CustomListView extends StatefulWidget {

  Future feed;

  CustomListView(Future feed) {
    this.feed = feed;

  }

  @override
  _CustomListViewState createState() => _CustomListViewState();
}

class _CustomListViewState extends State<CustomListView> {

  List<Map> feedOrderedByDate = [];
  List<Map> fixFeedOrderedByDate = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setData();
    orderingProcess();
    print(widget.feed);
  }
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List>(
        future: widget.feed,
        builder: (context, snapshot) {
          if(snapshot.connectionState != ConnectionState.done) {
            // return: show loading widget
          }
          if(snapshot.hasError) {
            // return: show error widget
          }
          List l = snapshot.data ?? [];
          return ListView.builder(
              itemCount: l.length,
              itemBuilder: (context, i) {
//                Map each = fixFeedOrderedByDate[i];
//                return Container(
//                  child: CardItem(each['item.author'], DateConvert().convertDate(each['item.pubDate']), each['item.enclosure.url'], each['item.title']),
//                );
              }
          );
        });

  }

  void orderingProcess() {
    feedOrderedByDate.sort((a,b) {
      var aDate = a['item.pubDate'];
      var bDate = b['item.pubDate'];
      return aDate.compareTo(bDate);
    });
    fixFeedOrderedByDate = feedOrderedByDate;
  }

  void orderingProcessFix() {
    feedOrderedByDate.sort((a,b) {
      var aDate = a['item.pubDate'];
      var bDate = b['item.pubDate'];
      return aDate.compareTo(bDate);
    });
    fixFeedOrderedByDate.add(feedOrderedByDate[feedOrderedByDate.length-1]);
    for(int i = 0; i < feedOrderedByDate.length; i++) {
      if(i < feedOrderedByDate.length-1) {
        fixFeedOrderedByDate.add(feedOrderedByDate[i]);
      }
    }
  }

  void setData() {
    print("num2");
    print(widget.feed);
//    widget.feed.forEach((key, value) {
//      print("num3");
//      var data = {
//        'item.author' : key,
//        'item.pubDate' : value.pubDate,
//        'item.enclosure.url' : value.enclosure.url,
//        'item.title' : value.title,
//      };
//      feedOrderedByDate.add(data);
//    });

//    widget.feed.forEach((feedList) {
//      feedList.items.forEach((item) {
//        switch(item)
//        var data = {
//          'item.author' : item.author,
//          'item.pubDate' : item.pubDate,
//          'item.enclosure.url' : item.enclosure.url,
//          'item.title' : item.title,
//        };
//        feedOrderedByDate.add(data);
//      });
//    });


  }
}