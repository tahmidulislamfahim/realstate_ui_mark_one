import 'package:flutter/material.dart';
import 'package:realstate_ui_mark_one/features/home/controllers/home_controller.dart';

class CategoriesSection extends StatelessWidget {
  const CategoriesSection({super.key, required this.controller});

  final HomeController controller;

  @override
  Widget build(BuildContext context) {
    return Builder(
      builder: (context) {
        final categories = ['House', 'Apartment', 'Hotel', 'Villa', 'Cottage'];
        return SizedBox(
          height: 48,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            itemCount: categories.length,
            separatorBuilder: (_, __) => const SizedBox(width: 12),
            itemBuilder: (context, index) {
              final selected = controller.selectedCategory.value == index;
              return GestureDetector(
                onTap: () => controller.selectCategory(index),
                child: Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: selected ? 20 : 16,
                    vertical: 10,
                  ),
                  decoration: BoxDecoration(
                    gradient: selected
                        ? const LinearGradient(
                            colors: [Color(0xFF4FC3F7), Color(0xFF0EA5E9)],
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                          )
                        : null,
                    color: selected ? null : Colors.grey[100],
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: selected
                        ? [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.15),
                              blurRadius: 6,
                              offset: const Offset(0, 3),
                            ),
                          ]
                        : null,
                    border: selected
                        ? null
                        : Border.all(color: Colors.grey.shade200),
                  ),
                  child: Center(
                    child: Text(
                      categories[index],
                      style: TextStyle(
                        color: selected ? Colors.white : Colors.black87,
                        fontWeight: selected
                            ? FontWeight.w600
                            : FontWeight.w500,
                      ),
                    ),
                  ),
                ),
              );
            },
          ),
        );
      },
    );
  }
}
