import 'package:webfeed/webfeed.dart';
import 'package:http/http.dart';
import 'dart:async';

class Parser {

  final Map channelMap = {
    'theverge' : 'https://www.theverge.com/rss/index.xml',
    'appledev' : 'https://developer.apple.com/news/releases/rss/releases.rss',
  };

  Future loadRSS(String string) async {
//    var client = new http.Client();
//      await client.get(channelMap['$string']).then((response) {
//        return response.body;
//      }).then((bodyString) {
//        AtomFeed feed = new AtomFeed.parse(bodyString);
//        print(feed.items.first.title);
//      });

      final response = await get(channelMap['$string']);
      if(response.statusCode == 200) {
        final feed = AtomFeed.parse(response.body);
        return feed;
      } else {
        print("error : ${response.body}");
      }


  }

//  Future<AtomFeed> loadRSS() async {
//    var mapToReturn = Map();
//
//    channelMap.forEach((k, v) async {
//      final response = await get("http://www.france24.com/fr/actualites/rss");
//      if(response.statusCode == 200) {
//        final feed = AtomFeed.parse(response.body);
//        mapToReturn['$k'] = feed;
//      } else {
//        print("error : ${response.body}");
//      }
//    });
//    return mapToReturn;


//    Map channelMapGet = {};
//    channelMap.forEach((key, value) async {
//      final response = await get(value);
//      if(response.statusCode == 200) {
//        RssFeed feed = RssFeed.parse(response.body);
//        print(RssFeed.parse(response.body));
//        channelMapGet[key] = feed;
//      } else {
//        print("error : ${response.statusCode}");
//      }
//    });
//    print("MAP :  ${channelMapGet['planet']}");
//    return channelMapGet;



//    List<RssFeed> channelsList = [];
//
//    channelMap.forEach((key, value) async {
//      final response = await get(value);
//      if(response.statusCode == 200) {
//        final feed = RssFeed.parse(response.body);
//        channelsList.add(feed);
//      } else {
//        print("error : ${response.statusCode}");
//      }
//    });
//    return channelsList;
//  }
}
