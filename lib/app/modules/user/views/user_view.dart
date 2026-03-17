import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:xmshop/app/modules/demos/list_demo/bindings/list_demo_binding.dart';
import 'package:xmshop/app/modules/demos/list_demo/views/custom_component_demo_view.dart';
import 'package:xmshop/app/modules/demos/list_demo/views/list_demo_view.dart';
import 'package:xmshop/app/modules/demos/list_demo/views/listner_demo_view.dart';
import 'package:xmshop/app/modules/user/views/container_component.dart';
import 'package:xmshop/app/services/keepalive_wrapper.dart';

import '../controllers/user_controller.dart';

class UserView extends GetView<UserController> {
  const UserView({super.key});
  @override
  Widget build(BuildContext context) {
    // 注册 ListDemoController
    // ListDemoBinding().dependencies();

    return Scaffold(
      appBar: AppBar(title: const Text('UserView'), centerTitle: true),
      body: KeepAliveWrapper(child: CustomComponentDemoView()),
    );
  }
}
