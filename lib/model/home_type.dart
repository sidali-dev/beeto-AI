import 'package:beeto_ai/routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

enum HomeType { aiChatBot, aiImage, aiTranslator }

extension MyHomeType on HomeType {
  //title
  String get title => switch (this) {
        HomeType.aiChatBot => 'Chat with Beeto',
        HomeType.aiImage => 'Draw with Beeto',
        HomeType.aiTranslator => 'Translate with Beeto',
      };

  //lottie
  String get image => switch (this) {
        HomeType.aiChatBot => 'beeto_waving.png',
        HomeType.aiImage => 'beeto_drawing.png',
        HomeType.aiTranslator => 'beeto_translating.png',
      };

  //for alignment
  bool get leftAlign => switch (this) {
        HomeType.aiChatBot => true,
        HomeType.aiImage => false,
        HomeType.aiTranslator => true,
      };

  //for padding
  EdgeInsets get padding => switch (this) {
        HomeType.aiChatBot => const EdgeInsets.only(left: 16),
        HomeType.aiImage => const EdgeInsets.only(right: 16),
        HomeType.aiTranslator => const EdgeInsets.only(left: 16),
      };

  //for navigation
  VoidCallback get onTap => switch (this) {
        HomeType.aiChatBot => () => Get.toNamed(Routes.CHAT_WITH_BEETO),
        HomeType.aiImage => () => Get.toNamed(Routes.DRAW_WITH_BEETO),
        HomeType.aiTranslator => () => Get.toNamed(Routes.TRANSLATE_WITH_BEETO),
      };
}
