import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:newspulse/controller/news_controller.dart';
import 'package:newspulse/utils/color.dart';
import 'package:newspulse/view/home/widgets/today_header.dart';
import 'package:newspulse/view/home/widgets/top_headlines_heading.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final NewsController newsController = Get.put(NewsController());

    return Scaffold(
      backgroundColor: whiteColor,
      appBar: AppBar(
        backgroundColor: appBarColor,
        leading: Icon(Icons.arrow_back, color: whiteColor),
        title: Row(
          children: [
            Spacer(),
            Icon(Icons.search, color: whiteColor),
          ],
        ),
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Date
            TodayHeader(),
            // Top Headlines Section
            Padding(
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
                              imageUrl: article.urlToImage ?? "assets/news1.jpg",
                              description: article.title,
                              date: article.publishedAt,
                            ),
                          );
                        }).toList(),
                      ),
                    );
                  }
                  ),
                ],
              ),
            ),
            // All News Section
            
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "All news",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 10),
                  NewsCard(
                    category: "SCIENCE",
                    title: "ISRO holds static test of Gaganyaan escape motor",
                    imageUrl: "assets/news1.jpg",
                  ),
                  SizedBox(height: 20),
                  NewsCard(
                    category: "WORLD",
                    title: "Walmart expands globally with new innovations",
                    imageUrl: "assets/news1.jpg",
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}


class TopHeadlineCard extends StatelessWidget {
  final String imageUrl;
  final String description;
  final String date;

  const TopHeadlineCard({
    super.key,
    required this.imageUrl,
    required this.description,
    required this.date,
  });

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    // Format the date
    DateTime parsedDate = DateTime.parse(date);
    String formattedDate = DateFormat('MMM d, yyyy').format(parsedDate);

    return Container(
      width: screenWidth * 0.8,
      height: screenWidth * 0.8,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color:  cardColor,
        
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 8.0),
            child: Center(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child:  CachedNetworkImage(
                  imageUrl: imageUrl.isNotEmpty ? imageUrl : "assets/news1.jpg",  
                  height: screenWidth * 0.43,
                  width: screenWidth * 0.8,
                  fit: BoxFit.cover,
                  placeholder: (context, url) => Center(child: const CircularProgressIndicator()), 
                  errorWidget: (context, url, error) => const Icon(
                    Icons.broken_image,
                    size: 50,
                    color: Colors.grey,
                  ),  // Fallback error icon
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              description,
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
    );
  }
}

class NewsCard extends StatelessWidget {
  final String category;
  final String title;
  final String imageUrl;

  const NewsCard({super.key, 
    required this.category,
    required this.title,
    required this.imageUrl,
  });

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return Card(
      color: whiteColor,
      elevation: 3,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(0), 
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            child: Image.asset(
              imageUrl,
              height: screenWidth * 0.25,
              width: double.infinity,
              fit: BoxFit.cover,
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
    );
  }
}
