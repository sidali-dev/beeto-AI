import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../apis/apis.dart';
import '../helper/my_dialog.dart';
import '../model/message.dart';

class ChatWithBeetoController extends GetxController {
  final textController = TextEditingController();

  final scrollController = ScrollController();

  final RxBool isLoading = false.obs;

  final RxList<Message> list = <Message>[
    Message(msg: 'Hello, How can I help you?', msgType: MessageType.bot)
  ].obs;

  Future<void> askQuestion() async {
    isLoading.value = true;
    if (textController.text.trim().isNotEmpty) {
      //user
      list.add(Message(msg: textController.text, msgType: MessageType.user));
      list.add(Message(msg: "", msgType: MessageType.bot));

      _scrollDown();

      final res = await APIs.getAnswer(textController.text);

      //ai bot
      list.removeLast();
      await Future.delayed(100.milliseconds);
      list.add(Message(msg: res, msgType: MessageType.bot));
      _scrollDown();

      textController.text = '';
    } else {
      MyDialog.info('Ask Something!');
    }
  }

  //for moving to end message
  void _scrollDown() {
    scrollController.animateTo(scrollController.position.maxScrollExtent,
        duration: const Duration(milliseconds: 500), curve: Curves.ease);
  }
}
