import 'package:webfeed/webfeed.dart';
import 'package:http/http.dart' as http;
import 'dart:async';

class Parser {

  final Map channelMap = {
    'theverge' : 'https://www.theverge.com/rss/index.xml',
    'appledev' : 'https://developer.apple.com/news/releases/rss/releases.rss',
  };

  Future<List<Map>> loadRSS(List keys, List entries) async {

    List<dynamic> getKeys = keys;
    List<dynamic> getEntries = entries;

    List<Map> dataFull = [];

    String mode;
    int index = -1;

    var client = new http.Client();
    for(var value in getEntries) {
      index++;
      final getFeed = await client.get(value['url']);
      String url = value['url'].toString();
      mode = url.substring(url.length-3, url.length);
      if(getFeed.statusCode==200){
        print(getFeed.body);
        switch(mode) {
          case "xml" :
            AtomFeed feed = AtomFeed.parse(getFeed.body);
            print("le nv $feed");
            feed.items.forEach((item) {
              Map data = {
                "title" : item.title,
                "date" : item.updated,
                "author" : getKeys[index].toString().toUpperCase(),
                "poster" : null,
              };
              dataFull.add(data);
            });
            break;
          case "rss" :
            RssFeed feed = RssFeed.parse(getFeed.body);
            feed.items.forEach((item) {
              Map data = {
                "title" : item.title,
                "date" : item.pubDate,
                "author" : getKeys[index].toString().toUpperCase(),
                "poster" : null,
              };
              dataFull.add(data);
            });
            break;
        }
      }
    }
    return dataFull;
  }

}
