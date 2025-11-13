import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:realstate_ui_mark_one/features/home/widgets/app_bar_section.dart';
import 'package:realstate_ui_mark_one/features/home/widgets/best_houses.dart';
import 'package:realstate_ui_mark_one/features/home/widgets/categories_section.dart';
import 'package:realstate_ui_mark_one/features/home/widgets/nearby_houses.dart';
import 'package:realstate_ui_mark_one/features/home/widgets/search_and_filter.dart';
import 'package:realstate_ui_mark_one/features/menu/views/menu_screen.dart';
import 'package:realstate_ui_mark_one/features/home/controllers/home_controller.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<HomeController>();
    double screenWidth = MediaQuery.of(context).size.width;

    return GestureDetector(
      onHorizontalDragUpdate: (details) {
        if (details.delta.dx > 10) controller.toggleMenu(true);
        if (details.delta.dx < -10) controller.toggleMenu(false);
      },
      child: Obx(() {
        return Stack(
          children: [
            // Sidebar
            const MenuScreen(),

            // Home content
            AnimatedPositioned(
              duration: const Duration(milliseconds: 300),
              left: controller.isMenuOpen.value ? screenWidth * 0.5 : 0,
              top: controller.isMenuOpen.value ? 60 : 0,
              right: controller.isMenuOpen.value ? -screenWidth * 0.3 : 0,
              bottom: controller.isMenuOpen.value ? 60 : 0,
              child: AbsorbPointer(
                absorbing: controller.isMenuOpen.value,
                child: AnimatedScale(
                  scale: controller.isMenuOpen.value ? 0.85 : 1,
                  duration: const Duration(milliseconds: 300),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(
                      controller.isMenuOpen.value ? 20 : 0,
                    ),
                    child: Scaffold(
                      backgroundColor: Colors.white,
                      body: SafeArea(
                        child: Padding(
                          padding: const EdgeInsets.all(20),
                          child: SingleChildScrollView(
                            physics: const BouncingScrollPhysics(),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                AppBarSection(),
                                const SizedBox(height: 25),
                                const SearchAndFilter(),
                                const SizedBox(height: 30),
                                CategoriesSection(controller: controller),
                                const SizedBox(height: 30),
                                const Text(
                                  'Near from you',
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                const SizedBox(height: 15),
                                // Fixed height for scrollable list
                                SizedBox(
                                  height: 200, // adjust height as needed
                                  child: NearbyHouses(),
                                ),
                                const SizedBox(height: 25),
                                const Text(
                                  'Best for you',
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                const SizedBox(height: 15),
                                BestHouses(),
                                const SizedBox(height: 20),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        );
      }),
    );
  }
}
