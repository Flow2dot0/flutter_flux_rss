import 'package:flutter/material.dart';
import 'package:flutter_flux_rss/widgets/custom_text.dart';

class CardItem extends Card {

  CardItem(String author, String lastBuildDate, String enclosureUrl, String title):
        super(
        color: Colors.indigo[400],
        elevation : 5.0,
        child : InkWell(
          onTap: () {

          },
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  customContainer(CustomText((author!=null ? author : "NOT FOUND"), color: (author!=null ? Colors.black : Colors.grey), fontSize: 20.0,)),
                  customContainer(CustomText(lastBuildDate, color: Colors.red, fontSize: 12.0,)),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Card(
                    elevation: 2.00,
                    child: Container(
                      child: (enclosureUrl!=""? Image.network(enclosureUrl, fit: BoxFit.fill, width: 150.0, height: 100.00,) : Image.asset("assets/img/no_image.png", width: 150.0, height: 150.00, fit: BoxFit.fill,)),
                    ),
                  ),
                  customContainer(CustomText(title, color: Colors.white, fontSize: 16.0, fontStyle: FontStyle.italic,), size: 225.00),
                ],
              )
            ],
          ),
        )
      );

  static Container customContainer(Widget widget, {size, padding}) {
    return Container(
      width: size,
      padding: (padding!=null? padding : EdgeInsets.all(5.00)),
      child: widget,
    );
  }

}