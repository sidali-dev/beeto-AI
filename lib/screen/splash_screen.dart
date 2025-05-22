import 'package:beeto_ai/controller/splash_screen_controller.dart';
import 'package:beeto_ai/helper/helper_functions.dart';
import 'package:beeto_ai/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:get/get.dart';

class SplashScreen extends GetView<SplashScreenController> {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = HelperFunctions.screenWidth(context);

    return Scaffold(
      //body
      body: Center(
        child: Animate(
          effects: const [
            FadeEffect(
              duration: Duration(milliseconds: 500),
              curve: Curves.easeIn,
            ),
            ScaleEffect(
              duration: Duration(milliseconds: 500),
              curve: Curves.easeIn,
            ),
          ],
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'assets/images/beeto_head.png',
                width: screenWidth * .4,
              ),
              Text(
                'Beeto',
                style: TextStyle(
                  fontSize: screenWidth * .1,
                  fontWeight: FontWeight.w600,
                  color: AppColors.primary(context),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
