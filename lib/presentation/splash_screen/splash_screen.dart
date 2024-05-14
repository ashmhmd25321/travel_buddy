import 'package:flutter/material.dart';
import 'package:travelbuddy2/core/app_export.dart';
import 'package:travelbuddy2/widgets/custom_elevated_button.dart';

import '../login_screen/login_screen.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key})
      : super(
          key: key,
        );

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          width: double.maxFinite,
          padding: EdgeInsets.symmetric(horizontal: 21.h),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: 72.v),
              CustomImageView(
                imagePath: ImageConstant.imgIllustratedFri,
                height: 329.v,
                width: 319.h,
              ),
              SizedBox(height: 87.v),
              Container(
                width: 293.h,
                margin: EdgeInsets.symmetric(horizontal: 27.h),
                child: Text(
                  "Real-Time Safety, With Travel Buddy",
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.center,
                  style: theme.textTheme.displaySmall,
                ),
              ),
              SizedBox(height: 26.v),
              CustomElevatedButton(
                text: "Start",
                margin: EdgeInsets.only(left: 9.h),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => LoginScreen()),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
