import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';
import 'package:xmshop/app/services/ityingFonts.dart';
import 'package:xmshop/app/services/keepalive_wrapper.dart';
import 'package:xmshop/app/services/screenAdaptor.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      body: KeepAliveWrapper(
        child: Stack(
          children: [
            ListView.builder(
              padding: EdgeInsets.zero,
              controller: controller.scrollController,
              itemBuilder: (context, index) {
                if (index == 0) {
                  return SizedBox(
                    width: ScreenAdaptor.width(1080),
                    height: ScreenAdaptor.height(682),

                    child: Image.network(
                      'https://www.itying.com/images/focus/focus02.png',
                      fit: BoxFit.cover,
                    ),
                  );
                }
                return ListTile(title: Text('这是第$index行'));
              },
              itemCount: 20,
            ),
            Positioned(
              top: 0,
              left: 0,
              right: 0,
              child: Obx(() {
                // 使用controller中的可观察变量progress
                double progress = controller.progress.value;

                // 计算透明度逻辑：
                // progress = 0: 透明状态
                // progress = 1: 完全不透明白色 (滚动 >= 100px)

                double searchBoxOpacity;
                double appBarOpacity;
                Color iconColor;
                double leadingScale; // 新增：leading图标缩放比例
                double searchBoxWidth; // 新增：搜索框宽度变量

                if (progress >= 1.0) {
                  // 滚动大于等于100px：完全不透明
                  searchBoxOpacity = 1.0;
                  appBarOpacity = 1.0;
                  iconColor = Colors.black87;
                  leadingScale = 0.0; // 完全缩小
                  searchBoxWidth = ScreenAdaptor.width(720); // 扩展宽度
                } else {
                  // 滚动小于100px：渐变效果
                  searchBoxOpacity = 0.5 + (progress * 0.5);
                  appBarOpacity = progress * 0.95;
                  iconColor =
                      Color.lerp(Colors.white, Colors.black87, progress) ??
                      Colors.white;
                  leadingScale = 1.0 - progress; // 随着progress增加而缩小
                  // 搜索框宽度随透明度变化：从620逐渐扩展到720
                  searchBoxWidth =
                      ScreenAdaptor.width(720) +
                      (ScreenAdaptor.width(100) * progress);
                }

                return AnimatedContainer(
                  duration: Duration(milliseconds: 300),
                  curve: Curves.easeInOut,
                  child: Container(
                    padding: EdgeInsets.only(
                      top: MediaQuery.of(context).padding.top,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.white.withAlpha(
                        (appBarOpacity * 255).toInt(),
                      ),
                      boxShadow: progress > 0.1
                          ? [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.1),
                                offset: Offset(0, 2),
                                blurRadius: 4,
                              ),
                            ]
                          : null,
                    ),
                    child: AppBar(
                      primary: false,
                      title: AnimatedContainer(
                        duration: Duration(milliseconds: 300),
                        curve: Curves.linear,
                        // 使用动态计算的搜索框宽度
                        width: searchBoxWidth,
                        height: ScreenAdaptor.height(96),
                        decoration: BoxDecoration(
                          color: Colors.white.withAlpha(
                            (searchBoxOpacity * 255).toInt(),
                          ),
                          borderRadius: BorderRadius.circular(48.r),
                        ),
                        child: GestureDetector(
                          onTap: () {
                            // TODO: 处理搜索点击事件
                          },
                          child: Row(
                            children: [
                              SizedBox(width: ScreenAdaptor.width(30)),
                              Icon(ItyingFonts.fangdajing, color: Colors.grey),
                              SizedBox(width: ScreenAdaptor.width(20)),
                              Expanded(
                                child: Text(
                                  '搜索商品',
                                  style: TextStyle(
                                    color: Colors.grey,
                                    fontSize: ScreenAdaptor.fontSize(32),
                                  ),
                                ),
                              ),
                              Icon(ItyingFonts.saoyisao, color: Colors.grey),
                              SizedBox(width: ScreenAdaptor.width(30)),
                            ],
                          ),
                        ),
                      ),
                      // 设置透明
                      backgroundColor: Colors.transparent,
                      // 设置悬浮
                      elevation: 0,
                      // 添加动画缩放的leading图标
                      leading: AnimatedScale(
                        scale: leadingScale,
                        duration: Duration(milliseconds: 300),
                        curve: Curves.easeInOut,
                        child: leadingScale > 0.1
                            ? Padding(
                                padding: EdgeInsets.only(
                                  left: ScreenAdaptor.width(20),
                                ),
                                child: Icon(
                                  ItyingFonts.xiaomi1,
                                  color: iconColor,
                                ),
                              )
                            : SizedBox.shrink(), // 当缩放很小时完全隐藏
                      ),
                      // 动态调整leading宽度
                      leadingWidth: leadingScale > 0.1 ? 56.w : 0,
                      actions: [
                        // 为actions中的图标也添加动画效果
                        AnimatedScale(
                          scale:
                              0.8 + (0.2 * (1 - progress)), // 反向缩放：透明时大，不透明时稍小
                          duration: Duration(milliseconds: 300),
                          curve: Curves.easeInOut,
                          child: IconButton(
                            icon: Icon(ItyingFonts.qrcode, color: iconColor),
                            onPressed: () {
                              // 处理搜索按钮点击事件
                            },
                          ),
                        ),
                        AnimatedScale(
                          scale:
                              0.8 + (0.2 * (1 - progress)), // 反向缩放：透明时大，不透明时稍小
                          duration: Duration(milliseconds: 300),
                          curve: Curves.easeInOut,
                          child: IconButton(
                            icon: Icon(ItyingFonts.xiaoxi, color: iconColor),
                            onPressed: () {
                              // 处理更多按钮点击事件
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              }),
            ),
          ],
        ),
      ),
    );
  }
}
