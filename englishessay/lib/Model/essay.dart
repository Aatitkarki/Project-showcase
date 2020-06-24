class Essay {
  int id;
  String title;
  String createdDate;
  String essayData;
  String author;
  int bookmark;

  Essay({
    this.id,
    this.title,
    this.createdDate,
    this.essayData,
    this.author,
    this.bookmark
  });

  factory Essay.fromJson(Map<String, dynamic> json) => Essay(
        id: int.parse(json["id"]),
        title: json["title"],
        createdDate: json["createdDate"],
        essayData: json["essayData"],
        author: json["author"],
        bookmark: int.parse(json["bookmark"])
      );


      factory Essay.fromMap(Map<String, dynamic> json) => Essay(
        id: json["id"],
        title: json["title"],
        createdDate: json["createdDate"],
        essayData: json["essayData"],
        author: json["author"],
        bookmark: json["bookmark"]
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "createdDate": createdDate,
        "essayData": essayData,
        "author": author,
        "bookmark": bookmark
      };
}
