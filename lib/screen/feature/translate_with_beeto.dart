import 'package:beeto_ai/helper/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:beeto_ai/const/enums.dart';

import '../../controller/translate_controller.dart';
import '../../widget/language_sheet.dart';

class TranslateWithBeeto extends GetView<TranslateWithBeetoController> {
  const TranslateWithBeeto({super.key});

  @override
  Widget build(BuildContext context) {
    final screenHeight = HelperFunctions.screenHeight(context);
    final screenWidth = HelperFunctions.screenWidth(context);

    return Scaffold(
      //app bar
      appBar: AppBar(
        title: const Text('Translate with Beeto'),
        centerTitle: true,
      ),

      //body
      body: ListView(
        physics: const BouncingScrollPhysics(),
        padding:
            EdgeInsets.only(top: screenHeight * .02, bottom: screenHeight * .1),
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              //from language
              InkWell(
                onTap: () => Get.bottomSheet(
                  LanguageSheet(
                      controller: controller,
                      selectedLanguage: controller.textFrom),
                ),
                borderRadius: const BorderRadius.all(
                  Radius.circular(15),
                ),
                child: Container(
                  height: 50,
                  width: screenWidth * .4,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.blue),
                    borderRadius: const BorderRadius.all(
                      Radius.circular(15),
                    ),
                  ),
                  child: Obx(
                    () => Text(controller.textFrom.isEmpty
                        ? 'Auto'
                        : controller.textFrom.value),
                  ),
                ),
              ),

              //swipe language btn
              IconButton(
                onPressed: controller.swapLanguages,
                icon: Obx(
                  () => Icon(
                    Iconsax.repeat,
                    color: controller.textTo.isNotEmpty &&
                            controller.textFrom.isNotEmpty
                        ? Colors.blue
                        : Colors.grey,
                  ),
                ),
              ),

              //to language
              InkWell(
                onTap: () => Get.bottomSheet(
                  LanguageSheet(
                      controller: controller,
                      selectedLanguage: controller.textTo),
                ),
                borderRadius: const BorderRadius.all(
                  Radius.circular(15),
                ),
                child: Container(
                  height: 50,
                  width: screenWidth * .4,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.blue),
                    borderRadius: const BorderRadius.all(
                      Radius.circular(15),
                    ),
                  ),
                  child: Obx(
                    () => Text(controller.textTo.isEmpty
                        ? 'To'
                        : controller.textTo.value),
                  ),
                ),
              ),
            ],
          ),

          //text field
          Padding(
            padding: EdgeInsets.symmetric(
                horizontal: screenWidth * .04, vertical: screenHeight * .035),
            child: TextFormField(
              controller: controller.textFromController,
              minLines: 5,
              maxLines: null,
              onTapOutside: (e) => FocusScope.of(context).unfocus(),
              decoration: const InputDecoration(
                hintText: 'Translate anything you want...',
                hintStyle: TextStyle(fontSize: 13.5),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(10),
                  ),
                ),
              ),
            ),
          ),

          //result field
          Obx(() => _translateResult(context, screenWidth)),

          //for adding some space
          SizedBox(height: screenHeight * .04),

          //translate btn

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: ElevatedButton(
              onPressed: controller.googleTranslate,
              child: const Text(
                'TRANSLATE',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget _translateResult(BuildContext context, double screenWidth) =>
      switch (controller.status.value) {
        Status.none => const SizedBox(),
        Status.complete => Padding(
            padding: EdgeInsets.symmetric(horizontal: screenWidth * .04),
            child: TextFormField(
              controller: controller.textToController,
              maxLines: null,
              onTapOutside: (e) => FocusScope.of(context).unfocus(),
              decoration: const InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(10),
                  ),
                ),
              ),
            ),
          ),
        Status.loading => const Center(
            child: CircularProgressIndicator(),
          )
      };
}
