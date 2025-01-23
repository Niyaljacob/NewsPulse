import 'package:flutter/widgets.dart';

class Author extends StatelessWidget {
  const Author({
    super.key,
    required this.screenWidth,
    required this.author,
  });

  final double screenWidth;
  final String author;

  @override
  Widget build(BuildContext context) {
    return Row(
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
    );
  }
}
