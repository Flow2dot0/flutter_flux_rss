import 'package:flutter/material.dart';
import 'package:flutter_flux_rss/models/date_convert.dart';
import 'package:flutter_flux_rss/widgets/custom_text.dart';
import 'package:flutter_flux_rss/widgets/detail.dart';

class ListItem extends StatelessWidget {

  Map feed;

  ListItem(this.feed);

  @override
  Widget build(BuildContext context) {
    return Card(
        elevation: 5.0,
        child: InkWell(
          onTap: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (BuildContext context) {
              return Detail(feed);
            }));
          },
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  CustomText(feed["item.author"], color: Colors.black,),
                  CustomText(DateConvert().convertDate(feed['item.pubDate']), color: Colors.pink, fontSize: 8.0,),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Container(
                    width: MediaQuery.of(context).size.width /2,
                    child: (feed['item.enclosure.url'] != "" ? Image.network(
                      feed['item.enclosure.url'], fit: BoxFit.fill,) : Image
                        .asset("assets/img/no_image.png", width: 140.0,
                      height: 150.00,)),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width /2.2,
                    child: CustomText(feed['item.title'], fontSize: 10.0,),
                  )
                ],
              )
            ],
          ),
        )
    );
  }

}
