import 'widgets/mycart_item_widget.dart';
import 'models/mycart_item_model.dart';
import 'models/my_cart_model.dart';
import 'package:project_ct484_green_grocery/widgets/custom_elevated_button.dart';
import 'package:flutter/material.dart';
import 'package:project_ct484_green_grocery/core/app_export.dart';
import 'provider/my_cart_provider.dart';

class MyCartScreen extends StatefulWidget {
  const MyCartScreen({Key? key})
      : super(
          key: key,
        );

  @override
  MyCartScreenState createState() => MyCartScreenState();
  static Widget builder(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => MyCartProvider(),
      child: MyCartScreen(),
    );
  }
}

class MyCartScreenState extends State<MyCartScreen> {
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
          padding: EdgeInsets.symmetric(vertical: 17.v),
          child: Column(
            children: [
              Text(
                "lbl_my_cart".tr,
                style: theme.textTheme.titleLarge,
              ),
              SizedBox(height: 23.v),
              Divider(),
              SizedBox(height: 28.v),
              _buildMyCart(context),
            ],
          ),
        ),
        bottomNavigationBar: _buildCheckOut(context),
      ),
    );
  }

  /// Section Widget
  Widget _buildMyCart(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 19.h),
      child: Consumer<MyCartProvider>(
        builder: (context, provider, child) {
          return ListView.separated(
            physics: NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            separatorBuilder: (
              context,
              index,
            ) {
              return Padding(
                padding: EdgeInsets.symmetric(vertical: 15.5.v),
                child: SizedBox(
                  width: 363.h,
                  child: Divider(
                    height: 1.v,
                    thickness: 1.v,
                    color: appTheme.gray300,
                  ),
                ),
              );
            },
            itemCount: provider.myCartModelObj.mycartItemList.length,
            itemBuilder: (context, index) {
              MycartItemModel model =
                  provider.myCartModelObj.mycartItemList[index];
              return MycartItemWidget(
                model,
              );
            },
          );
        },
      ),
    );
  }

  /// Section Widget
  Widget _buildCheckOut(BuildContext context) {
    return CustomElevatedButton(
      text: "lbl_check_out".tr,
      margin: EdgeInsets.only(
        left: 25.h,
        right: 24.h,
        bottom: 38.v,
      ),
    );
  }
}
