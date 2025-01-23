import 'package:flutter/material.dart';
import 'package:newspulse/view/news_details/widgets/author.dart';
import 'package:newspulse/view/news_details/widgets/content.dart';
import 'package:newspulse/view/news_details/widgets/description.dart';
import 'package:newspulse/view/news_details/widgets/url.dart';

class NewsDetailsView extends StatelessWidget {
  const NewsDetailsView({
    super.key,
    required this.imageUrl,
    required this.screenWidth,
    required this.author,
    required this.description,
    required this.content,
    required this.url,
  });

  final String imageUrl;
  final double screenWidth;
  final String author;
  final String description;
  final String content;
  final String url;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (imageUrl.isNotEmpty)
            ClipRRect(
              child: AspectRatio(
                aspectRatio: 16 / 9, // Adjust the aspect ratio as needed
                child: Image.network(
                  imageUrl,
                  fit: BoxFit.cover,
                  loadingBuilder: (BuildContext context, Widget child, ImageChunkEvent? loadingProgress) {
                    if (loadingProgress == null) {
                      return child;
                    } else {
                      return Container(
                        alignment: Alignment.center,
                        child: CircularProgressIndicator(
                          value: loadingProgress.expectedTotalBytes != null
                              ? loadingProgress.cumulativeBytesLoaded / (loadingProgress.expectedTotalBytes ?? 1)
                              : null,
                        ),
                      );
                    }
                  },
                  errorBuilder: (BuildContext context, Object error, StackTrace? stackTrace) {
                    return Container(
                      color: Colors.grey,
                      alignment: Alignment.center,
                      child: const Icon(
                        Icons.error,
                        color: Colors.red,
                        size: 40,
                      ),
                    );
                  },
                ),
              ),
            ),
          const SizedBox(height: 16),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Author
                Author(screenWidth: screenWidth, author: author),
                const SizedBox(height: 16),

                // Description
                Description(description: description),
                const SizedBox(height: 16),

                // Content
                Content(content: content),
                const SizedBox(height: 8),

                // URL
                Url(url: url),
              ],
            ),
          ),
          const SizedBox(height: 8),
        ],
      ),
    );
  }
}
