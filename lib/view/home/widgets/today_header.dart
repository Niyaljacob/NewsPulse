// lib/widgets/today_header.dart
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:newspulse/view/home/widgets/date.dart';
import 'package:newspulse/view/home/widgets/line_dot.dart';

class TodayHeader extends StatelessWidget {
  const TodayHeader({super.key});

  @override
  Widget build(BuildContext context) {
    String todayDate = DateFormat('MMM d, EEEE').format(DateTime.now());

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20.0),
      child: Center(
        child: Row(
          children: [
            // Line and Dot
            LineAndDot(),
            const SizedBox(width: 15),
            // Today Date
            Date(todayDate: todayDate),
          ],
        ),
      ),
    );
  }
}

