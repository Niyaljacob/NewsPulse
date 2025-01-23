import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:url_launcher/url_launcher.dart';

class Url extends StatelessWidget {
  const Url({
    super.key,
    required this.url,
  });

  final String url;

  @override
  Widget build(BuildContext context) {
    Future<void> launchInBrowser(Uri url) async {
      if (!await launchUrl(
        url,
        mode: LaunchMode.externalApplication,
      )) {
        throw Exception('Could not launch $url');
      }
    }
    return GestureDetector(
      onTap: () => launchInBrowser(Uri.parse(url)),
      child: const Text(
        "Read Full Article",
        style: TextStyle(
          fontSize: 18,
          color: Colors.blue,
          decoration: TextDecoration.underline,
        ),
        textAlign: TextAlign.left,
      ),
    );
  }
}

