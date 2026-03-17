import 'dart:ui' as ui;

import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/give_controller.dart';

class GiveView extends GetView<GiveController> {
  const GiveView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('GiveView'), centerTitle: true),
      body: Center(
        child: CircleAvatar(
          radius: 55,
          backgroundColor: const ui.Color.fromARGB(255, 249, 233, 1),
          child: CircleAvatar(
            radius: 50,
            backgroundImage: NetworkImage(
              'https://preview.qiantucdn.com/58pic/54/50/07/61358PICIJ5SeXrp32N42_PIC2018_png_aiys_PIC2018.jpg!qt_h320_webp',
            ),
            // child: Image.network(
            //   'https://pic.616pic.com/ys_img/00/98/66/Wl0quzCsyB.jpg',
            //   width: 100,
            //   height: 100,
            //   fit: BoxFit.cover,
            // ),
          ),
        ),
      ),
    );
  }
}
