import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:newspulse/controller/news_controller.dart';
import 'package:newspulse/utils/color.dart';
import 'package:newspulse/view/home/widgets/all_news.dart';
import 'package:newspulse/view/home/widgets/allnewsheadingtext.dart';
import 'package:newspulse/view/home/widgets/today_header.dart';
import 'package:newspulse/view/home/widgets/top_headline.dart';
import 'package:newspulse/view/search_page/search_screnn.dart';

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
            IconButton(icon: Icon(Icons.search,color: whiteColor,), onPressed: () { 
              Navigator.push(context, MaterialPageRoute(builder: (_){
                return SearchScreen();
              }
              ))
              ;
             },)
          ],
        ),
        elevation: 0,
      ),
      body: Obx(() {
        // If data is loading, show the progress indicator
        if (newsController.isLoading.value) {
          return Center(
            child: CircularProgressIndicator(
              color: appBarColor,
            ),
          );
        } else {
          // If data is loaded, show the content
          return SingleChildScrollView(
            child: Column(
              children: [
                // Date
                TodayHeader(),
                // Top Headlines Section
                TopHeadLine(newsController: newsController),

                const SizedBox(height: 10),

                // All News Heading Text
                AllNewsHeadingText(),

                // All News Section
                AllNews(newsController: newsController),
              ],
            ),
          );
        }
      }),
    );
  }
}
