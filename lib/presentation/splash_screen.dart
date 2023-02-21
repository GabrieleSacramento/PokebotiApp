import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';

class SplashScreenPage extends StatelessWidget {
  const SplashScreenPage({super.key});

  @override
  Widget build(BuildContext context) {
    Timer(
      const Duration(seconds: 3),
      () => Navigator.pushReplacementNamed(context, '/pokemon-page'),
    );
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage(
            "assets/images/splash_bg.png",
          ),
          fit: BoxFit.cover,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(30.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: Image.asset(
                "assets/images/pokemon_logo.png",
                fit: BoxFit.contain,
              ),
            ),
            SizedBox(
              height: 10.h,
            ),
            Lottie.network(
              'https://assets1.lottiefiles.com/packages/lf20_iwmd6pyr.json',
              width: 45.r,
              height: 45.r,
            ),
          ],
        ),
      ),
    );
  }
}
