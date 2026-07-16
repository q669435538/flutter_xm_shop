import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:xmshop/app/modules/demos/web_hybrid/views/web_hybrid_demo_view.dart';
import 'package:xmshop/app/services/keepalive_wrapper.dart';

import '../controllers/user_controller.dart';

class UserView extends GetView<UserController> {
  const UserView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Web 混合开发演示'), centerTitle: true),
      body: const KeepAliveWrapper(child: WebHybridDemoView()),
    );
  }
}
