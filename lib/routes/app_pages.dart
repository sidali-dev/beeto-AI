import 'package:beeto_ai/controller/chat_with_beeto_controller.dart';
import 'package:beeto_ai/controller/draw_with_beeto_controller.dart';
import 'package:beeto_ai/controller/onboarding_controller.dart';
import 'package:beeto_ai/controller/splash_screen_controller.dart';
import 'package:beeto_ai/controller/translate_controller.dart';
import 'package:beeto_ai/routes/app_routes.dart';
import 'package:beeto_ai/screen/feature/chat_with_beeto.dart';
import 'package:beeto_ai/screen/feature/draw_with_beeto.dart';
import 'package:beeto_ai/screen/feature/translate_with_beeto.dart';
import 'package:beeto_ai/screen/home_screen.dart';
import 'package:beeto_ai/screen/onboarding_screen.dart';
import 'package:beeto_ai/screen/splash_screen.dart';
import 'package:get/get.dart';

class AppPages {
  // ignore: constant_identifier_names
  static const INITIAL = Routes.SPLASH;

  static final List<GetPage> routes = [
    GetPage(
      name: Routes.SPLASH,
      page: () => const SplashScreen(),
      transition: Transition.fadeIn,
      bindings: [
        BindingsBuilder(
          () {
            Get.put(SplashScreenController());
          },
        ),
      ],
    ),
    GetPage(
      name: Routes.ONBOARDING,
      page: () => const OnboardingScreen(),
      transition: Transition.fadeIn,
      bindings: [
        BindingsBuilder(
          () {
            Get.put(OnboardingController());
          },
        ),
      ],
    ),
    GetPage(
      name: Routes.HOME,
      page: () => HomeScreen(),
      transition: Transition.fadeIn,
    ),
    GetPage(
      name: Routes.CHAT_WITH_BEETO,
      page: () => const ChatWithBeeto(),
      bindings: [
        BindingsBuilder(
          () {
            Get.put(ChatWithBeetoController());
          },
        ),
      ],
      transition: Transition.rightToLeft,
    ),
    GetPage(
      name: Routes.DRAW_WITH_BEETO,
      page: () => const DrawWithBeeto(),
      bindings: [
        BindingsBuilder(
          () {
            Get.put(DrawWithBeetoController());
          },
        ),
      ],
      transition: Transition.rightToLeft,
    ),
    GetPage(
      name: Routes.TRANSLATE_WITH_BEETO,
      page: () => const TranslateWithBeeto(),
      bindings: [
        BindingsBuilder(
          () {
            Get.put(TranslateWithBeetoController());
          },
        ),
      ],
      transition: Transition.rightToLeft,
    ),
  ];
}
