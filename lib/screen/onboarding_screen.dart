import 'package:beeto_ai/controller/onboarding_controller.dart';
import 'package:beeto_ai/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnboardingScreen extends GetView<OnboardingController> {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: PageView.builder(
                controller: controller.pageController,
                itemCount: controller.onboardList.length,
                onPageChanged: controller.onPageChanged,
                itemBuilder: (context, index) => OnBoardingContent(
                  title: controller.onboardList[index].title,
                  description: controller.onboardList[index].subtitle,
                  imagePath: controller.onboardList[index].imagePath,
                ),
              ),
            ),
            Row(
              children: [
                const SizedBox(width: 32),
                SmoothPageIndicator(
                    controller: controller.pageController,
                    count: controller.onboardList.length,
                    effect: JumpingDotEffect(
                      dotHeight: 12,
                      dotWidth: 12,
                      activeDotColor: AppColors.primary(context),
                      dotColor: AppColors.textPrimary(context),
                    ),
                    onDotClicked: (index) {}),
                const Spacer(),
                ElevatedButton(
                  onPressed: () {
                    controller.goToNextPage();
                  },
                  style: ElevatedButton.styleFrom(
                    shape: const CircleBorder(),
                    backgroundColor: AppColors.primary(context),
                    fixedSize: const Size(64, 64),
                    padding: EdgeInsets.zero,
                  ),
                  child: Obx(
                    () => Icon(
                      controller.isLastPage()
                          ? Icons.check
                          : Iconsax.arrow_right_1,
                      size: 32,
                      color: Colors.white,
                    ),
                  ),
                ),
                const SizedBox(width: 32),
              ],
            ),
            const SizedBox(height: 32),
          ],
        ),
      ),
    );
  }
}

class OnBoardingContent extends StatelessWidget {
  final String title;
  final String description;
  final String imagePath;

  const OnBoardingContent({
    super.key,
    required this.title,
    required this.description,
    required this.imagePath,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Spacer(),
        Image.asset(
          imagePath,
          height: 300,
        ),
        const Spacer(),
        Text(
          title,
          textAlign: TextAlign.center,
          style: const TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 8.0, right: 8.0, top: 16.0),
          child: Text(
            description,
            textAlign: TextAlign.center,
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w400),
          ),
        ),
        const Spacer(),
      ],
    );
  }
}
