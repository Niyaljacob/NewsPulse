import 'package:flutter/widgets.dart';

class Content extends StatelessWidget {
  const Content({
    super.key,
    required this.content,
  });

  final String content;

  @override
  Widget build(BuildContext context) {
    // Function to remove the "[+chars]" and append "Read Full Article" link
    String getDisplayContent(String content) {
      if (content.contains('[+')) {
        return content.split('[+').first.trim();
      }
      return content;
    }
    return Align(
      alignment: Alignment.centerLeft,
      child: Text(
        getDisplayContent(content),
        style: const TextStyle(fontSize: 18),
        textAlign: TextAlign.left,
      ),
    );
  }
}

