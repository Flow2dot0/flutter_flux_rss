import 'package:flutter/material.dart';

class CardItem extends Card {

  CardItem(String author, String lastBuildDate, String enclosureUrl, String title):
        super(
        child : Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(author,
                  textScaleFactor: 1,
                  style: TextStyle(
                  color: Colors.indigo,
                ),),
                Text(lastBuildDate,
                  textScaleFactor: 1,
                  style: TextStyle(
                    color: Colors.indigo,
                  ),),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Image.network(enclosureUrl),
                Text(title,
                  textScaleFactor: 1,
                  style: TextStyle(
                    color: Colors.indigo,
                  ),),
              ],
            )
          ],
        )
      );

}