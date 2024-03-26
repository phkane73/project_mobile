import '../models/homescreen_item_model.dart';
import 'package:flutter/material.dart';
import 'package:project_ct484_green_grocery/core/app_export.dart';

// ignore: must_be_immutable
class HomescreenItemWidget extends StatelessWidget {
  HomescreenItemWidget(
    this.homescreenItemModelObj, {
    Key? key,
    this.onTapOrganicBananas,
  }) : super(
          key: key,
        );

  HomescreenItemModel homescreenItemModelObj;

  VoidCallback? onTapOrganicBananas;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onTapOrganicBananas?.call();
      },
      child: Container(
        padding: EdgeInsets.symmetric(
          horizontal: 14.h,
          vertical: 20.v,
        ),
        decoration: AppDecoration.outlineGray.copyWith(
          borderRadius: BorderRadiusStyle.roundedBorder18,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(height: 3.v),
            CustomImageView(
              imagePath: ImageConstant.img92f1ea7dcce3b5d,
              height: 79.v,
              margin: EdgeInsets.only(left: 18.h),
            ),
            SizedBox(height: 25.v),
            Text(
              homescreenItemModelObj.h!,
              style: theme.textTheme.bodyLarge,
            ),
            Text(
              homescreenItemModelObj.h1!,
              style: theme.textTheme.bodyMedium,
            ),
            SizedBox(height: 29.v),
            Text(
              homescreenItemModelObj.price!,
              style: theme.textTheme.titleMedium,
            ),
          ],
        ),
      ),
    );
  }
}
