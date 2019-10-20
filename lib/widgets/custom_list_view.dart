import 'package:flutter/material.dart';
import 'package:flutter_flux_rss/models/date_convert.dart';
import 'package:flutter_flux_rss/widgets/card_item.dart';
import 'package:webfeed/domain/rss_feed.dart';
import 'package:webfeed/domain/rss_item.dart';
import 'package:flutter_flux_rss/models/date_convert.dart';

class CustomListView extends StatefulWidget {

  RssFeed feed;

  CustomListView(RssFeed feed) {
    this.feed = feed;
  }

  @override
  _CustomListViewState createState() => _CustomListViewState();
}

class _CustomListViewState extends State<CustomListView> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: widget.feed.items.length,
        itemBuilder: (context, i) {
        RssItem item = widget.feed.items[i];
          return Container(
            child: CardItem(item.author, DateConvert().convertDate(item.pubDate), item.enclosure.url, item.title),
          );
        }
    );
  }
}