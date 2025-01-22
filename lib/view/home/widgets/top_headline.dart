import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:newspulse/controller/news_controller.dart';
import 'package:newspulse/utils/image.dart';
import 'package:newspulse/view/home/widgets/top_headline_card.dart';
import 'package:newspulse/view/home/widgets/top_headlines_heading.dart';

class TopHeadLine extends StatelessWidget {
  const TopHeadLine({
    super.key,
    required this.newsController,
  });

  final NewsController newsController;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 16, left: 16),
      child: Column(
        children: [
          TopHeadLinesHeading(),
          const SizedBox(height: 10),
          // Horizontal List with infinite scrolling
          Obx(() {
            if (newsController.isLoading.value) {
              return const Center(child: CircularProgressIndicator());
            }
    
            return SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: newsController.headlines.map((article) {
                  return Padding(
                    padding: const EdgeInsets.only(right: 20.0),
                    child: TopHeadlineCard(
                      name: article.source.name ??
                          "Unknown source", // Use source.name or provide a default value
                      id: article.source.id ?? "Unknown ID",
                      imageUrl: article.urlToImage ??
                          placeholder, // Provide a default image
                      description: article.title ??
                          "No title available", // Provide a default title
                      date: article.publishedAt ??
                          "Unknown date", // Provide a default date
                    ),
                  );
                }).toList(),
              ),
            );
          }),
        ],
      ),
    );
  }
}



