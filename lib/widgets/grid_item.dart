import 'package:flutter/material.dart';
import 'package:flutter_flux_rss/widgets/custom_text.dart';
import 'package:flutter_flux_rss/widgets/detail.dart';
import 'package:webfeed/domain/rss_feed.dart';

class GridItem extends StatelessWidget {
  
  Map feed;
  
  GridItem(this.feed);
  
  
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5.0,
      child: InkWell(
        onTap: () {
          Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) {
            return Detail(feed);
          }));
        },
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            CustomText(feed['item.author'], color: Colors.black,),
            Container(
              width: MediaQuery.of(context).size.width * 1.25,
              child: (feed['item.enclosure.url']!=""? Image.network(feed['item.enclosure.url'], fit: BoxFit.fill,) : Image.asset("assets/img/no_image.png", width: 150.0, height: 200.00, )),
            ),
            Container(
              height: 40,
              child: CustomText(feed['item.title'], fontSize: 10.0,),
            )
          ],
        ),
      ),
    );
  }
}
