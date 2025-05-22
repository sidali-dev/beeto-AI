import 'package:beeto_ai/helper/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controller/translate_controller.dart';

class LanguageSheet extends StatelessWidget {
  final TranslateWithBeetoController controller;
  final RxString selectedLanguage;
  final RxString search = ''.obs;

  LanguageSheet({
    required this.controller,
    required this.selectedLanguage,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final screenWidth = HelperFunctions.screenWidth(context);
    final screenHeight = HelperFunctions.screenHeight(context);

    return Container(
      height: screenHeight * .5,
      padding: EdgeInsets.only(
          left: screenWidth * .04,
          right: screenWidth * .04,
          top: screenHeight * .02),
      decoration: BoxDecoration(
        color: Theme.of(context).scaffoldBackgroundColor,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(15),
          topRight: Radius.circular(15),
        ),
      ),
      child: Column(
        children: [
          TextFormField(
            onChanged: (s) => search.value = s.toLowerCase(),
            onTapOutside: (e) => FocusScope.of(context).unfocus(),
            decoration: const InputDecoration(
              prefixIcon: Icon(Icons.translate_rounded, color: Colors.blue),
              hintText: 'Search Language...',
              hintStyle: TextStyle(fontSize: 14),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(10),
                ),
              ),
            ),
          ),

          //
          Expanded(
            child: Obx(
              () {
                // Filter the list based on the search input
                final List<String> list = controller.language
                    .where((e) => e.toLowerCase().contains(search.value))
                    .toList();

                return ListView.builder(
                  physics: const BouncingScrollPhysics(),
                  itemCount: list.length,
                  padding: EdgeInsets.only(top: screenHeight * .02, left: 6),
                  itemBuilder: (_, index) {
                    return InkWell(
                      onTap: () {
                        selectedLanguage.value = list[index];
                        Get.back();
                      },
                      child: Padding(
                        padding: EdgeInsets.only(bottom: screenHeight * .02),
                        child: Text(list[index]),
                      ),
                    );
                  },
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
