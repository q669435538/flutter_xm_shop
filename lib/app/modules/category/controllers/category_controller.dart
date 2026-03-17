import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CategoryController extends GetxController
    with GetTickerProviderStateMixin {
  //TODO: Implement CategoryController

  final count = 0.obs;
  late TabController _tabController;

  TabController get tabController => _tabController;

  @override
  void onInit() {
    super.onInit();
    _tabController = TabController(
      length: 10, // 分类标签数量
      vsync: this,
    );
  }

  @override
  void onClose() {
    _tabController.dispose();
    super.onClose();
  }

  void increment() => count.value++;
}
