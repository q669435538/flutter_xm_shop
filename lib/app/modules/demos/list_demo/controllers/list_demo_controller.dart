import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:english_words/english_words.dart';

class ListDemoController extends GetxController {
  final loadingText = '正在加载中...';
  final words = <String>[].obs;

  final loading = false.obs;
  final showBackTop = false.obs;
  final scrollController = ScrollController();

  @override
  onInit() {
    super.onInit();
    print("list controller init");
    words.add(loadingText);
    loadMoreWords();
    scrollController.addListener(_onScroll);
  }

  void _onScroll() {
    if (scrollController.offset >= 200) {
      if (!showBackTop.value) showBackTop.value = true;
    } else {
      if (showBackTop.value) showBackTop.value = false;
    }
  }

  void scrollToTop() {
    scrollController.animateTo(
      0,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeOut,
    );
  }

  @override
  void onClose() {
    scrollController.removeListener(_onScroll);
    scrollController.dispose();
    super.onClose();
  }

  loadMoreWords() {
    loading.value = true;
    Future.delayed(Duration(seconds: 2), () {
      words.removeAt(0);
      words.addAll(nouns.take(20).toList());
      loading.value = false;
    });
  }
}
