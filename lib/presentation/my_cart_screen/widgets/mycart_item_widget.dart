import '../models/mycart_item_model.dart';
import 'package:project_ct484_green_grocery/widgets/custom_icon_button.dart';
import 'package:flutter/material.dart';
import 'package:project_ct484_green_grocery/core/app_export.dart';

// ignore: must_be_immutable
class MycartItemWidget extends StatelessWidget {
  MycartItemWidget(
    this.mycartItemModelObj, {
    Key? key,
  }) : super(
          key: key,
        );

  MycartItemModel mycartItemModelObj;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        CustomImageView(
          imagePath: mycartItemModelObj?.bellPepperRed,
          height: 96.v,
        ),
        SizedBox(
          width: 260.h,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    mycartItemModelObj.name!,
                    style: theme.textTheme.bodyLarge,
                  ),
                  Text(
                    mycartItemModelObj.unit!,
                    style: theme.textTheme.bodyMedium,
                  ),
                  SizedBox(height: 7.v),
                  SizedBox(
                    width: 133.h,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(top: 1.v),
                          child: CustomIconButton(
                            height: 45.adaptSize,
                            width: 45.adaptSize,
                            padding: EdgeInsets.all(14.h),
                            child: CustomImageView(
                              imagePath: ImageConstant.imgMinus,
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                            top: 12.v,
                            bottom: 11.v,
                          ),
                          child: Text(
                            mycartItemModelObj.quantity!,
                            style: CustomTextStyles.titleMediumExtraBold16,
                          ),
                        ),
                        CustomIconButton(
                          height: 45.adaptSize,
                          width: 45.adaptSize,
                          padding: EdgeInsets.all(14.h),
                          decoration: IconButtonStyleHelper.outlineGrayTL17,
                          child: CustomImageView(
                            imagePath: ImageConstant.imgPlus,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsets.only(bottom: 19.v),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomImageView(
                      imagePath: ImageConstant.imgClose,
                      height: 13.v,
                      alignment: Alignment.centerRight,
                    ),
                    SizedBox(height: 37.v),
                    Text(
                      mycartItemModelObj.price!,
                      style: CustomTextStyles.titleMediumExtraBold_1,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
