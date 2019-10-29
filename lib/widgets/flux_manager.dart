//import 'package:barbarian/barbarian.dart';
//import 'package:flutter/material.dart';
//import 'package:flutter_flux_rss/widgets/flux.dart';
//
//class FluxManager {
//
//  FluxManager();
//
//  Future<Flux> get(String title) async{
//    await Barbarian.init();
//    var fluxMap = Barbarian.read(title);
//
//    // serialize
//    return fluxMap;
//  }
//
//  Future<List> getList() async {
//    await Barbarian.init();
//    List<String> allKeys = Barbarian.getAllKeys();
//    List l = [];
//    allKeys.forEach((k) {
//      var read = Barbarian.read(k);
//      if(read!=null) {
//        l.add(read);
//      }
//    });
//    return l;
//  }
//
//  Future<Null> add(String title, Map m) async{
//    await Barbarian.init();
//    Barbarian.write(title, m);
//  }
//
//  Future<Null> update(String title, Map m) async{
//    await Barbarian.init();
//    var fluxMap = Barbarian.read(title);
//    Barbarian.delete(title);
//    Map<String, String> tmp = Barbarian.read(title);
//    if(m['name']['url']!=tmp['name']['url'])
//
//    List newL = [];
//    Barbarian.write(title, copy);
//  }
//
//  Future<Null> delete(String title) async{
//    await Barbarian.init();
//    Barbarian.delete(title);
//  }
//
//
//
//}