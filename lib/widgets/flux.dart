
class Flux {
  String type;
  String url;
  String date;

  Map scheme = {
    "user_default" : {
      "flux_list" : {
        "default" : {
          "url" : "https://www.theverge.com/rss/index.xml",
          "type" : "xml",
          "date" : DateTime.now()
        }
      }
    }
  };

  Flux(this.type, this.url, this.date);
}