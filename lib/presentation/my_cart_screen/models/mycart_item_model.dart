import '../../../core/app_export.dart';

/// This class is used in the [mycart_item_widget] screen.
class MycartItemModel {
  MycartItemModel({
    this.bellPepperRed,
    this.name,
    this.unit,
    this.quantity,
    this.price,
    this.id,
  }) {
    bellPepperRed = bellPepperRed ?? ImageConstant.img92f1ea7dcce3b5d96x107;
    name = name ?? "Bell Pepper Red";
    unit = unit ?? "1kg, Price";
    quantity = quantity ?? "1";
    price = price ?? "4.99";
    id = id ?? "";
  }

  String? bellPepperRed;

  String? name;

  String? unit;

  String? quantity;

  String? price;

  String? id;
}
