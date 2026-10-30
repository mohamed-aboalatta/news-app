import 'package:flutter/material.dart';
import 'package:news_app/models/article_model.dart';

class DetailsScreen extends StatelessWidget {
  final ArticleModel model;

  const DetailsScreen({super.key, required this.model});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      appBar: AppBar(
        backgroundColor: Colors.grey.shade200,
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: Container(
            margin: EdgeInsets.only(left: 10),
            padding: EdgeInsets.only(left: 8),
            decoration: BoxDecoration(
              color: Colors.white,
              shape: BoxShape.circle,
            ),
            child: Icon(Icons.arrow_back_ios, size: 25),
          ),
        ),
        title: Text(
          model.source ?? "Source is not found",
          style: TextStyle(fontSize: 25, fontWeight: .w700),
        ),
        centerTitle: true,
        actions: [
          Container(
            margin: EdgeInsets.only(right: 10),
            width: 45,
            height: 45,
            decoration: BoxDecoration(
              color: Colors.white,
              shape: BoxShape.circle,
            ),
            child: Icon(Icons.bookmark_border, size: 25),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: .stretch,
          children: [
            model.urlToImage != null
                ? ClipRRect(
                    borderRadius: BorderRadiusGeometry.circular(20),
                    child: Image.network(
                      model.urlToImage!,
                      errorBuilder: (context, error, stackTrace) => Column(
                        children: [
                          Icon(
                            Icons.error_outline,
                            color: Colors.red,
                            size: 150,
                          ),
                          SizedBox(height: 10),
                          Text(
                            "Image is not found",
                            style: TextStyle(color: Colors.red, fontSize: 18),
                          ),
                        ],
                      ),
                    ),
                  )
                : Column(
                    children: [
                      Icon(Icons.error_outline, color: Colors.red, size: 150),
                      SizedBox(height: 10),
                      Text(
                        "Image is not found",
                        style: TextStyle(color: Colors.red, fontSize: 30),
                      ),
                    ],
                  ),
            SizedBox(height: 10),
            Text(
              model.author != null
                  ? "         ${model.author}"
                  : "         Author is not found",
              style: TextStyle(fontSize: 18, fontWeight: .w600),
            ),
            SizedBox(height: 10),
            Text(
              model.publishedAt ?? "PublishedAt is not found",
              style: TextStyle(fontSize: 16, fontWeight: .w600),
            ),
            SizedBox(height: 10),
            Text(
              model.title ?? "Title is not found",
              style: TextStyle(fontSize: 20, fontWeight: .w600),
            ),
            SizedBox(height: 30),
            Text(
              model.description ?? "Description is not found",
              style: TextStyle(fontSize: 15, fontWeight: .w500),
            ),
            SizedBox(height: 20),
            Text(
              model.content ?? "Content is not found",
              style: TextStyle(fontSize: 15, fontWeight: .w500),
            ),
          ],
        ),
      ),
    );
  }
}
