import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_gallery_saver/image_gallery_saver.dart';

import '../apis/apis.dart';
import '../helper/my_dialog.dart';

//move this to a separate file
enum Status { none, loading, complete }

class DrawWithBeetoController extends GetxController {
  final TextEditingController promptController = TextEditingController();

  final RxString statusMessage = 'Ask Beeto to draw you something'.obs;
  final Rx<Uint8List?> imageData = Rx<Uint8List?>(null);
  final RxList<Uint8List> imageList = <Uint8List>[].obs;
  final RxBool isLoading = false.obs;
  final RxBool isError = false.obs;

  // --- State for Download Functionality ---
  final RxInt currentImageDisplayIndex = (-1).obs;
  final RxSet<int> downloadedImageIndices = <int>{}.obs;
  final RxBool isDownloading = false.obs;

  Future<void> generateImage() async {
    if (promptController.text.isEmpty) {
      MyDialog.error("Please enter a prompt.");
      return;
    }

    isLoading.value = true;
    imageData.value = null;
    statusMessage.value = 'Generating image with Gemini...';

    try {
      imageData.value = await APIs.generateImageFromApi(promptController.text);

      if (imageData.value != null) {
        statusMessage.value = 'Beeto has finished drawing your image!';
        imageList.add(imageData.value!);
        changeSelectedImage(imageList.length - 1);
      } else {
        statusMessage.value =
            'Beeto failed to draw your image, ask him again later.';
        isError.value = true;
      }
    } catch (e) {
      statusMessage.value = 'Something went wrong, please try again.';
      isError.value = true;

      MyDialog.error("Something went wrong");
    } finally {
      isLoading.value = false;
    }
  }

  // --- Change Selected Image from List ---
  void changeSelectedImage(int index) {
    if (index >= 0 && index < imageList.length) {
      imageData.value = imageList[index];
      currentImageDisplayIndex.value = index;
    }
  }

  // --- Download Current Image ---
  Future<void> downloadCurrentImage() async {
    if (imageData.value == null) {
      MyDialog.error("No image is currently displayed to download.");

      return;
    }
    if (currentImageDisplayIndex.value == -1) {
      MyDialog.error("Cannot determine which image to download.");

      return;
    }

    if (downloadedImageIndices.contains(currentImageDisplayIndex.value)) {
      MyDialog.info("Already Downloaded.");
      return;
    }

    isDownloading.value = true;
    try {
      final result = await ImageGallerySaver.saveImage(imageData.value!,
          quality: 90,
          name: "beeto_images_${DateTime.now().millisecondsSinceEpoch}");

      if (result != null && result['isSuccess'] == true) {
        downloadedImageIndices.add(currentImageDisplayIndex.value);
        MyDialog.success("Image saved to gallery.");
      } else {
        MyDialog.error("Download Failed.");
      }
    } catch (e) {
      MyDialog.error("An error occurred while saving.");
    } finally {
      isDownloading.value = false;
    }
  }

  @override
  void onClose() {
    promptController.dispose();
    super.onClose();
  }
}
