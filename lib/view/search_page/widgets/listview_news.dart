import 'package:flutter/widgets.dart';
import 'package:newspulse/model/news_model.dart';
import 'package:newspulse/utils/image.dart';
import 'package:newspulse/view/home/widgets/all_news_card.dart';

class ListViewNews extends StatelessWidget {
  const ListViewNews({
    super.key,
    required this.filteredNews,
  });

  final List<Article> filteredNews;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: filteredNews.length,
      itemBuilder: (context, index) {
        final article = filteredNews[index];
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 5),
          child: NewsCard(
            category: 'Science',
            title: article.title ?? 'No title available',
            imageUrl: article.urlToImage ?? placeholder,
            id: article.source.id ?? 'Unknown source',
            name: article.source.name ?? 'Unknown source',
            author: article.author ?? 'Unknown',
            description: article.description ?? 'No description available',
            content: article.content ?? 'No content available',
            url: article.url ?? '',
          ),
        );
      },
    );
  }
}
