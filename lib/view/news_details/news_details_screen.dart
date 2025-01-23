import 'package:flutter/material.dart';
import 'package:newspulse/utils/color.dart';
import 'package:url_launcher/url_launcher.dart';

class NewsDetailsScreen extends StatelessWidget {
  final String id;
  final String name;
  final String imageUrl;
  final String author;
  final String description;
  final String content;
  final String url;

  const NewsDetailsScreen({
    super.key,
    required this.id,
    required this.name,
    required this.imageUrl,
    required this.author,
    required this.description,
    required this.content,
    required this.url,
  });

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    // Function to remove the "[+chars]" and append "Read Full Article" link
    String getDisplayContent(String content) {
      if (content.contains('[+')) {
        return content.split('[+').first.trim();
      }
      return content;
    }

   

Future<void> _launchInBrowser(Uri url) async {
      if (!await launchUrl(
        url,
        mode: LaunchMode.externalApplication,
      )) {
        throw Exception('Could not launch $url');
      }
    }


    return Scaffold(
      appBar: AppBar(
        
        backgroundColor: appBarColor,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (imageUrl.isNotEmpty)
              ClipRRect(
                child: Image.network(
                  imageUrl,
                  fit: BoxFit.cover,
                ),
              ),
            const SizedBox(height: 16),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Container(
                        height: screenWidth * 0.08,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          color: const Color.fromARGB(255, 226, 226, 226),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: Center(child: Text(author)),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      description,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 30,
                      ),
                      textAlign: TextAlign.left,
                    ),
                  ),
                  const SizedBox(height: 16),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      getDisplayContent(content),
                      style: const TextStyle(fontSize: 18),
                      textAlign: TextAlign.left,
                    ),
                  ),
                  const SizedBox(height: 8),
                  GestureDetector(
                    onTap: () => _launchInBrowser(Uri.parse(url)),
                    child: const Text(
                      "Read Full Article",
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.blue,
                        decoration: TextDecoration.underline,
                      ),
                      textAlign: TextAlign.left,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 8),
          ],
        ),
      ),
    );
  }
}
