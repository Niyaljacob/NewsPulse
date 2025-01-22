import 'package:flutter/material.dart';
import 'package:newspulse/utils/image.dart';

class SplashImage extends StatelessWidget {
  const SplashImage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
    
      child: Center(
        child: Image.asset(
          splashImg,
          height: 300,
          width: 300,
        ),
      ),
    );
  }
}
