import 'package:flutter/material.dart';
import '../../../core/app_export.dart';
import '../models/home_screen_container_model.dart';

/// A provider class for the HomeScreenContainerScreen.
///
/// This provider manages the state of the HomeScreenContainerScreen, including the
/// current homeScreenContainerModelObj

// ignore_for_file: must_be_immutable
class HomeScreenContainerProvider extends ChangeNotifier {
  HomeScreenContainerModel homeScreenContainerModelObj =
      HomeScreenContainerModel();

  @override
  void dispose() {
    super.dispose();
  }
}
