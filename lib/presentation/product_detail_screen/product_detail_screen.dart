import 'package:project_ct484_green_grocery/widgets/custom_outlined_button.dart';
import 'package:project_ct484_green_grocery/widgets/custom_elevated_button.dart';
import 'models/product_detail_model.dart';
import 'package:flutter/material.dart';
import 'package:project_ct484_green_grocery/core/app_export.dart';
import 'provider/product_detail_provider.dart';

class ProductDetailScreen extends StatefulWidget {
  const ProductDetailScreen({Key? key})
      : super(
          key: key,
        );

  @override
  ProductDetailScreenState createState() => ProductDetailScreenState();
  static Widget builder(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => ProductDetailProvider(),
      child: ProductDetailScreen(),
    );
  }
}

class ProductDetailScreenState extends State<ProductDetailScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SizedBox(
          width: double.maxFinite,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildImage(context),
              SizedBox(height: 26.v),
              Padding(
                padding: EdgeInsets.only(left: 25.h),
                child: Text(
                  "lbl_organic_bananas".tr,
                  style: theme.textTheme.headlineSmall,
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 25.h),
                child: Text(
                  "lbl_1kg".tr,
                  style: CustomTextStyles.titleMediumGray600,
                ),
              ),
              SizedBox(height: 24.v),
              _buildQuantity(context),
              SizedBox(height: 30.v),
              Align(
                alignment: Alignment.center,
                child: Divider(
                  color: appTheme.gray300.withOpacity(0.7),
                  indent: 25.h,
                  endIndent: 25.h,
                ),
              ),
              SizedBox(height: 6.v),
              Padding(
                padding: EdgeInsets.only(left: 30.h),
                child: Text(
                  "lbl_product_detail".tr,
                  style: CustomTextStyles.titleMediumExtraBold16_1,
                ),
              ),
              SizedBox(height: 18.v),
              Align(
                alignment: Alignment.center,
                child: Container(
                  width: 349.h,
                  margin: EdgeInsets.only(
                    left: 29.h,
                    right: 35.h,
                  ),
                  child: Text(
                    "msg_apples_are_nutritious".tr,
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                    style: CustomTextStyles.bodyMedium13.copyWith(
                      height: 1.62,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 5.v),
            ],
          ),
        ),
        bottomNavigationBar: _buildAddToCart(context),
      ),
    );
  }

  /// Section Widget
  Widget _buildImage(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: 77.h,
        vertical: 82.v,
      ),
      decoration: AppDecoration.fillGray.copyWith(
        borderRadius: BorderRadiusStyle.customBorderBL25,
      ),
      child: CustomImageView(
        imagePath: ImageConstant.img92f1ea7dcce3b5d,
        height: 206.v,
      ),
    );
  }

  /// Section Widget
  Widget _buildQuantity(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 25.h),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CustomImageView(
              imagePath: ImageConstant.imgMinus,
              height: 2.v,
              margin: EdgeInsets.symmetric(vertical: 21.v),
            ),
            CustomOutlinedButton(
              width: 45.h,
              text: "lbl_1".tr,
              margin: EdgeInsets.only(left: 20.h),
            ),
            CustomImageView(
              imagePath: ImageConstant.imgPlus,
              height: 17.adaptSize,
              width: 17.adaptSize,
              margin: EdgeInsets.only(
                left: 20.h,
                top: 14.v,
                bottom: 14.v,
              ),
            ),
            Spacer(),
            Padding(
              padding: EdgeInsets.only(
                top: 6.v,
                bottom: 5.v,
              ),
              child: Text(
                "lbl_4_99".tr,
                style: theme.textTheme.headlineSmall,
              ),
            ),
          ],
        ),
      ),
    );
  }

  /// Section Widget
  Widget _buildAddToCart(BuildContext context) {
    return CustomElevatedButton(
      text: "lbl_add_to_cart".tr,
      margin: EdgeInsets.only(
        left: 25.h,
        right: 25.h,
        bottom: 38.v,
      ),
    );
  }
}
