import 'package:flutter/material.dart';

class HomeItem extends StatelessWidget {
  final String? urlToImage;
  final String? author;
  final String? title;
  final String? publishedAt;

  const HomeItem({
    super.key,
    required this.urlToImage,
    required this.author,
    required this.title,
    required this.publishedAt,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 115,
      child: Row(
        spacing: 10,
        children: [
          Flexible(
            flex: 3,
            child: urlToImage != null
                ? ClipRRect(
                    borderRadius: BorderRadiusGeometry.circular(10),
                    child: Image.network(
                      urlToImage!,
                      errorBuilder: (context, error, stackTrace) =>
                          Column(
                            children: [
                              Icon(Icons.error_outline, color: Colors.red, size: 50),
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
                      Icon(Icons.error_outline, color: Colors.red, size: 50),
                      SizedBox(height: 10),
                      Text(
                        "Image is not found",
                        style: TextStyle(color: Colors.red, fontSize: 18),
                      ),
                    ],
                  ),
          ),

          Flexible(
            flex: 4,
            child: Column(
              crossAxisAlignment: .stretch,
              children: [
                Text(
                  author ?? "Author is not found",
                  style: TextStyle(fontWeight: .w600, fontSize: 12),
                ),
                SizedBox(height: 5),
                Text(
                  title ?? "Title is not found",
                  maxLines: 3,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(fontWeight: .w600, fontSize: 12),
                ),
                SizedBox(height: 5),
                Text(
                  publishedAt ?? "PublishedAt is not found",
                  textAlign: TextAlign.end,
                  style: TextStyle(
                    fontWeight: .w600,
                    fontSize: 10,
                    color: Color(0xffD2B0B0),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
