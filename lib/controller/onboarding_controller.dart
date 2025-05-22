import 'package:beeto_ai/model/onboard.dart';
import 'package:beeto_ai/routes/app_routes.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class OnboardingController extends GetxController {
  late final PageController pageController;
  final currentPage = 0.obs;

  final List<Onboard> onboardList = [
    Onboard(
        title: "Talk with Beeto",
        subtitle:
            "Get instant answers, thoughtful conversations, and friendly support anytime you need it.",
        imagePath: "assets/images/beeto_waving.png"),
    Onboard(
        title: "Draw with Beeto",
        subtitle:
            "Sketch ideas, create art, or bring your imagination to life justing using your words.",
        imagePath: "assets/images/beeto_drawing.png"),
    Onboard(
        title: "Translate with Beeto",
        subtitle:
            "Break language barriers effortlessly and understand and be understood in any language.",
        imagePath: "assets/images/beeto_translating.png"),
  ];

  @override
  void onInit() {
    pageController = PageController();
    super.onInit();
  }

  void onPageChanged(int index) {
    currentPage.value = index;
  }

  bool isLastPage() {
    return currentPage.value == onboardList.length - 1;
  }

  void goToNextPage() {
    if (currentPage.value < onboardList.length - 1) {
      pageController.nextPage(
          duration: const Duration(milliseconds: 300), curve: Curves.easeIn);
    } else {
      GetStorage box = GetStorage();
      box.write('onboarding', true);
      Get.offAndToNamed(Routes.HOME);
    }
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }
}
