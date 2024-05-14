import 'package:flutter/material.dart';
import 'package:travelbuddy2/core/app_export.dart';
import 'package:travelbuddy2/widgets/custom_elevated_button.dart';
import 'package:travelbuddy2/widgets/custom_text_form_field.dart';

import '../homepage_screen/homepage_screen.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({Key? key})
      : super(
          key: key,
        );

  TextEditingController emailController = TextEditingController();

  TextEditingController passwordController = TextEditingController();

  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: SizedBox(
          width: SizeUtils.width,
          child: SingleChildScrollView(
            padding: EdgeInsets.only(
              bottom: MediaQuery.of(context).viewInsets.bottom,
            ),
            child: Form(
              key: _formKey,
              child: SizedBox(
                width: double.maxFinite,
                child: Column(
                  children: [
                    _buildLoginForm(context),
                    SizedBox(height: 73.v),
                    Padding(
                      padding: EdgeInsets.only(
                        left: 25.h,
                        right: 26.h,
                      ),
                      child: CustomTextFormField(
                        controller: emailController,
                        hintText: "E-mail",
                        textInputType: TextInputType.emailAddress,
                        prefix: Container(
                          margin: EdgeInsets.fromLTRB(18.h, 10.v, 21.h, 10.v),
                          child: CustomImageView(
                            imagePath: ImageConstant.imgImage1,
                            height: 30.v,
                            width: 34.h,
                          ),
                        ),
                        prefixConstraints: BoxConstraints(
                          maxHeight: 50.v,
                        ),
                      ),
                    ),
                    SizedBox(height: 30.v),
                    Padding(
                      padding: EdgeInsets.only(
                        left: 25.h,
                        right: 26.h,
                      ),
                      child: CustomTextFormField(
                        controller: passwordController,
                        hintText: "Password",
                        textInputType: TextInputType.visiblePassword,
                        prefix: Container(
                          margin: EdgeInsets.fromLTRB(18.h, 10.v, 21.h, 10.v),
                          child: CustomImageView(
                            imagePath: ImageConstant.imgImage1,
                            height: 30.v,
                            width: 34.h,
                          ),
                        ),
                        prefixConstraints: BoxConstraints(
                          maxHeight: 50.v,
                        ),
                      ),
                    ),
                    SizedBox(height: 67.v),
                    CustomElevatedButton(
                      text: "Login",
                      margin: EdgeInsets.only(left: 9.h),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => HomepageScreen()),
                        );
                      },
                    ),
                    SizedBox(height: 5.v),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  /// Section Widget
  Widget _buildLoginForm(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: 74.h,
        vertical: 65.v,
      ),
      decoration: AppDecoration.outlineBlack.copyWith(
        borderRadius: BorderRadiusStyle.roundedBorder30,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          SizedBox(height: 27.v),
          CustomImageView(
            imagePath: ImageConstant.imgLogoooooooooooo,
            height: 242.adaptSize,
            width: 242.adaptSize,
          ),
        ],
      ),
    );
  }
}
