import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:xmshop/app/modules/category/views/article_list.dart';

import '../controllers/category_controller.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../services/screenAdaptor.dart';

class CategoryView extends GetView<CategoryController> {
  const CategoryView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('CategoryView'),
        centerTitle: true,
        // backgroundColor: Colors.deepOrangeAccent,
        actionsPadding: EdgeInsets.zero,
        bottom: TabBar(
          controller: controller.tabController,
          indicatorColor: Colors.redAccent,
          tabAlignment: TabAlignment.start,
          indicatorPadding: EdgeInsetsGeometry.only(bottom: 4),
          indicatorWeight: 4,
          isScrollable: true,
          labelColor: Colors.red,
          unselectedLabelColor: Colors.grey.shade600,
          // indicator: BoxDecoration(
          //   borderRadius: BorderRadius.circular(20.w),
          //   color: Colors.orange,
          // ),
          tabs: [
            Tab(
              child: Text(
                '关注',
                style: TextStyle(fontSize: ScreenAdaptor.fontSize(36)),
              ),
            ),
            Tab(
              child: Text(
                '推荐',
                style: TextStyle(fontSize: ScreenAdaptor.fontSize(36)),
              ),
            ),
            Tab(
              child: Text(
                '社会',
                style: TextStyle(fontSize: ScreenAdaptor.fontSize(36)),
              ),
            ),
            Tab(
              child: Text(
                '娱乐',
                style: TextStyle(fontSize: ScreenAdaptor.fontSize(36)),
              ),
            ),
            Tab(
              child: Text(
                '体育',
                style: TextStyle(fontSize: ScreenAdaptor.fontSize(36)),
              ),
            ),
            Tab(
              child: Text(
                '科技',
                style: TextStyle(fontSize: ScreenAdaptor.fontSize(36)),
              ),
            ),
            Tab(
              child: Text(
                '汽车',
                style: TextStyle(fontSize: ScreenAdaptor.fontSize(36)),
              ),
            ),
            Tab(
              child: Text(
                '财经',
                style: TextStyle(fontSize: ScreenAdaptor.fontSize(36)),
              ),
            ),
            Tab(
              child: Text(
                '军事',
                style: TextStyle(fontSize: ScreenAdaptor.fontSize(36)),
              ),
            ),
            Tab(
              child: Text(
                '国际',
                style: TextStyle(fontSize: ScreenAdaptor.fontSize(36)),
              ),
            ),
          ],
        ),
        actions: [
          IconButton(
            onPressed: () {
              print("====Search");
            },
            // color: Colors.white,
            icon: Icon(Icons.search),
          ),
          IconButton(
            onPressed: () {
              print("====More");
            },
            // color: Colors.white,
            icon: Icon(Icons.more_horiz),
          ),
        ],
        leading: IconButton(
          onPressed: () {
            print("====Menu");
          },
          // color: Colors.white,
          icon: Icon(Icons.menu),
        ),
      ),
      body: TabBarView(
        controller: controller.tabController,
        children: [
          Container(
            color: Colors.blue.shade200,
            child: Column(
              //测试Row对齐方式，排除Column默认居中对齐的干扰
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(" hello world "),
                    Text(" I am Jack "),
                  ],
                ),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(" hello world "),
                    Text(" I am Jack "),
                  ],
                ),
                Container(
                  color: Colors.amber,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    textDirection: TextDirection.rtl,
                    children: <Widget>[
                      Text(" hello world "),
                      Text(" I am Jack "),
                    ],
                  ),
                ),
                Row(
                  // mainAxisAlignment: MainAxisAlignment.end,
                  textDirection: TextDirection.rtl,
                  children: <Widget>[
                    Text(" hello world "),
                    Text(" I am Jack "),
                  ],
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  // textBaseline: TextBaseline.alphabetic,
                  // verticalDirection: VerticalDirection.up,
                  children: <Widget>[
                    Text(" hello world ", style: TextStyle(fontSize: 30.0)),
                    Text(" I am Jack "),
                  ],
                ),
              ],
            ),
          ),
          SingleChildScrollView(
            child: Container(
              color: Colors.cyanAccent,
              child: SizedBox(
                width: double.infinity,
                height: 100,
                child: Flex(
                  spacing: 100,
                  direction: Axis.horizontal,
                  children: [
                    Expanded(child: Container(color: Colors.amberAccent)),
                    Expanded(child: Container(color: Colors.blueAccent)),
                  ],
                ),
              ),
            ),
          ),
          ArticleList(),
          Center(child: Text('娱乐 Tab 内容')),
          Center(child: Text('体育 Tab 内容')),
          Center(child: Text('科技 Tab 内容')),
          Center(child: Text('汽车 Tab 内容')),
          Center(child: Text('财经 Tab 内容')),
          Center(child: Text('军事 Tab 内容')),
          Center(child: Text('国际 Tab 内容')),
        ],
      ),
    );
  }
}
