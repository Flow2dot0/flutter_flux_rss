import 'package:webfeed/webfeed.dart';
import 'package:http/http.dart';
import 'dart:async';

class Parser {
  List keys;
  List entries;
  List feeds;

  var atomFeed;
  var rssFeed;
  var feed;
  var mode;

  Parser(List keys, List entries) {
    this.keys = keys;
    this.entries = entries;
  }

//  void _convertDataToMapList() {
//    if(mode=="xml") {
//      atomFeed.items.forEach((item) {
//        feed = {
//          "title" : item.title.toString(),
//          "poster" : item.links.toString(),
//          "date" : item.published.toString(),
//          "author" : item.authors.toString(),
//        };
//      });
//    }
//    else if(mode=="rss") {
//      rssFeed.items.forEach((item) {
//        feed = {
//          "title": item.title.toString(),
//          "poster": item.enclosure.url.toString(),
//          "date": item.pubDate.toString(),
//          "author": item.author.toString(),
//        };
//      });
//    }

  Future loadRSS() async {
//    print("coucou");
//    var response = await get(entries[0]['url']);
//    Future.delayed((Duration(seconds: 1)), () {
//      print(response.body);
//    });


//    entries.forEach((entry) async{
//      var response = await get(entry);
//      Future.delayed((Duration(seconds: 2)), () {
//        print(response.body);
//      });
//    });

    entries.forEach((entry) async{
      print('une entrée ${entry['url']}');
      var entryTmp = entry['url'];
      var response = await get(entryTmp);
      Future.delayed((Duration(seconds: 1)), () {
        if(response.statusCode == 200) {
          print("la réponse du parser est : ${response.body}");
          switch(entryTmp.substring(entryTmp.length-4, entryTmp.length)) {
            case ".xml":
              var xmlString = response.body;

              var atomFeedTmp = AtomFeed.parse(xmlString);
              feeds = [atomFeedTmp, ...?atomFeed];

              print(feeds);
              mode = "xml";
              break;
            case ".rss":
              var xmlString = response.body;
              rssFeed = RssFeed.parse(xmlString);
              feeds.add(rssFeed);
              mode = "rss";
              break;
          }

        } else {
          print("error : ${response.body}");
        }
      });
    });
    Future.delayed((Duration(seconds: 2)), () {
      print("les feeds sont : $feeds");
      return feeds;
    });
  }
}


//  Future _setFeed() async {
//
//    fluxList.forEach((flux) {
//
//    });
//    switch(url.substring(url.length-4, url.length)) {
//      case ".xml":
//        var response = await get(url);
//        if(response.statusCode == 200) {
//          var xmlString = response.body;
//          atomFeed = AtomFeed.parse(xmlString);
//          mode = "xml";
//        } else {
//          print("error : ${response.body}");
//        }
//        break;
//      case ".rss":
//        var response = await get(url);
//        if(response.statusCode == 200) {
//          var xmlString = response.body;
//          rssFeed = RssFeed.parse(xmlString);
//          mode = "rss";
//        } else {
//          print("error : ${response.body}");
//        }
//        break;
//    }
//  }


//
//  Future getFeed() async {
//    if(feed!=null) return feed;
//  }






