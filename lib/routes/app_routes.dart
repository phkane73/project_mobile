import 'package:flutter/material.dart';
import '../presentation/sign_up_screen/sign_up_screen.dart';
import '../presentation/home_screen_container_screen/home_screen_container_screen.dart';
import '../presentation/search_screen/search_screen.dart';
import '../presentation/my_cart_screen/my_cart_screen.dart';
import '../presentation/product_detail_screen/product_detail_screen.dart';
import '../presentation/app_navigation_screen/app_navigation_screen.dart';

class AppRoutes {
  static const String signUpScreen = '/sign_up_screen';

  static const String homeScreenContainerScreen =
      '/home_screen_container_screen';

  static const String homeScreenPage = '/home_screen_page';

  static const String searchScreen = '/search_screen';

  static const String myCartScreen = '/my_cart_screen';

  static const String productDetailScreen = '/product_detail_screen';

  static const String appNavigationScreen = '/app_navigation_screen';

  static const String initialRoute = '/initialRoute';

  static Map<String, WidgetBuilder> get routes => {
        signUpScreen: SignUpScreen.builder,
        homeScreenContainerScreen: HomeScreenContainerScreen.builder,
        searchScreen: SearchScreen.builder,
        myCartScreen: MyCartScreen.builder,
        productDetailScreen: ProductDetailScreen.builder,
        appNavigationScreen: AppNavigationScreen.builder,
        initialRoute: SignUpScreen.builder
      };
}
