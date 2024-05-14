import 'package:flutter/material.dart';
import 'package:travelbuddy2/core/app_export.dart';
import 'package:travelbuddy2/presentation/homepage_screen/homepage_screen.dart';
import 'package:travelbuddy2/widgets/app_bar/appbar_leading_image.dart';
import 'package:travelbuddy2/widgets/app_bar/custom_app_bar.dart';

// ignore_for_file: must_be_immutable
class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key})
      : super(
          key: key,
        );

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          width: double.maxFinite,
          decoration: AppDecoration.fillOnPrimaryContainer,
          child: Column(
            children: [
              _buildStackOne(context),
              Container(
                padding: EdgeInsets.symmetric(
                  horizontal: 43.h,
                  vertical: 52.v,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      margin: EdgeInsets.only(right: 1.h),
                      padding: EdgeInsets.symmetric(
                        horizontal: 16.h,
                        vertical: 11.v,
                      ),
                      decoration: AppDecoration.fillSecondaryContainer.copyWith(
                        borderRadius: BorderRadiusStyle.roundedBorder20,
                      ),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CustomImageView(
                            imagePath: ImageConstant.imgHighSchoolBui,
                            height: 53.v,
                            width: 48.h,
                            margin: EdgeInsets.only(bottom: 8.v),
                          ),
                          Padding(
                            padding: EdgeInsets.only(
                              left: 23.h,
                              top: 22.v,
                              bottom: 18.v,
                            ),
                            child: Text(
                              "Lyceum International ",
                              style: theme.textTheme.titleMedium,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 26.v),
                    Container(
                      margin: EdgeInsets.only(right: 1.h),
                      padding: EdgeInsets.symmetric(
                        horizontal: 16.h,
                        vertical: 5.v,
                      ),
                      decoration: AppDecoration.fillSecondaryContainer.copyWith(
                        borderRadius: BorderRadiusStyle.roundedBorder20,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CustomImageView(
                            imagePath: ImageConstant.imgPngtreeVector,
                            height: 64.v,
                            width: 52.h,
                            margin: EdgeInsets.only(bottom: 9.v),
                          ),
                          Container(
                            width: 140.h,
                            margin: EdgeInsets.only(
                              left: 23.h,
                              top: 17.v,
                              bottom: 16.v,
                            ),
                            child: Text(
                              "No.20, Albert Place, Dehiwala",
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              textAlign: TextAlign.center,
                              style: theme.textTheme.titleMedium,
                            ),
                          ),
                          Spacer(),
                          CustomImageView(
                            imagePath: ImageConstant.imgImage13,
                            height: 11.adaptSize,
                            width: 11.adaptSize,
                            margin: EdgeInsets.only(
                              top: 13.v,
                              right: 1.h,
                              bottom: 49.v,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 34.v),
                    SizedBox(
                      height: 83.v,
                      width: 303.h,
                      child: Stack(
                        alignment: Alignment.center,
                        children: [
                          CustomImageView(
                            imagePath: ImageConstant.imgImage15,
                            height: 44.v,
                            width: 38.h,
                            alignment: Alignment.topLeft,
                            margin: EdgeInsets.only(
                              left: 21.h,
                              top: 16.v,
                            ),
                          ),
                          Align(
                            alignment: Alignment.center,
                            child: Container(
                              padding: EdgeInsets.symmetric(
                                horizontal: 17.h,
                                vertical: 14.v,
                              ),
                              decoration:
                                  AppDecoration.fillSecondaryContainer.copyWith(
                                borderRadius: BorderRadiusStyle.roundedBorder20,
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  CustomImageView(
                                    imagePath: ImageConstant.img46d9985ea3beb17,
                                    height: 53.adaptSize,
                                    width: 53.adaptSize,
                                  ),
                                  Spacer(
                                    flex: 41,
                                  ),
                                  Container(
                                    width: 76.h,
                                    margin: EdgeInsets.only(
                                      top: 8.v,
                                      bottom: 7.v,
                                    ),
                                    child: Text(
                                      "123456787\n123456789",
                                      maxLines: 2,
                                      overflow: TextOverflow.ellipsis,
                                      textAlign: TextAlign.center,
                                      style: theme.textTheme.titleMedium,
                                    ),
                                  ),
                                  Spacer(
                                    flex: 58,
                                  ),
                                  CustomImageView(
                                    imagePath: ImageConstant.imgImage13,
                                    height: 11.adaptSize,
                                    width: 11.adaptSize,
                                    margin: EdgeInsets.only(
                                      top: 4.v,
                                      bottom: 40.v,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 5.v),
                  ],
                ),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => HomepageScreen()),
                  );
                },
                child: CustomImageView(
                  imagePath: ImageConstant.imgImage16,
                  height: 29.adaptSize,
                  width: 29.adaptSize,
                  alignment: Alignment.centerLeft,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  /// Section Widget
  Widget _buildStackOne(BuildContext context) {
    return SizedBox(
      height: 370.v,
      width: double.maxFinite,
      child: Stack(
        alignment: Alignment.topLeft,
        children: [
          CustomImageView(
            imagePath: ImageConstant.imgEllipse1,
            height: 370.v,
            width: 390.h,
            alignment: Alignment.center,
          ),
          Align(
            alignment: Alignment.topLeft,
            child: Padding(
              padding: EdgeInsets.only(
                top: 11.v,
                right: 98.h,
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  CustomAppBar(
                    height: 42.v,
                    leadingWidth: double.maxFinite,
                    leading: AppbarLeadingImage(
                      imagePath: ImageConstant.imgImage7,
                      margin: EdgeInsets.only(right: 303.h),
                    ),
                  ),
                  SizedBox(height: 6.v),
                  CustomImageView(
                    imagePath: ImageConstant.imgEllipse2,
                    height: 192.v,
                    width: 186.h,
                    radius: BorderRadius.circular(
                      96.h,
                    ),
                    margin: EdgeInsets.only(right: 3.h),
                  ),
                  SizedBox(height: 21.v),
                  SizedBox(
                    width: 177.h,
                    child: RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text: "Ayesha Fazly ",
                            style: CustomTextStyles.titleMediumffffffff,
                          ),
                          TextSpan(
                            text:
                                "ayeshayeshafaz90@gmail.com \n+94 123 456 789",
                            style: theme.textTheme.labelLarge,
                          ),
                        ],
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
