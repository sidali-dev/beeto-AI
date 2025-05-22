import 'package:beeto_ai/controller/chat_with_beeto_controller.dart';
import 'package:beeto_ai/helper/helper_functions.dart';
import 'package:beeto_ai/theme/app_colors.dart';

import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../model/message.dart';

class MessageCard extends StatelessWidget {
  final Message message;

  const MessageCard({super.key, required this.message});

  @override
  Widget build(BuildContext context) {
    const r = Radius.circular(15);

    final screenWidth = HelperFunctions.screenWidth(context);
    final screenHeight = HelperFunctions.screenHeight(context);
    return message.msgType == MessageType.bot

        //bot
        ? Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(width: 6),
              CircleAvatar(
                // radius: 24,
                child: Image.asset(
                  "assets/images/beeto_head.png",
                  height: 56,
                ),
              ),
              Container(
                constraints: BoxConstraints(
                  maxWidth: screenWidth * .6,
                ),
                margin: EdgeInsets.only(
                  bottom: screenHeight * .02,
                  left: screenWidth * .02,
                ),
                padding: EdgeInsets.symmetric(
                  vertical: screenHeight * .01,
                  horizontal: screenWidth * .02,
                ),
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: r,
                    topRight: r,
                    bottomRight: r,
                  ),
                ),
                child: message.msg.isEmpty
                    ? AnimatedTextKit(
                        animatedTexts: [
                          TypewriterAnimatedText(
                            'Please wait...',
                            textAlign: TextAlign.start,
                          ),
                        ],
                        totalRepeatCount: 1,
                      )
                    : AnimatedTextKit(
                        displayFullTextOnTap: true,
                        animatedTexts: [
                          TypewriterAnimatedText(
                            message.msg,
                            textAlign: TextAlign.start,
                          ),
                        ],
                        onFinished: () {
                          ChatWithBeetoController controller =
                              Get.find<ChatWithBeetoController>();

                          controller.isLoading.value = false;
                        },
                        onTap: () {
                          ChatWithBeetoController controller =
                              Get.find<ChatWithBeetoController>();

                          controller.isLoading.value = false;
                        },
                        totalRepeatCount: 1,
                      ),
              ),
            ],
          )

        //user
        : Row(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //
              Container(
                constraints: BoxConstraints(
                  maxWidth: screenWidth * .6,
                ),
                margin: EdgeInsets.only(
                  bottom: screenHeight * .02,
                  right: screenWidth * .02,
                ),
                padding: EdgeInsets.symmetric(
                  vertical: screenHeight * .01,
                  horizontal: screenWidth * .02,
                ),
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: r,
                    topRight: r,
                    bottomLeft: r,
                  ),
                ),
                child: Text(
                  message.msg,
                  textAlign: TextAlign.start,
                ),
              ),
              CircleAvatar(
                radius: 18,
                child: Icon(
                  Icons.person,
                  color: AppColors.background(context),
                ),
              ),
              const SizedBox(width: 6),
            ],
          );
  }
}
