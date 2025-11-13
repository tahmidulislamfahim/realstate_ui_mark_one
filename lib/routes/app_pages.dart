import 'package:get/get.dart';
import 'package:realstate_ui_mark_one/routes/app_routes.dart';
import 'package:realstate_ui_mark_one/features/home/views/home_screen.dart';
import 'package:realstate_ui_mark_one/bindings/home_binding.dart';

class AppPages {
  static final pages = [
    GetPage(
      name: Routes.home,
      page: () => const HomeScreen(),
      binding: HomeBinding(),
    ),
  ];
}
