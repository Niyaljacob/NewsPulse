import 'package:flutter/material.dart';
import 'package:newspulse/utils/color.dart';

class TopHeadLinesHeading extends StatelessWidget {
  const TopHeadLinesHeading({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          "Top Headlines",
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(right: 8),
          child: Text(
            "See all",
            style: TextStyle(
              color: grey,
              fontSize: 14,
            ),
          ),
        ),
      ],
    );
  }
}