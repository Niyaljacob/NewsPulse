import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:newspulse/model/news_model.dart';


class NewsService {
  final String headlineApi =
      "https://newsapi.org/v2/top-headlines?country=us&apiKey=4b0ccce03d5f419587a5533939d0e768";
  final String allNewsApi =
      "https://newsapi.org/v2/everything?q=general&apiKey=4b0ccce03d5f419587a5533939d0e768";

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
