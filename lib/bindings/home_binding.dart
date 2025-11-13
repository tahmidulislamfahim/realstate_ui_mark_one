import 'package:get/get.dart';
import 'package:realstate_ui_mark_one/features/home/controllers/home_controller.dart';
import 'package:realstate_ui_mark_one/features/home/controllers/properties_controller.dart';
import 'package:realstate_ui_mark_one/features/home/controllers/featured_controller.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HomeController>(() => HomeController());
    Get.lazyPut<PropertiesController>(() => PropertiesController());
    Get.lazyPut<FeaturedController>(() => FeaturedController());
  }
}
