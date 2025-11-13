import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:realstate_ui_mark_one/features/home/controllers/properties_controller.dart';
import 'package:realstate_ui_mark_one/features/home/controllers/home_controller.dart';

class BestHouses extends StatefulWidget {
  const BestHouses({super.key});

  @override
  State<BestHouses> createState() => _BestHousesState();
}

class _BestHousesState extends State<BestHouses> {
  @override
  void initState() {
    super.initState();
    Get.find<HomeController>();
  }

  @override
  void dispose() {
    Get.find<HomeController>();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<PropertiesController>();
    final homeCtrl = Get.find<HomeController>();
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Obx(() {
        final list = controller.properties;
        return Column(
          children: List.generate(list.length, (index) {
            final prop = list[index];
            return Container(
              margin: const EdgeInsets.only(bottom: 15),
              height: 100,
              decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.circular(15),
              ),
              child: Row(
                children: [
                  Container(
                    width: 90,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      image: DecorationImage(
                        image: AssetImage(prop.image),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  const SizedBox(width: 15),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(right: 8.0),
                          child: Text(
                            prop.title,
                            style: const TextStyle(fontWeight: FontWeight.w600),
                          ),
                        ),
                        const SizedBox(height: 6),
                        Row(
                          children: [
                            Text(
                              prop.price,
                              style: const TextStyle(
                                color: Color(0xFF0EA5E9),
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            const SizedBox(width: 6),
                            Text(
                              '/ Year',
                              style: TextStyle(
                                color: Colors.grey.shade600,
                                fontSize: 12,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 8),
                        Row(
                          children: [
                            Icon(
                              Icons.king_bed,
                              size: 16,
                              color: Colors.grey[700],
                            ),
                            const SizedBox(width: 6),
                            Text(
                              '${prop.bedrooms} Bedroom',
                              style: TextStyle(
                                color: Colors.grey.shade700,
                                fontSize: 11,
                              ),
                            ),
                            Obx(() {
                              return homeCtrl.showFilter.value
                                  ? Row(
                                      children: [
                                        const SizedBox(width: 16),
                                        Icon(
                                          Icons.bathtub,
                                          size: 16,
                                          color: Colors.grey[700],
                                        ),
                                        const SizedBox(width: 6),
                                        Text(
                                          '${prop.bathrooms} Bathroom',
                                          style: TextStyle(
                                            color: Colors.grey.shade700,
                                            fontSize: 11,
                                          ),
                                        ),
                                      ],
                                    )
                                  : const SizedBox.shrink();
                            }),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            );
          }),
        );
      }),
    );
  }
}
