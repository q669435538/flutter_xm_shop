import 'package:flutter/material.dart';

import 'package:get/get.dart';

class DialogDemoView extends GetView {
  const DialogDemoView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('DialogDemoView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'DialogDemoView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
