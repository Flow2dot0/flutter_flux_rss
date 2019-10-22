import 'package:flutter/material.dart';
import 'package:flutter_flux_rss/models/date_convert.dart';
import 'package:flutter_flux_rss/widgets/card_item.dart';
import 'package:webfeed/domain/rss_feed.dart';
import 'package:webfeed/domain/rss_item.dart';
import 'package:flutter_flux_rss/models/date_convert.dart';
import 'package:intl/intl.dart';

class CustomListView extends StatefulWidget {

  RssFeed feed;

  CustomListView(RssFeed feed) {
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
    print(feedOrderedByDate[28]);
  }
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: fixFeedOrderedByDate.length,
        itemBuilder: (context, i) {
        Map each = fixFeedOrderedByDate[i];
          return Container(
            child: CardItem(each['item.author'], DateConvert().convertDate(each['item.pubDate']), each['item.enclosure.url'], each['item.title']),
          );
        }
    );
  }

  void orderingProcess() {
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

    widget.feed.items.forEach((item) {
      var data = {
        'item.author' : item.author,
        'item.pubDate' : item.pubDate,
        'item.enclosure.url' : item.enclosure.url,
        'item.title' : item.title,
      };
      feedOrderedByDate.add(data);
    });
  }
}