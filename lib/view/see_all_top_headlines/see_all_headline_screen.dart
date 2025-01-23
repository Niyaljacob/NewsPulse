import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:newspulse/controller/news_controller.dart';
import 'package:newspulse/utils/color.dart';
import 'package:newspulse/utils/image.dart';
import 'package:newspulse/view/home/widgets/top_headline_card.dart';

class SeeAllHeadlineScreen extends StatelessWidget {
  const SeeAllHeadlineScreen({super.key, required this.newsController});
  final NewsController newsController;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: appBarColor,
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 16, left: 16, right: 16),
        child: Column(
          children: [
            const SizedBox(height: 10),
            Obx(() {
              if (newsController.isLoading.value) {
                return const Center(child: CircularProgressIndicator());
              }

              return Expanded( // Use Expanded to fill available space
                child: ListView.builder(
                  itemCount: newsController.headlines.length,
                  itemBuilder: (context, index) {
                    final article = newsController.headlines[index];
                    return Padding(
                      padding: const EdgeInsets.only(bottom: 20.0),
                      child: TopHeadlineCard(
                        name: article.source.name ?? "Unknown source",
                        id: article.source.id ?? "Unknown ID",
                        imageUrl: article.urlToImage ?? placeholder,
                        title: article.title ?? "No title available",
                        date: article.publishedAt ?? "Unknown date",
                        author: article.author ?? "Unknown",
                        description: article.description ?? "Unknown",
                        content: article.content ?? "Unknown",
                        url: article.url ?? "Unknown",
                      ),
                    );
                  },
                ),
              );
            }),
          ],
        ),
      ),
    );
  }
}
