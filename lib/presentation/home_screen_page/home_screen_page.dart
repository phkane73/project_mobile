import 'widgets/homescreen_item_widget.dart';
import 'models/homescreen_item_model.dart';
import 'models/home_screen_model.dart';
import 'package:flutter/material.dart';
import 'package:project_ct484_green_grocery/core/app_export.dart';
import 'provider/home_screen_provider.dart';

class HomeScreenPage extends StatefulWidget {
  const HomeScreenPage({Key? key}) : super(key: key);

  @override
  HomeScreenPageState createState() => HomeScreenPageState();

  static Widget builder(BuildContext context) {
    return ChangeNotifierProvider(
        create: (context) => HomeScreenProvider(), child: HomeScreenPage());
  }
}

class HomeScreenPageState extends State<HomeScreenPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            body: Container(
                width: double.maxFinite,
                decoration: AppDecoration.fillWhiteA70001,
                child: Column(children: [
                  SizedBox(height: 30.v),
                  _buildBanner(context),
                  SizedBox(height: 18.v),
                  _buildHomeScreen(context)
                ]))));
  }

  /// Section Widget
  Widget _buildBanner(BuildContext context) {
    return SizedBox(
        height: 115.v,
        width: 368.h,
        child: Stack(alignment: Alignment.center, children: [
          Opacity(
              opacity: 0.85,
              child: CustomImageView(
                  imagePath: ImageConstant.imgMaskGroup,
                  height: 114.v,
                  alignment: Alignment.center)),
          Align(
              alignment: Alignment.center,
              child: Container(
                  height: 114.v,
                  width: 367.h,
                  decoration: BoxDecoration(
                      color: appTheme.whiteA70001.withOpacity(0.53),
                      borderRadius: BorderRadius.circular(8.h),
                      border: Border.all(
                          color: appTheme.gray100,
                          width: 1.h,
                          strokeAlign: strokeAlignOutside)))),
          Align(
              alignment: Alignment.center,
              child: SizedBox(
                  height: 114.v,
                  width: 367.h,
                  child: Stack(alignment: Alignment.centerRight, children: [
                    CustomImageView(
                        imagePath: ImageConstant.imgMaskGroup114x367,
                        height: 114.v,
                        alignment: Alignment.center),
                    Align(
                        alignment: Alignment.centerRight,
                        child: Padding(
                            padding: EdgeInsets.only(right: 35.h),
                            child: Text("lbl_b_ch_h_a_s_ch".tr,
                                style: CustomTextStyles.headlineSmallBlack900)))
                  ]))),
          CustomImageView(
              imagePath: ImageConstant.img27711,
              height: 112.v,
              alignment: Alignment.centerLeft,
              margin: EdgeInsets.only(left: 6.h))
        ]));
  }

  /// Section Widget
  Widget _buildHomeScreen(BuildContext context) {
    return Expanded(
        child: Padding(
            padding: EdgeInsets.only(left: 3.h, right: 2.h),
            child: Consumer<HomeScreenProvider>(
                builder: (context, provider, child) {
              return GridView.builder(
                  shrinkWrap: true,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      mainAxisExtent: 249.v,
                      crossAxisCount: 2,
                      mainAxisSpacing: 14.h,
                      crossAxisSpacing: 14.h),
                  physics: BouncingScrollPhysics(),
                  itemCount:
                      provider.homeScreenModelObj.homescreenItemList.length,
                  itemBuilder: (context, index) {
                    HomescreenItemModel model =
                        provider.homeScreenModelObj.homescreenItemList[index];
                    return HomescreenItemWidget(model, onTapOrganicBananas: () {
                      onTapOrganicBananas(context);
                    });
                  });
            })));
  }

  /// Navigates to the productDetailScreen when the action is triggered.
  onTapOrganicBananas(BuildContext context) {
    NavigatorService.pushNamed(
      AppRoutes.productDetailScreen,
    );
  }
}
