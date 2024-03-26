import 'package:flutter/material.dart';
import '../../../core/app_export.dart';
import '../models/product_detail_model.dart';

/// A provider class for the ProductDetailScreen.
///
/// This provider manages the state of the ProductDetailScreen, including the
/// current productDetailModelObj
class ProductDetailProvider extends ChangeNotifier {
  ProductDetailModel productDetailModelObj = ProductDetailModel();

  @override
  void dispose() {
    super.dispose();
  }
}
