import 'package:get/get.dart';
import '../models/featured_card.dart';
import '../data/featured_cards_data.dart';

class FeaturedController extends GetxController {
  final items = <FeaturedCard>[...demoFeaturedCards].obs;

  List<FeaturedCard> get all => items;

  void load(List<FeaturedCard> newItems) {
    items.assignAll(newItems);
  }
}
