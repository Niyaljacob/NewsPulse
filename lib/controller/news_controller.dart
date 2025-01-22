import 'package:get/get.dart';
import 'package:newspulse/model/news_model.dart';
import 'package:newspulse/service/news_service.dart';

class NewsController extends GetxController {
  final NewsService _newsService = NewsService();
  var headlines = <Article>[].obs; // Reactive list for articles
  var isLoading = true.obs;

  @override
  void onInit() {
    super.onInit();
    fetchHeadlines();
  }

  void fetchHeadlines() async {
    try {
      isLoading(true);
      final response = await _newsService.fetchTopHeadlines();
      headlines.assignAll(response.articles);
    } catch (e) {
      print("Error fetching headlines: $e");
    } finally {
      isLoading(false);
    }
  }
}
