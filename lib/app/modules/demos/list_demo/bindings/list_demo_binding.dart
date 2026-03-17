import 'package:get/get.dart';

import '../controllers/list_demo_controller.dart';

class ListDemoBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ListDemoController>(
      () => ListDemoController(),
    );
  }
}
