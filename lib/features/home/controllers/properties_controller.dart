import 'package:get/get.dart';
import 'package:realstate_ui_mark_one/features/home/data/properties_data.dart';
import 'package:realstate_ui_mark_one/features/home/models/property.dart';

class PropertiesController extends GetxController {
  final properties = <Property>[...demoProperties].obs;

  List<Property> get all => properties;

  void load(List<Property> newProps) => properties.assignAll(newProps);
}
