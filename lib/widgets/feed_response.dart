class FeedResponse {
  String title;
  String poster;
  String author;
  String date;

  FeedResponse(this.title, this.poster, this.author, this.date);

  Map<String, dynamic> toJson() => {
    'title' : title,
    'poster' : poster,
    'author' : author,
    'date' : date,
  };

  FeedResponse.fromMap(Map<String, dynamic> map)
      : title = map['title'],
        poster = map['poster'],
        author = map['author'],
        date = map['date'];

  @override
  String toString() => toJson().toString();
}