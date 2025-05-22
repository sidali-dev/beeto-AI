import 'package:beeto_ai/helper/helper_functions.dart';
import 'package:beeto_ai/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

import '../model/home_type.dart';

class HomeCard extends StatelessWidget {
  final HomeType homeType;

  const HomeCard({super.key, required this.homeType});

  @override
  Widget build(BuildContext context) {
    Animate.restartOnHotReload = false;

    final screenHeight = HelperFunctions.screenHeight(context);

    return Card(
      color: AppColors.primary(context),
      elevation: 10,
      margin: EdgeInsets.only(bottom: screenHeight * .02),
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(20),
        ),
      ),
      child: InkWell(
        borderRadius: const BorderRadius.all(
          Radius.circular(20),
        ),
        onTap: homeType.onTap,
        child: homeType.leftAlign
            ? Row(
                children: [
                  //lottie
                  Container(
                    height: screenHeight * .16,
                    padding: homeType.padding,
                    child: Image.asset('assets/images/${homeType.image}'),
                  ),

                  const Spacer(),

                  //title
                  Text(
                    homeType.title,
                    style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                        color: Colors.white,
                        letterSpacing: 1),
                  ),

                  const Spacer(flex: 2),
                ],
              )
            : Row(
                children: [
                  const Spacer(flex: 2),

                  //title
                  Text(
                    homeType.title,
                    style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                        color: Colors.white,
                        letterSpacing: 1),
                  ),

                  const Spacer(),

                  //lottie
                  Container(
                    height: screenHeight * .16,
                    padding: homeType.padding,
                    child: Image.asset('assets/images/${homeType.image}'),
                  ),
                ],
              ),
      ),
    ).animate().fade(duration: 1.seconds, curve: Curves.easeIn);
  }
}
