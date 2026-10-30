class ArticleModel {
  String? source;
  String? author;
  String? title;
  String? description;
  String? urlToImage;
  String? publishedAt;
  String? content;

  ArticleModel({
    this.source,
    this.author,
    this.title,
    this.description,
    this.urlToImage,
    this.publishedAt,
    this.content,
  });

  ArticleModel.fromJson(Map<String, dynamic> json) {
    source = json["source"]["name"];
    author = json["author"];
    title = json["title"];
    description = json["description"];
    urlToImage = json["urlToImage"];
    publishedAt = json["publishedAt"];
    content = json["content"];
  }
}
