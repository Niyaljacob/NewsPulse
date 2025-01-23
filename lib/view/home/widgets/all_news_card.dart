import 'package:flutter/material.dart';
import 'package:newspulse/utils/color.dart';
import 'package:newspulse/utils/image.dart';
import 'package:newspulse/view/news_details/news_details_screen.dart';
import 'package:cached_network_image/cached_network_image.dart';

class NewsCard extends StatelessWidget {
  final String category;
  final String title;
  final String imageUrl;
  final String id;
  final String name;
  final String author;
  final String description;
  final String content;
  final String url;
  


  const NewsCard({
    super.key,
    required this.category,
    required this.title,
    required this.imageUrl,
    required this.id,
    required this.name, required this.author, required this.description, required this.content, required this.url, 
  });

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => 
            NewsDetailsScreen(
              id: id,
              name: name,
              imageUrl: imageUrl, author: author, description: description, content: content, url: url,
              
            ),
          ),
        );
      },
      child: Card(
        color: whiteColor,
        elevation: 3,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(0),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              child: CachedNetworkImage(
                imageUrl: imageUrl.isNotEmpty ? imageUrl : placeholder,
                height: screenWidth * 0.25,
                width: double.infinity,
                fit: BoxFit.cover,
                placeholder: (context, url) => Center(
                  child: SizedBox(
                    height: 30,
                    width: 30,
                    child: CircularProgressIndicator(
                      color: grey, // Customize the color
                      strokeWidth: 2,
                    ),
                  ),
                ),
                errorWidget: (context, url, error) => Image.asset(
                  placeholder, // Placeholder asset image
                  height: screenWidth * 0.25,
                  width: double.infinity, 
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    category.toUpperCase(),
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      color: grey,
                      fontSize: 12,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    title,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 19,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
