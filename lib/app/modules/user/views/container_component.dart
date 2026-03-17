import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:xmshop/app/routes/app_pages.dart';

class ContainerComponent extends StatelessWidget {
  const ContainerComponent({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.only(left: 16, right: 16),
      children: [
        Padding(
          padding: EdgeInsetsGeometry.fromLTRB(0, 16, 8, 16),
          child: Align(
            alignment: Alignment.topLeft,
            child: Container(
              // color: Colors.lightBlue,
              // alignment: AlignmentGeometry.directional(0, 40),
              padding: EdgeInsets.fromLTRB(40, 20, 40, 20),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadiusGeometry.only(
                  topLeft: Radius.circular(4),
                  topRight: Radius.circular(10),
                  bottomLeft: Radius.circular(20),
                  bottomRight: Radius.circular(40),
                ),
              ),
              child: ShaderMask(
                shaderCallback: (Rect bounds) {
                  return LinearGradient(
                    colors: [
                      Colors.red,
                      Colors.orange,
                      Colors.yellow,
                      Colors.green,
                      Colors.cyan,
                      Colors.blue,
                      Colors.purple,
                    ],
                  ).createShader(bounds);
                },
                blendMode: BlendMode.srcIn,
                child: Text(
                  "Padding组件",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),
        ),
        GestureDetector(
          onTap: () {
            Get.toNamed(Routes.SINGLECHILD_SCROLLDEMO);
          },
          child: DecoratedBox(
            decoration: BoxDecoration(
              color: Colors.white,
              gradient: LinearGradient(
                begin: Alignment.bottomLeft,
                end: Alignment.topRight,
                colors: [
                  Colors.red,
                  Colors.orange,
                  Colors.yellow,
                  Colors.green,
                  Colors.cyan,
                  Colors.blue,
                  Colors.purple,
                ],
              ),
              borderRadius: BorderRadius.circular(20),
            ),
            // decoration: BoxDecoration(
            //   color: Colors.white,
            //   image: DecorationImage(
            //     image: NetworkImage(
            //       'https://preview.qiantucdn.com/58pic/54/50/07/61358PICIJ5SeXrp32N42_PIC2018_png_aiys_PIC2018.jpg!qt_h320_webp',
            //     ),
            //     fit: BoxFit.cover,
            //   ),
            // ),
            child: ShaderMask(
              shaderCallback: (Rect bounds) {
                return LinearGradient(
                  colors: [
                    Colors.red,
                    Colors.orange,
                    Colors.yellow,
                    Colors.green,
                    Colors.cyan,
                    Colors.blue,
                    Colors.purple,
                  ].reversed.toList(),
                ).createShader(bounds);
              },
              blendMode: BlendMode.srcIn,
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 16, vertical: 60),
                child: Text(
                  "DecoratedBox组件",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 30,
                    decoration: TextDecoration.lineThrough,
                    decorationStyle: TextDecorationStyle.solid,
                    decorationColor: Colors.red,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
