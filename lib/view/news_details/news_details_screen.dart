import 'package:flutter/material.dart';
import 'package:newspulse/utils/color.dart';
import 'package:newspulse/view/news_details/widgets/news_details_view.dart';

class NewsDetailsScreen extends StatelessWidget {
  final String id;
  final String name;
  final String imageUrl;
  final String author;
  final String description;
  final String content;
  final String url;

  const NewsDetailsScreen({
    super.key,
    required this.id,
    required this.name,
    required this.imageUrl,
    required this.author,
    required this.description,
    required this.content,
    required this.url,
  });

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: appBarColor,
      ),
      body: NewsDetailsView(
          imageUrl: imageUrl,
          screenWidth: screenWidth,
          author: author,
          description: description,
          content: content,
          url: url),
    );
  }
}
