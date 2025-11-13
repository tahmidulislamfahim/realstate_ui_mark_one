import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:realstate_ui_mark_one/features/home/controllers/home_controller.dart';
import 'package:realstate_ui_mark_one/routes/app_routes.dart';

class MenuScreen extends StatelessWidget {
  const MenuScreen({super.key});

  static const Color _bg = Color(0xFF0EA5E9); // accent for selected text/icon

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<HomeController>();

    return Scaffold(
      backgroundColor: const Color(0xFF3C5A99),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(right: 22),
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Top group: Home (selected), Profile, Nearby
                menuItem(
                  title: 'Home',
                  icon: Icons.home_outlined,
                  selected: true,
                  controller: controller,
                ),
                menuItem(
                  title: 'Profile',
                  icon: Icons.person_outline,
                  controller: controller,
                ),
                menuItem(
                  title: 'Nearby',
                  icon: Icons.location_on_outlined,
                  controller: controller,
                ),

                const SizedBox(height: 12),
                Divider(color: Colors.white24, thickness: 1),
                const SizedBox(height: 14),

                // Middle group: Bookmark, Notification (badge), Message (badge)
                menuItem(
                  title: 'Bookmark',
                  icon: Icons.bookmark_border,
                  controller: controller,
                ),
                menuItem(
                  title: 'Notification',
                  icon: Icons.notifications_none,
                  controller: controller,
                  showBadge: true,
                  badgeColor: Colors.red,
                ),
                menuItem(
                  title: 'Message',
                  icon: Icons.message_outlined,
                  controller: controller,
                  showBadge: true,
                  badgeColor: Colors.deepOrange,
                ),

                const SizedBox(height: 14),
                Divider(color: Colors.white24, thickness: 1),
                const SizedBox(height: 14),

                // Bottom group: Settings, Help, Logout
                menuItem(
                  title: 'Setting',
                  icon: Icons.settings_outlined,
                  controller: controller,
                ),
                menuItem(
                  title: 'Help',
                  icon: Icons.help_outline,
                  controller: controller,
                ),
                menuItem(
                  title: 'Logout',
                  icon: Icons.power_settings_new,
                  controller: controller,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget menuItem({
    required String title,
    required IconData icon,
    required HomeController controller,
    bool selected = false,
    bool showBadge = false,
    Color badgeColor = Colors.red,
  }) {
    final textStyle = TextStyle(
      color: selected ? _bg : Colors.white,
      fontSize: 16,
      fontWeight: FontWeight.w500,
    );

    final iconColor = selected ? _bg : Colors.white;

    return GestureDetector(
      onTap: () async {
        await controller.toggleMenu(false);
        // navigate or show snackbar depending on item
        if (title.toLowerCase() == 'home') {
          // navigate to home route
          Get.offAllNamed(Routes.home);
        } else {
          Get.snackbar(
            title,
            'This page is not implemented yet',
            margin: const EdgeInsets.all(12),
            colorText: Colors.black,
          );
        }
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10),
        child: Row(
          children: [
            // Selected pill background only behind the icon+text
            Container(
              decoration: BoxDecoration(
                color: selected ? Colors.white : Colors.transparent,
                borderRadius: const BorderRadius.only(
                  topRight: Radius.circular(30),
                  bottomRight: Radius.circular(30),
                ),
              ),
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
              child: Row(
                children: [
                  // icon with optional badge
                  Stack(
                    clipBehavior: Clip.none,
                    children: [
                      Icon(icon, color: iconColor, size: 22),
                      if (showBadge)
                        Positioned(
                          top: -4,
                          right: -6,
                          child: Container(
                            width: 8,
                            height: 8,
                            decoration: BoxDecoration(
                              color: badgeColor,
                              shape: BoxShape.circle,
                              border: Border.all(
                                color: Colors.white,
                                width: 1.2,
                              ),
                            ),
                          ),
                        ),
                    ],
                  ),
                  const SizedBox(width: 18),
                  Text(title, style: textStyle),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
