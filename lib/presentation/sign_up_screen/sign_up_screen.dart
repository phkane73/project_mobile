import 'package:project_ct484_green_grocery/widgets/custom_text_form_field.dart';
import 'package:project_ct484_green_grocery/widgets/custom_elevated_button.dart';
import 'models/sign_up_model.dart';
import 'package:flutter/material.dart';
import 'package:project_ct484_green_grocery/core/app_export.dart';
import 'provider/sign_up_provider.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  SignUpScreenState createState() => SignUpScreenState();

  static Widget builder(BuildContext context) {
    return ChangeNotifierProvider(
        create: (context) => SignUpProvider(), child: SignUpScreen());
  }
}

class SignUpScreenState extends State<SignUpScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            backgroundColor: appTheme.whiteA70001.withOpacity(0.54),
            resizeToAvoidBottomInset: false,
            body: Container(
                width: double.maxFinite,
                padding: EdgeInsets.only(left: 23.h, top: 77.v, right: 23.h),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomImageView(
                          imagePath: ImageConstant.imgSettings,
                          width: 47.h,
                          alignment: Alignment.center),
                      SizedBox(height: 97.v),
                      Text("lbl_login".tr,
                          style: theme.textTheme.headlineMedium),
                      SizedBox(height: 9.v),
                      Padding(
                          padding: EdgeInsets.only(left: 2.h),
                          child: Text("msg_enter_your_emails".tr,
                              style: CustomTextStyles.bodyLargeGray600)),
                      SizedBox(height: 38.v),
                      Padding(
                          padding: EdgeInsets.only(left: 1.h),
                          child: Text("lbl_name".tr,
                              style: CustomTextStyles.titleMediumGray600)),
                      SizedBox(height: 18.v),
                      _buildName(context),
                      SizedBox(height: 19.v),
                      Padding(
                          padding: EdgeInsets.only(left: 1.h),
                          child: Text("lbl_email".tr,
                              style: CustomTextStyles.titleMediumGray600)),
                      SizedBox(height: 19.v),
                      _buildEmail(context),
                      SizedBox(height: 19.v),
                      Text("lbl_password".tr,
                          style: CustomTextStyles.titleMediumGray600),
                      SizedBox(height: 19.v),
                      _buildPassword(context),
                      SizedBox(height: 40.v),
                      _buildLogIn(context),
                      SizedBox(height: 15.v),
                      Padding(
                          padding: EdgeInsets.only(left: 2.h, right: 78.h),
                          child: Row(children: [
                            Text("msg_already_have_an".tr,
                                style: CustomTextStyles
                                    .titleSmallSecondaryContainer),
                            Padding(
                                padding: EdgeInsets.only(left: 4.h),
                                child: Text("lbl_login_now".tr,
                                    style: CustomTextStyles.titleSmallPrimary))
                          ])),
                      SizedBox(height: 5.v)
                    ]))));
  }

  /// Section Widget
  Widget _buildName(BuildContext context) {
    return Padding(
        padding: EdgeInsets.only(left: 2.h),
        child: Selector<SignUpProvider, TextEditingController?>(
            selector: (context, provider) => provider.nameController,
            builder: (context, nameController, child) {
              return CustomTextFormField(controller: nameController);
            }));
  }

  /// Section Widget
  Widget _buildEmail(BuildContext context) {
    return Padding(
        padding: EdgeInsets.only(left: 2.h),
        child: Selector<SignUpProvider, TextEditingController?>(
            selector: (context, provider) => provider.emailController,
            builder: (context, emailController, child) {
              return CustomTextFormField(controller: emailController);
            }));
  }

  /// Section Widget
  Widget _buildPassword(BuildContext context) {
    return Padding(
        padding: EdgeInsets.only(left: 2.h),
        child: Consumer<SignUpProvider>(builder: (context, provider, child) {
          return CustomTextFormField(
              controller: provider.passwordController,
              textInputAction: TextInputAction.done,
              suffix: InkWell(
                  onTap: () {
                    provider.changePasswordVisibility();
                  },
                  child: Container(
                      margin: EdgeInsets.symmetric(
                          horizontal: 13.h, vertical: 14.v),
                      child: CustomImageView(
                          imagePath: ImageConstant.imgEye, height: 18.v))),
              suffixConstraints: BoxConstraints(maxHeight: 48.v),
              obscureText: provider.isShowPassword);
        }));
  }

  /// Section Widget
  Widget _buildLogIn(BuildContext context) {
    return CustomElevatedButton(
        text: "lbl_log_in2".tr,
        margin: EdgeInsets.only(left: 1.h),
        onPressed: () {
          onTapLogIn(context);
        });
  }

  /// Navigates to the homeScreenContainerScreen when the action is triggered.
  onTapLogIn(BuildContext context) {
    NavigatorService.pushNamed(
      AppRoutes.homeScreenContainerScreen,
    );
  }
}
