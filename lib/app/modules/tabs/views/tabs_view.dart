import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:xmshop/app/services/screenAdaptor.dart';

import '../../../services/ityingFonts.dart';
import '../controllers/tabs_controller.dart';

class TabsView extends GetView<TabsController> {
  const TabsView({super.key});
  @override
  Widget build(BuildContext context) {
    print(
      '====width: ${ScreenAdaptor.screenWidth}, height: ${ScreenAdaptor.screenHeight}',
    );
    return Obx(() {
      return Scaffold(
        body: PageView(
          controller: controller.pageController,
          children: controller.pages,
          onPageChanged: (value) {
            controller.changeTabIndex(value);
          },

          // physics: const NeverScrollableScrollPhysics(), //禁止滑动
        ),
        bottomNavigationBar: BottomNavigationBar(
          items: const [
            BottomNavigationBarItem(
              icon: Icon(ItyingFonts.xiaomi1),
              label: "首页",
            ),
            BottomNavigationBarItem(
              icon: Icon(ItyingFonts.category),
              label: "分类",
            ),
            BottomNavigationBarItem(icon: Icon(ItyingFonts.fuwu), label: "服务"),
            BottomNavigationBarItem(
              icon: Icon(ItyingFonts.gouwuche),
              label: '购物车',
            ),
            BottomNavigationBarItem(icon: Icon(ItyingFonts.wode), label: '我的'),
          ],
          currentIndex: controller.currentIndex.value,
          type: BottomNavigationBarType.fixed,
          onTap: (index) {
            controller.changeTabIndex(index);
          },
        ),
      );
    });
  }
}
