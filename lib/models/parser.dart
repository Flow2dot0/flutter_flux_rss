import 'package:webfeed/webfeed.dart';
import 'package:http/http.dart' as http;
import 'dart:async';

class Parser {
//  final url = "https://www.bfmtv.com/rss/info/flux-rss/flux-toutes-les-actualites/";
//  final channelLists = [
//    "https://www.bfmtv.com/rss/planete/",
//    "https://www.bfmtv.com/rss/culture/"
//  ];

  final Map channelMap = {
    'theverge' : 'https://www.theverge.com/rss/index.xml',
    'appledev' : 'https://developer.apple.com/news/releases/rss/releases.rss',
  };

  Future<AtomFeed> loadRSS(String string) async {
    var client = new http.Client();
    await client.get(string).then((response) {
      return response.body;
    }).then((bodyString) {
      var feed = new AtomFeed.parse(bodyString);
      print(feed);
      // ca passe mais c pas recup du coté home
      return feed;
    });

  }


}
