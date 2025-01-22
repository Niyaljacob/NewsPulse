import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:newspulse/controller/news_controller.dart';
import 'package:newspulse/utils/image.dart';
import 'package:newspulse/view/home/widgets/all_news_card.dart';

class AllNews extends StatelessWidget {
  const AllNews({
    super.key,
    required this.newsController,
  });

  final NewsController newsController;

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      // Handle empty list or loading state
      if (newsController.isLoading.value) {
        return const Center(child: CircularProgressIndicator());
      }
    
      return ListView.builder(
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        itemCount: newsController.allNews.length,
        itemBuilder: (context, index) {
          final article = newsController.allNews[index];
          return Padding(
            padding: const EdgeInsets.symmetric(
                horizontal: 16.0, vertical: 5),
            child: NewsCard(
              category:
                  'Science', // Now using the category directly from the article
              title: article.title ??
                  "No title available", // Provide a default title
              imageUrl: article.urlToImage ??
                  placeholder, 
                  id: article.source.id ??
                          "Unknown source", 
                          name: article.source.name ??
                          "Unknown source", // Default image if none exists
            ),
          );
        },
      );
    });
  }
}

