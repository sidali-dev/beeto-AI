import 'package:beeto_ai/controller/theme_controller.dart';
import 'package:beeto_ai/helper/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import '../model/home_type.dart';
import '../widget/home_card.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  final ThemeController _themeController = Get.find();

  @override
  Widget build(BuildContext context) {
    //initializing device size
    final screenHeight = HelperFunctions.screenHeight(context);
    final screenWidth = HelperFunctions.screenWidth(context);

    return Scaffold(
      //app bar
      appBar: AppBar(
        title: const Text("Beeto - AI Assistant"),

        //
        actions: [
          IconButton(
            padding: const EdgeInsets.only(right: 10),
            onPressed: () {
              _themeController.switchTheme();
            },
            icon: Obx(
              () => Icon(
                _themeController.isDark.value ? Iconsax.moon5 : Iconsax.sun_1,
              ),
            ),
          ),
        ],
      ),

      //body
      body: ListView(
        padding: EdgeInsets.symmetric(
            horizontal: screenWidth * .04, vertical: screenHeight * .015),
        children: HomeType.values.map((e) => HomeCard(homeType: e)).toList(),
      ),
    );
  }
}
