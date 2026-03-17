import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:xmshop/app/modules/category/views/category_view.dart';
import 'package:xmshop/app/modules/home/views/home_view.dart';

import '../../cart/views/cart_view.dart';
import '../../give/views/give_view.dart';
import '../../user/views/user_view.dart';

class TabsController extends GetxController {
  //TODO: Implement TabsController

  final currentIndex = 4.obs;

  final pages = [
    HomeView(),
    CategoryView(),
    GiveView(),
    CartView(),
    UserView(),
  ];

  final pageController = PageController(initialPage: 0);

  final currentPage = const HomeView().obs;
  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void changeTabIndex(int index) {
    currentIndex.value = index;
    pageController.jumpToPage(index);
    update();
  }
}
