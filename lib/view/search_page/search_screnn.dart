import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:newspulse/controller/news_controller.dart';
import 'package:newspulse/view/search_page/widgets/listview_news.dart';
import 'package:newspulse/view/search_page/widgets/search_appbar';

class SearchScreen extends StatelessWidget {
  SearchScreen({super.key});

  final NewsController newsController = Get.put(NewsController());
  final RxString searchQuery = ''.obs;
  final TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: SearchAppBar(
          searchController: searchController,
          searchQuery: searchQuery,
        ),
        body: Obx(() {
          if (newsController.isAllNewsLoading.value) {
            return const Center(child: CircularProgressIndicator());
          }
      
          final filteredNews = newsController.allNews.where((article) {
            final title = article.title?.toLowerCase() ?? '';
            return title.contains(searchQuery.value);
          }).toList();
      
          if (filteredNews.isEmpty) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.search_off, size: 80, color: Colors.grey.shade500),
                  const SizedBox(height: 10),
                  Text(
                    'No news articles found.',
                    style: TextStyle(fontSize: 18.0, color: Colors.grey.shade600),
                  ),
                ],
              ),
            );
          }
      
          return ListViewNews(filteredNews: filteredNews);
        }),
      ),
    );
  }
}

