import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:shopping_api/Views/homepage.dart';
import 'package:lottie/lottie.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
        splash: Column(
          children: [
            Expanded(
              child: Lottie.asset(
                'assets/Animation - 1700393101947.json',
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(
              height: 140,
            ),
            const Text(
              'Powered by Moavia Chail',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            )
          ],
        ),
        splashIconSize: 400,
        duration: 4500,
        // splashTransition: SplashTransition.rotationTransition,
        nextScreen: const HomePage());
  }
}
