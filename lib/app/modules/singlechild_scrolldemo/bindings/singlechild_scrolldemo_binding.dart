import 'package:get/get.dart';

import '../controllers/singlechild_scrolldemo_controller.dart';

class SinglechildScrolldemoBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SinglechildScrolldemoController>(
      () => SinglechildScrolldemoController(),
    );
  }
}
