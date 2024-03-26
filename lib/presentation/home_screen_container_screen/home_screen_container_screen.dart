import 'package:project_ct484_green_grocery/presentation/home_screen_page/home_screen_page.dart';
import 'package:project_ct484_green_grocery/widgets/custom_bottom_bar.dart';
import 'models/home_screen_container_model.dart';
import 'package:flutter/material.dart';
import 'package:project_ct484_green_grocery/core/app_export.dart';
import 'provider/home_screen_container_provider.dart';

class HomeScreenContainerScreen extends StatefulWidget {
  const HomeScreenContainerScreen({Key? key}) : super(key: key);

  @override
  HomeScreenContainerScreenState createState() =>
      HomeScreenContainerScreenState();

  static Widget builder(BuildContext context) {
    return ChangeNotifierProvider(
        create: (context) => HomeScreenContainerProvider(),
        child: HomeScreenContainerScreen());
  }
}

// ignore_for_file: must_be_immutable
class HomeScreenContainerScreenState extends State<HomeScreenContainerScreen> {
  GlobalKey<NavigatorState> navigatorKey = GlobalKey();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            body: Navigator(
                key: navigatorKey,
                initialRoute: AppRoutes.homeScreenPage,
                onGenerateRoute: (routeSetting) => PageRouteBuilder(
                    pageBuilder: (ctx, ani, ani1) =>
                        getCurrentPage(context, routeSetting.name!),
                    transitionDuration: Duration(seconds: 0))),
            bottomNavigationBar: _buildBottomBar(context)));
  }

  /// Section Widget
  Widget _buildBottomBar(BuildContext context) {
    return CustomBottomBar(onChanged: (BottomBarEnum type) {
      Navigator.pushNamed(navigatorKey.currentContext!, getCurrentRoute(type));
    });
  }

  ///Handling route based on bottom click actions
  String getCurrentRoute(BottomBarEnum type) {
    switch (type) {
      case BottomBarEnum.Shop:
        return "/";
      case BottomBarEnum.Search:
        return AppRoutes.homeScreenPage;
      case BottomBarEnum.Cart:
        return "/";
      case BottomBarEnum.Account:
        return "/";
      default:
        return "/";
    }
  }

  ///Handling page based on route
  Widget getCurrentPage(
    BuildContext context,
    String currentRoute,
  ) {
    switch (currentRoute) {
      case AppRoutes.homeScreenPage:
        return HomeScreenPage.builder(context);
      default:
        return DefaultWidget();
    }
  }
}
