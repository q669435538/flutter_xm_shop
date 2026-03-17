import 'package:get/get.dart';

import '../modules/demos/list_demo/bindings/list_demo_binding.dart';
import '../modules/demos/list_demo/views/list_demo_view.dart';
import '../modules/singlechild_scrolldemo/bindings/singlechild_scrolldemo_binding.dart';
import '../modules/singlechild_scrolldemo/views/singlechild_scrolldemo_view.dart';
import '../modules/tabs/bindings/tabs_binding.dart';
import '../modules/tabs/views/tabs_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.TABS;

  static final routes = [
    GetPage(
      name: _Paths.TABS,
      page: () => const TabsView(),
      binding: TabsBinding(),
    ),
    GetPage(
      name: _Paths.SINGLECHILD_SCROLLDEMO,
      page: () => const SinglechildScrolldemoView(),
      binding: SinglechildScrolldemoBinding(),
    ),
    GetPage(
      name: _Paths.LIST_DEMO,
      page: () => const ListDemoView(),
      binding: ListDemoBinding(),
    ),
  ];
}
