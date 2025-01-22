import 'package:flutter/material.dart';
import 'package:newspulse/utils/color.dart';

class LineAndDot extends StatelessWidget {
  const LineAndDot({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.3,
      child: Stack(
        alignment: Alignment.centerRight,
        children: [
          Container(
            height: 2,
            color: black,
            width: double.infinity,
          ),
          Container(
            width: 8,
            height: 8,
            decoration: const BoxDecoration(
              color: black,
              shape: BoxShape.circle,
            ),
          ),
        ],
      ),
    );
  }
}