import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class DateConvert {
  String convertDate(String string) {
    String il = "il y a";
    String format = "EEE, dd MMM yyyy HH:mm:ss Z";
    var formatter = DateFormat(format);
    DateTime dateTime = formatter.parse(string);
    if(dateTime==null) {
      return "Date inconnue !";
    } else {
      var diff = DateTime.now().difference(dateTime);
      var days = diff.inDays;
      var hours = diff.inHours;
      var minutes = diff.inMinutes;

      if(days > 1) {
        return "$il $days jours";
      }
      else if(days == 1) {
        return "$il $days jour";
      }
      else if(hours > 1) {
        return "$il $hours heures";
      }
      else if(hours == 1) {
        return "$il $hours heure";
      }
      else if(minutes > 1) {
        return "$il $minutes minutes";
      }
      else if(minutes == 1) {
        return "$il $minutes minute";
      }
      else {
        return "$il moins d'une minute";
      }
    }
  }
}