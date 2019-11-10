import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class DateConvert {


  formattingDate(List l) {
    String ago = "ago";
    String format = "EEE, dd MMM yyyy HH:mm:ss zzz";
    String formatSecond = "yyyy-MM-DDThh:mm:ss-ZZZZZ";
    DateTime dateTime;

    for(var feed in l){
      var sc = feed['date'];
      if(feed['date'][0]=="2"){
        var formatter = DateFormat(formatSecond);
        dateTime = formatter.parse(sc);
      }else {
        var formatter = DateFormat(format);
        dateTime = formatter.parse(sc);
      }
      if(dateTime==null) {
        return l;
      } else {
        var diff = DateTime.now().difference(dateTime);
        var days = diff.inDays;
        var hours = diff.inHours;
        var minutes = diff.inMinutes;

        if(days > 1) {
          feed['date'] = "$days days $ago";
        }
        else if(days == 1) {
          feed['date'] = "$days day $ago";
        }
        else if(hours > 1) {
          feed['date'] = "$hours hours $ago";
        }
        else if(hours == 1) {
          feed['date'] = "$hours hour $ago";
        }
        else if(minutes > 1) {
          feed['date'] = "$minutes minutes $ago";
        }
        else if(minutes == 1) {
          feed['date'] = "$minutes minute $ago";
        }
        else {
          feed['date'] = "less than $minutes minute";
        }
      }
    }
    return l;
  }

}

