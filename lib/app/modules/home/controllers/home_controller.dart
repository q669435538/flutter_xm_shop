import 'package:get/get.dart';
import 'package:flutter/material.dart';

class HomeController extends GetxController {
  final scrollController = ScrollController();

  final flag = false.obs;
  final progress = 0.0.obs;
  @override
  void onInit() {
    super.onInit();

    scrollController.addListener(() {
      var offset = scrollController.position.pixels;
      // 计算透明度进度：0-100px 范围内，0为完全半透明，100为完全不透明
      progress.value = (offset / 100).clamp(0.0, 1.0);
      print('====offset: $offset, progress: ${progress.value}');
    });
  }
}
