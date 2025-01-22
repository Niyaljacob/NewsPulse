import 'package:get/get.dart';
import 'package:newspulse/model/news_model.dart';
import 'package:newspulse/service/news_service.dart';

class NewsController extends GetxController {
  final NewsService _newsService = NewsService();
  var headlines = <Article>[].obs; // Reactive list for articles
  var allNews = <Article>[].obs; // Reactive list for all news
  var isLoading = true.obs; // Loading state for both headlines and all news
  var isAllNewsLoading = true.obs; // Loading state for all news
  

  @override
  void onInit() {
    super.onInit();
    fetchHeadlines(); // Fetch top headlines on init
    fetchAllNews(); // Fetch all news on init
  }

  // Method to fetch top headlines
  void fetchHeadlines() async {
    try { 
      isLoading(true); // Set loading state to true
      final response = await _newsService.fetchTopHeadlines(); // Call service
      headlines.assignAll(response.articles); // Update headlines list
    } catch (e) {
      print("Error fetching headlines: $e");
    } finally {
      isLoading(false); // Set loading state to false
    }
  }

  // Method to fetch all news
  void fetchAllNews() async {
    try {
      isAllNewsLoading(true); // Set loading state to true
      final response = await _newsService.fetchAllNews(); // Call service
      allNews.assignAll(response.articles); // Update allNews list
    } catch (e) {
      print("Error fetching all news: $e");
    } finally {
      isAllNewsLoading(false); // Set loading state to false
    }
  }
}
