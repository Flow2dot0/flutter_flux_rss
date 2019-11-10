import 'package:flutter/material.dart';
import 'package:flutter_flux_rss/models/date_convert.dart';

import 'card_item.dart';

class CustomGrid extends StatefulWidget {
  List<Map> feed;

  CustomGrid(this.feed);


  @override
  _CustomGridState createState() => _CustomGridState();
}

class _CustomGridState extends State<CustomGrid> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    convertDate(widget.feed);
  }

  @override
  Widget build(BuildContext context) {
    List l = widget.feed;
    return GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
        itemBuilder: (context, i) {
          Map each = l[i];
          return Container(
            height: 200.0,
            child: CardItem(each['author'], each['date'], "", each['title']),
          );
        }
    );
  }
  convertDate(List<Map> l) async{
    var response = await DateConvert().formattingDate(l);
    if(response!=null) {
      widget.feed = response;
    }
  }
}