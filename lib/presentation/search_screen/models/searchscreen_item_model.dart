import '../../../core/app_export.dart';

/// This class is used in the [searchscreen_item_widget] screen.
class SearchscreenItemModel {
  SearchscreenItemModel({
    this.h,
    this.h1,
    this.price,
    this.id,
  }) {
    h = h ?? "Organic Bananas";
    h1 = h1 ?? "7pcs, Priceg";
    price = price ?? "4.99";
    id = id ?? "";
  }

  String? h;

  String? h1;

  String? price;

  String? id;
}
