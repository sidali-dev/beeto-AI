import 'package:beeto_ai/routes/app_routes.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class SplashScreenController extends GetxController {
  @override
  void onInit() {
    super.onInit();
    _navigateToNextScreen();
  }

  void _navigateToNextScreen() {
    Future.delayed(
      const Duration(seconds: 3),
      () {
        GetStorage box = GetStorage();
        final bool isOld = box.read("onboarding") ?? false;
        if (isOld) {
          Get.offAndToNamed(Routes.HOME);
        } else {
          Get.offAndToNamed(Routes.ONBOARDING);
        }
      },
    );
  }
}
