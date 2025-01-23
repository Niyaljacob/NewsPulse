import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:newspulse/controller/news_controller.dart';
import 'package:newspulse/utils/color.dart';
import 'package:newspulse/view/see_all_top_headlines/see_all_headline_screen.dart';

class TopHeadLinesHeading extends StatelessWidget {
  const TopHeadLinesHeading({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final NewsController newsController = Get.put(NewsController());
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          "Top Headlines",
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        TextButton(
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (_){
             return SeeAllHeadlineScreen(newsController: newsController);
            }));
          },
          style: TextButton.styleFrom(
            padding:
                const EdgeInsets.only(right: 8), // Apply padding to the right
          ),
          child: Text(
            "See all",
            style: TextStyle(
              color: grey,
              fontSize: 14,
            ),
          ),
        )
      ],
    );
  }
}
