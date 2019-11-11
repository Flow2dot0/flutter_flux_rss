import 'package:flutter/material.dart';
import 'package:flutter_flux_rss/widgets/grid_item.dart';
import 'package:webfeed/domain/rss_feed.dart';

class CustomGridView extends StatefulWidget {
  RssFeed feed;

  CustomGridView(RssFeed feed) {
    this.feed = feed;
  }

  @override
  _CustomGridViewState createState() => _CustomGridViewState();
}

class _CustomGridViewState extends State<CustomGridView> {

  List<Map> feedOrderedByDate = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setData();
    orderingProcess();
  }

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
        itemCount: feedOrderedByDate.length,
        itemBuilder: (context, i) {
          Map each = feedOrderedByDate[i];
          return Container(
            child: GridItem(each),
          );
        }
    );
  }


  orderingProcess() {
    feedOrderedByDate.sort((a,b) {
      var aDate = a['item.pubDate'];
      var bDate = b['item.pubDate'];
      return bDate.compareTo(aDate);
    });
  }

  fixAuthor(x) {
    if(x!=null) {
      return x;
    } else {
      return "Unknown";
    }
  }

  void setData() {

    widget.feed.items.forEach((item) {
      var data = {
        'item.author' : fixAuthor(item.author),
        'item.pubDate' : item.pubDate,
        'item.enclosure.url' : item.enclosure.url,
        'item.title' : item.title,
        'item.description' : item.description
      };
      feedOrderedByDate.add(data);
    });
  }
}