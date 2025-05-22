import 'package:beeto_ai/theme/app_colors.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controller/chat_with_beeto_controller.dart';
import '../../helper/helper_functions.dart';
import '../../widget/message_card.dart';

class ChatWithBeeto extends GetView<ChatWithBeetoController> {
  const ChatWithBeeto({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //app bar
      appBar: AppBar(
        title: const Text('Chat with Beeto'),
        centerTitle: true,
      ),

      //send message field & btn
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8),
        child: Row(
          children: [
            //text input field
            Expanded(
              child: TextFormField(
                controller: controller.textController,
                textAlign: TextAlign.center,
                onTapOutside: (e) => FocusScope.of(context).unfocus(),
                decoration: InputDecoration(
                  fillColor: Theme.of(context).scaffoldBackgroundColor,
                  filled: true,
                  isDense: true,
                  hintText: 'Ask me something...',
                  hintStyle: const TextStyle(fontSize: 14),
                  border: const OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(50),
                    ),
                  ),
                ),
              ),
            ),

            const SizedBox(width: 8),

            //send button
            Obx(
              () => CircleAvatar(
                radius: 24,
                backgroundColor: AppColors.primary(context),
                child: IconButton(
                  onPressed: () {
                    controller.isLoading.value
                        ? null
                        : controller.askQuestion();
                  },
                  icon: controller.isLoading.value
                      ? const Icon(
                          Icons.block,
                          color: Colors.white,
                          size: 28,
                        )
                      : const Icon(
                          Icons.rocket_launch,
                          color: Colors.white,
                          size: 28,
                        ),
                ),
              ),
            ),
          ],
        ),
      ),

      //body
      body: Obx(
        () => SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          controller: controller.scrollController,
          padding: EdgeInsets.only(
              top: HelperFunctions.screenHeight(context) * .02,
              bottom: HelperFunctions.screenHeight(context) * .1),
          child: Column(
            children: controller.list
                .map(
                  (message) => MessageCard(message: message),
                )
                .toList(),
          ),
        ),
      ),
    );
  }
}
