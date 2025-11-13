import 'dart:async';
import 'package:get/get.dart';

class HomeController extends GetxController {
  RxBool isMenuOpen = false.obs;
  RxInt selectedCategory = 0.obs;
  RxBool showFilter = true.obs;
  Timer? _menuTimer;

  void selectCategory(int index) {
    selectedCategory.value = index;
  }

  Future<void> toggleMenu(bool open) async {
    // cancel any pending timer
    _menuTimer?.cancel();
    if (open) {
      // opening menu: hide filter immediately, scroll list to top first
      showFilter.value = false;
      isMenuOpen.value = true;
    } else {
      // closing menu: set menu closed then show filter after animation finishes
      isMenuOpen.value = false;
      _menuTimer = Timer(const Duration(milliseconds: 320), () {
        showFilter.value = true;
      });
    }
  }

  @override
  void onClose() {
    _menuTimer?.cancel();
    super.onClose();
  }
}
