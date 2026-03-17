import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/singlechild_scrolldemo_controller.dart';

class SinglechildScrolldemoView
    extends GetView<SinglechildScrolldemoController> {
  const SinglechildScrolldemoView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('SinglechildScrolldemoView'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: List.generate(
            20,
            (index) => ListTile(title: Text('这是第$index行')),
          ),
        ),
      ),
    );
  }
}
