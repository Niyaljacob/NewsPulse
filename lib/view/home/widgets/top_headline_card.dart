import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:newspulse/utils/color.dart';
import 'package:newspulse/utils/image.dart';
import 'package:newspulse/view/news_details/news_details_screen.dart';

class TopHeadlineCard extends StatelessWidget {
  final String imageUrl;
  final String title;
  final String date;
  final String id;
  final String name;
  final String author;
  final String description;
  final String content;
  final String url;
  

  const TopHeadlineCard({
    super.key,
    required this.imageUrl,
    required this.title,
    required this.date,
    required this.id,
    required this.name, 
    required this.author, required this.description, required this.content, required this.url, 
  });

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    DateTime parsedDate = DateTime.parse(date);
    String formattedDate = DateFormat('MMM d, yyyy').format(parsedDate);

    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => NewsDetailsScreen(
              id: id,
              name: name,
              imageUrl: imageUrl,
              author:author,
              description:title,
              content:content,
              url:url,
            ),
          ),
        );
      },
      child: Container(
        width: screenWidth * 0.8,
        height: screenWidth * 0.8,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: cardColor,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 8.0, horizontal: 8.0),
              child: Center(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: CachedNetworkImage(
                    imageUrl: imageUrl.isNotEmpty ? imageUrl : placeholder,
                    height: screenWidth * 0.43,
                    width: screenWidth * 0.8,
                    fit: BoxFit.cover,
                    placeholder: (context, url) =>
                        Center(child: const CircularProgressIndicator()),
                    errorWidget: (context, url, error) => const Icon(
                      Icons.broken_image,
                      size: 50,
                      color: Colors.grey,
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                title,
                maxLines: 3,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
            ),
            
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    formattedDate,
                    style: const TextStyle(color: grey),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 4),
          ],
        ),
      ),
    );
  }
}