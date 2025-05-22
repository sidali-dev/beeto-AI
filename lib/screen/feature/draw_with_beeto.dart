import 'package:beeto_ai/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controller/draw_with_beeto_controller.dart';
import '../../helper/helper_functions.dart';

class DrawWithBeeto extends GetView<DrawWithBeetoController> {
  const DrawWithBeeto({super.key});

  @override
  Widget build(BuildContext context) {
    final screenHeight = HelperFunctions.screenHeight(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Draw with Beeto'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            // Prompt Field
            TextField(
              controller: controller.promptController,
              textAlign: TextAlign.center,
              onTapOutside: (e) => FocusScope.of(context).unfocus(),
              decoration: InputDecoration(
                fillColor: Theme.of(context).scaffoldBackgroundColor,
                filled: true,
                isDense: true,
                hintText: 'Describe what you want Beeto to draw',
                hintStyle: const TextStyle(fontSize: 14),
                border: const OutlineInputBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(50),
                  ),
                ),
              ),
            ),

            // Space
            const SizedBox(height: 25),

            // Generate Image Button
            Obx(
              () => controller.isLoading.value
                  ? const Center(child: CircularProgressIndicator())
                  : ElevatedButton.icon(
                      icon: const Icon(Icons.brush, color: Colors.white),
                      label: const Text('Generate Image'),
                      onPressed: controller.generateImage,
                    ),
            ),
            const SizedBox(height: 25),

            // Status Text Message
            Obx(
              () => Text(
                controller.statusMessage.value,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 16,
                  color: AppColors.textPrimary(context),
                ),
              ),
            ),
            const SizedBox(height: 25),

            // Image Display Area
            Obx(
              () {
                final currentDisplayIdx =
                    controller.currentImageDisplayIndex.value;
                final isDownloaded = controller.downloadedImageIndices
                    .contains(currentDisplayIdx);
                final isDownloadingImage = controller.isDownloading.value;
                if (controller.imageData.value != null) {
                  return Card(
                    clipBehavior: Clip.antiAlias,
                    child: Stack(
                      children: [
                        Image.memory(
                          controller.imageData.value!,
                          fit: BoxFit.contain,
                          errorBuilder: (context, error, stackTrace) =>
                              const Center(
                            child: Padding(
                              padding: EdgeInsets.all(16.0),
                              child: Text(
                                'Error loading image data',
                                style: TextStyle(color: Colors.redAccent),
                              ),
                            ),
                          ),
                        ),
                        Positioned(
                          top: 8,
                          right: 8,
                          child: CircleAvatar(
                            child: isDownloadingImage && currentDisplayIdx != -1
                                ? const SizedBox(
                                    width: 24,
                                    height: 24,
                                    child: CircularProgressIndicator(
                                      strokeWidth: 2,
                                      color: Colors.white,
                                    ),
                                  )
                                : IconButton(
                                    onPressed: controller.downloadCurrentImage,
                                    icon: Icon(
                                      isDownloaded
                                          ? Icons.check_circle
                                          : Icons.file_download_outlined,
                                      color: AppColors.textPrimary(context),
                                    ),
                                    tooltip: isDownloaded
                                        ? "Downloaded"
                                        : "Download Image",
                                  ),
                          ),
                        ),
                      ],
                    ),
                  );
                } else if (controller.isLoading.value) {
                  return Image.asset(
                    "assets/images/beeto_loading.png",
                    height: screenHeight * .3,
                  );
                } else if (controller.isError.value) {
                  return Image.asset(
                    "assets/images/beeto_drawing_failed.png",
                    height: screenHeight * .3,
                  );
                } else {
                  return Image.asset(
                    "assets/images/beeto_drawing.png",
                    height: screenHeight * .3,
                  );
                }
              },
            ),

            // Space
            const SizedBox(height: 24),

            // Generated Images List
            Obx(
              () => controller.imageList.isNotEmpty
                  ? SizedBox(
                      height: 128,
                      child: ListView.builder(
                        shrinkWrap: true,
                        physics: const BouncingScrollPhysics(),
                        scrollDirection: Axis.horizontal,
                        itemCount: controller.imageList.length,
                        itemBuilder: (context, index) {
                          return GestureDetector(
                            onTap: () => controller.changeSelectedImage(index),
                            child: Card(
                              clipBehavior: Clip.antiAlias,
                              child: Image.memory(
                                controller.imageList[index],
                                fit: BoxFit.cover,
                                errorBuilder: (context, error, stackTrace) =>
                                    //Replace with error placeholder
                                    Image.asset(
                                  "assets/images/beeto_drawing_failed.png",
                                  height: 100,
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    )
                  : const SizedBox.shrink(),
            ),
          ],
        ),
      ),
    );
  }
}
