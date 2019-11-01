import 'package:barbarian/barbarian.dart';
import 'dart:async';

class Database{

  Map userDefaultLocked = {
    "manager_flux" : {
      "default" : {
        "url" : "https://www.theverge.com/rss/index.xml",
        "type" : "xml",
        "date" : DateTime.now().toString()
      },
    }
  };

  Map userDefault;

  Map toJson() => userDefault;

  Database();

  @override
  String toString() => toJson().toString();

  Future<bool> initDb() async{
    var response = await Barbarian.init();
    if(response!=null) {
      if(userDefault==null) {
        var get = Barbarian.read("user_default",
            customDecode: (output) => output.map((k, v) => MapEntry(k, v)));
        print("j'oouvre la db $get");
        if(get==null) {
          Barbarian.write("user_default", userDefaultLocked);
          print("...CREATE DATABASE...");

        }else{
          userDefault = get;
          print(userDefault);
          print("jattribue la base trouvée à $userDefault");
          print("...LOADING DATABASE...");
        }
        return true;
      }
      return false;
    }
  }


  void add(String title, String url){
    var counter = url.length;
    var sc = url.substring(counter-4, counter);

    print(userDefault);
    userDefault['manager_flux'][title] = {
      "url" : url,
      "type" : (sc=="xml" ? "xml" : (sc=="rss" ? "rss" : null)),
      "date" : DateTime.now().toString(),
    };
    syncData();
  }

  void update(String title, String url) {
    delete(title);
    add(title, url);
  }

  void delete(String name) {
    userDefault['manager_flux'].remove(name);
    print(userDefault);
    syncData();
  }

  void reset() {
    userDefault = userDefaultLocked;
    syncData();
  }

  List<dynamic> getActualKeys(){
    List l = [];
    for(var key in userDefault['manager_flux'].keys) {
      l.add(key);
    }
    print(l);
    return l;
  }

  List<dynamic> getActualEntries(){
    List l = [];
    for(var value in userDefault['manager_flux'].values) {
      l.add(value);
    }
    return l;
  }

  Future<bool> syncData() async{
    await Barbarian.init();
    Barbarian.delete("user_default");
    Barbarian.write("user_default", userDefault);
    var get = Barbarian.read("user_default",
        customDecode: (output) => output.map((k, v) => MapEntry(k, v)));
    print(get);
    if(get!=null){
      print("SYNCING : SUCCESS");
      return true;
    } else {
      print("SYNCING : FAILED");
      return true;
    }
  }


}

