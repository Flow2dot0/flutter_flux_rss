import 'package:flutter/material.dart';
import 'package:flutter_flux_rss/widgets/custom_text.dart';

class Detail extends StatelessWidget {

  List<Map> feed;

  Detail(this.feed)

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: CustomText("Detail"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[],
        ),
      ),
    );
  }
}
