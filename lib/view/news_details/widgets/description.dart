import 'package:flutter/widgets.dart';

class Description extends StatelessWidget {
  const Description({
    super.key,
    required this.description,
  });

  final String description;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Text(
        description,
        style: const TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 30,
        ),
        textAlign: TextAlign.left,
      ),
    );
  }
}

