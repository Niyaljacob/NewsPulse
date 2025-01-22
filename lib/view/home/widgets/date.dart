import 'package:flutter/material.dart';
import 'package:newspulse/utils/color.dart';

class Date extends StatelessWidget {
  const Date({
    super.key,
    required this.todayDate,
  });

  final String todayDate;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const Text(
          "today",
          style: TextStyle(
            fontSize: 32,
            fontWeight: FontWeight.w500,
            letterSpacing: -0.5,
          ),
        ),
        const SizedBox(height: 5),
        Text(
          todayDate,
          style: const TextStyle(
            color: black,
            fontSize: 16,
            fontWeight: FontWeight.w400,
          ),
        ),
      ],
    );
  }
}

