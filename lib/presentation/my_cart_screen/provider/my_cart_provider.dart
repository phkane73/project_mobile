import 'package:flutter/material.dart';
import '../../../core/app_export.dart';
import '../models/my_cart_model.dart';
import '../models/mycart_item_model.dart';

/// A provider class for the MyCartScreen.
///
/// This provider manages the state of the MyCartScreen, including the
/// current myCartModelObj
class MyCartProvider extends ChangeNotifier {
  MyCartModel myCartModelObj = MyCartModel();

  @override
  void dispose() {
    super.dispose();
  }
}
