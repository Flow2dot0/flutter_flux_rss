import 'package:flutter/material.dart';
import 'package:flutter_flux_rss/models/date_convert.dart';
import 'package:flutter_flux_rss/widgets/custom_text.dart';
import 'package:webfeed/domain/rss_feed.dart';

class Detail extends StatefulWidget {
  Map feed;

  Detail(this.feed);

  @override
  _DetailState createState() => _DetailState();
}

class _DetailState extends State<Detail> {
  @override
  Widget build(BuildContext context) {
    Orientation orientation = MediaQuery.of(context).orientation;
    return Scaffold(
      appBar: AppBar(
        title: CustomText('Content'),
      ),
      body: SingleChildScrollView(
        child: Center(
          child : Container(
            height: (orientation==Orientation.portrait? MediaQuery.of(context).size.height*0.88 : MediaQuery.of(context).size.height*2),
            child: Card(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  CustomText(widget.feed['item.title'], color: Colors.black, fontSize: 20.0,),
                  Container(
                    child: Card(
                      elevation: 5.0,
                      child: Container(
                        width: (orientation==Orientation.portrait? MediaQuery.of(context).size.width : MediaQuery.of(context).size.width/2),
                        child: (widget.feed['item.enclosure.url']!=""? Image.network(widget.feed['item.enclosure.url'], fit: BoxFit.fill,) : Image.asset("assets/img/no_image.png", width: 150.0, height: 120.00, fit: BoxFit.fill,)),
                      ),
                    ),
                  ),
                  Container(
                    width: (orientation==Orientation.portrait? MediaQuery.of(context).size.width : MediaQuery.of(context).size.width*0.75),
                    child: CustomText(widget.feed['item.description']),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      CustomText(widget.feed['item.author'], fontSize: 20.0, color: Colors.pink,),
                      CustomText(DateConvert().convertDate(widget.feed['item.pubDate']), color: Colors.grey,)
                    ],
                  )
                ],
              ),
            ),
          )
        ),
      )
    );
  }
}