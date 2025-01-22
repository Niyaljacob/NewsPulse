import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:newspulse/model/news_model.dart';


class NewsService {
  final String headlineApi =
      "https://newsapi.org/v2/top-headlines?country=us&apiKey=6191b530f66447e6a047a7593605fde2";
  final String allNewsApi =
      "https://newsapi.org/v2/everything?q=general&apiKey=6191b530f66447e6a047a7593605fde2";

  Future<NewsResponse> fetchTopHeadlines() async {
    final response = await http.get(Uri.parse(headlineApi));
    if (response.statusCode == 200) {
      return NewsResponse.fromJson(json.decode(response.body));
    } else {
      throw Exception("Failed to load top headlines");
    }
  }

  Future<NewsResponse> fetchAllNews() async {
    final response = await http.get(Uri.parse(allNewsApi));
    if (response.statusCode == 200) {
      return NewsResponse.fromJson(json.decode(response.body));
    } else {
      throw Exception("Failed to load all news");
    }
  }
}
