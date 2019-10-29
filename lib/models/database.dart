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

  Database(){
    initDb();
  }

  @override
  String toString() => toJson().toString();

  Future initDb() async{
    await Barbarian.init();
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
    }
    return Future.delayed(Duration(seconds: 4), () => userDefault);
  }

  Future<Map> get(String name) async {
    var get = await userDefault['manager_flux'][name];
    print("je get $get");
    return get;
  }

  getList() {
    var get = userDefault['manager_flux'];
    print('Jaffiche une liste ${userDefault['manager_flux']}');
    print(userDefault);
    return get;
  }

  add(String title, String url){
    var counter = url.length;
    var sc = url.substring(counter-4, counter);

    print(userDefault);
    userDefault['manager_flux'][title] = {
      "url" : url,
      "type" : (sc=="xml" ? "xml" : (sc=="rss" ? "rss" : null)),
      "date" : DateTime.now().toString(),
    };
    syncData();
    return userDefault;
  }

  update(String title, String url) {
    delete(title);
    add(title, url);
  }

  delete(String name) {
    userDefault['manager_flux'].remove(name);
    print(userDefault);
    syncData();
    return userDefault;
  }

  reset() {
    userDefault = userDefaultLocked;
    syncData();
    return userDefault;
  }

  getActualKeys(){
    List l = [];
    userDefault['manager_flux'].forEach((k, v) {
      print(k);
      l.add(k);
    });
    print(l);
    return l;
  }

  getActualEntries(){
    List l = [];
    userDefault['manager_flux'].forEach((k, v) {
      print(v);
      l.add(v);
    });
    return l;
  }



  Future syncData() async{
    await Barbarian.init();
    Barbarian.delete("user_default");
    Barbarian.write("user_default", userDefault);
    var get = Barbarian.read("user_default",
        customDecode: (output) => output.map((k, v) => MapEntry(k, v)));
    print(get);
    if(get!=null){
      print("...SUCCESS : SYNC DONE...");
      return "success";
    } else {
      print("...ERROR : SYNC FAILED...");
      return "failed";
    }

  }


}

