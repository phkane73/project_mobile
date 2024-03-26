import 'package:project_ct484_green_grocery/presentation/home_screen_page/home_screen_page.dart';
import 'package:project_ct484_green_grocery/widgets/custom_search_view.dart';
import 'widgets/searchscreen_item_widget.dart';
import 'models/searchscreen_item_model.dart';
import 'models/search_model.dart';
import 'package:project_ct484_green_grocery/widgets/custom_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:project_ct484_green_grocery/core/app_export.dart';
import 'provider/search_provider.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  SearchScreenState createState() => SearchScreenState();

  static Widget builder(BuildContext context) {
    return ChangeNotifierProvider(
        create: (context) => SearchProvider(), child: SearchScreen());
  }
}

// ignore_for_file: must_be_immutable
class SearchScreenState extends State<SearchScreen> {
  GlobalKey<NavigatorState> navigatorKey = GlobalKey();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            resizeToAvoidBottomInset: false,
            body: Container(
                width: double.maxFinite,
                padding: EdgeInsets.symmetric(horizontal: 25.h),
                child: Column(children: [
                  SizedBox(height: 32.v),
                  Selector<SearchProvider, TextEditingController?>(
                      selector: (context, provider) =>
                          provider.searchController,
                      builder: (context, searchController, child) {
                        return CustomSearchView(
                            controller: searchController,
                            hintText: "lbl_search_product".tr);
                      }),
                  SizedBox(height: 18.v),
                  _buildSearchScreen(context)
                ])),
            bottomNavigationBar: _buildBottomBar(context)));
  }

  /// Section Widget
  Widget _buildSearchScreen(BuildContext context) {
    return Expanded(
        child: Consumer<SearchProvider>(builder: (context, provider, child) {
      return GridView.builder(
          shrinkWrap: true,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              mainAxisExtent: 249.v,
              crossAxisCount: 2,
              mainAxisSpacing: 14.h,
              crossAxisSpacing: 14.h),
          physics: BouncingScrollPhysics(),
          itemCount: provider.searchModelObj.searchscreenItemList.length,
          itemBuilder: (context, index) {
            SearchscreenItemModel model =
                provider.searchModelObj.searchscreenItemList[index];
            return SearchscreenItemWidget(model, onTapOrganicBananas: () {
              onTapOrganicBananas(context);
            });
          });
    }));
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

  /// Navigates to the productDetailScreen when the action is triggered.
  onTapOrganicBananas(BuildContext context) {
    NavigatorService.pushNamed(
      AppRoutes.productDetailScreen,
    );
  }
}
