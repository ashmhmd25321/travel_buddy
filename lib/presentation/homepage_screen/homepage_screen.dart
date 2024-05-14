import 'dart:async';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:travelbuddy2/core/app_export.dart';
import 'package:travelbuddy2/widgets/app_bar/appbar_leading_image.dart';
import 'package:travelbuddy2/widgets/app_bar/custom_app_bar.dart';

import '../map_screen/map_screen.dart';
import '../photo_detection_screen/photo_detection.dart';
import '../profile_page/profile_page.dart';

class HomepageScreen extends StatelessWidget {
  HomepageScreen({Key? key})
      : super(
          key: key,
        );

  Completer<GoogleMapController> googleMapController = Completer();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: _buildAppBar(context),
        body: Container(
          width: double.maxFinite,
          padding: EdgeInsets.symmetric(
            horizontal: 14.h,
            vertical: 16.v,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _buildImageEight(context),
              SizedBox(height: 1.v),
              _buildMapSection(context),
              SizedBox(height: 20.v),
              Padding(
                padding: EdgeInsets.only(left: 38.h),
                child: Text(
                  "Location Detection",
                  style: theme.textTheme.titleMedium,
                ),
              ),
              SizedBox(height: 5.v),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => PhotoDetectionScreen()),
                  );
                },
                child: Container(
                  margin: EdgeInsets.only(
                    left: 30.h,
                    right: 57.h,
                  ),
                  padding: EdgeInsets.symmetric(
                    horizontal: 11.h,
                    vertical: 16.v,
                  ),
                  decoration: AppDecoration.fillSecondaryContainer.copyWith(
                    borderRadius: BorderRadiusStyle.roundedBorder20,
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      CustomImageView(
                        imagePath: ImageConstant.imgImage4,
                        height: 74.v,
                        width: 87.h,
                        margin: EdgeInsets.only(bottom: 10.v),
                      ),
                      Container(
                        width: 131.h,
                        margin: EdgeInsets.only(
                          left: 14.h,
                          top: 14.v,
                          bottom: 8.v,
                        ),
                        child: Text(
                          "Generating textual description of an image.",
                          maxLines: 3,
                          overflow: TextOverflow.ellipsis,
                          style: theme.textTheme.titleMedium,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 16.v),
              Padding(
                padding: EdgeInsets.only(left: 44.h),
                child: Text(
                  "Suggestions",
                  style: theme.textTheme.titleMedium,
                ),
              ),
              SizedBox(height: 8.v),
              Container(
                margin: EdgeInsets.only(
                  left: 30.h,
                  right: 57.h,
                ),
                padding: EdgeInsets.symmetric(
                  horizontal: 26.h,
                  vertical: 25.v,
                ),
                decoration: AppDecoration.fillSecondaryContainer.copyWith(
                  borderRadius: BorderRadiusStyle.roundedBorder20,
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    CustomImageView(
                      imagePath: ImageConstant.imgImage6,
                      height: 48.v,
                      width: 42.h,
                      margin: EdgeInsets.only(
                        top: 11.v,
                        bottom: 5.v,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                        left: 44.h,
                        top: 11.v,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Suggestion 1",
                            style: theme.textTheme.titleMedium,
                          ),
                          SizedBox(height: 12.v),
                          Align(
                            alignment: Alignment.center,
                            child: Text(
                              "Suggestion 2",
                              style: theme.textTheme.titleMedium,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 24.v),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => ProfilePage()),
                  );
                },
                child: CustomImageView(
                  imagePath: ImageConstant.imgImage18,
                  height: 39.adaptSize,
                  width: 39.adaptSize,
                  alignment: Alignment.centerRight,
                ),
              ),
              SizedBox(height: 5.v),
            ],
          ),
        ),
      ),
    );
  }

  /// Section Widget
  PreferredSizeWidget _buildAppBar(BuildContext context) {
    return CustomAppBar(
      leadingWidth: double.maxFinite,
      leading: AppbarLeadingImage(
        imagePath: ImageConstant.imgImage3,
        margin: EdgeInsets.only(
          top: 7.v,
          right: 294.h,
          bottom: 7.v,
        ),
      ),
    );
  }

  /// Section Widget
  Widget _buildImageEight(BuildContext context) {
    return Container(
      height: 233.v,
      width: 350.h,
      margin: EdgeInsets.only(left: 12.h),
      child: Stack(
        alignment: Alignment.bottomRight,
        children: [
          Align(
            alignment: Alignment.topLeft,
            child: Container(
              margin: EdgeInsets.only(right: 18.h),
              padding: EdgeInsets.symmetric(
                horizontal: 18.h,
                vertical: 22.v,
              ),
              decoration: AppDecoration.fillPrimary.copyWith(
                borderRadius: BorderRadiusStyle.roundedBorder20,
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 86.v),
                  SizedBox(
                    width: 155.h,
                    child: Text(
                      "Welcome,\nDashboard",
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: theme.textTheme.headlineLarge,
                    ),
                  ),
                ],
              ),
            ),
          ),
          CustomImageView(
            imagePath: ImageConstant.imgBjnkjhugycRemovebgPreview,
            height: 212.v,
            width: 235.h,
            alignment: Alignment.bottomRight,
          ),
        ],
      ),
    );
  }

  /// Section Widget
  Widget _buildMapSection(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => MapScreen()), // Replace MapScreen with the actual screen you want to navigate to
        );
      },
      child: Container(
        height: 127.v,
        width: 275.h,
        margin: EdgeInsets.only(left: 30.h),
        child: Stack(
          alignment: Alignment.topLeft,
          children: [
            SizedBox(
              height: 102.v,
              width: 275.h,
              child: GoogleMap(
                //TODO: Add your Google Maps API key in AndroidManifest.xml and pod file
                mapType: MapType.normal,
                initialCameraPosition: CameraPosition(
                  target: LatLng(
                    37.43296265331129,
                    -122.08832357078792,
                  ),
                  zoom: 14.4746,
                ),
                onMapCreated: (GoogleMapController controller) {
                  googleMapController.complete(controller);
                },
                zoomControlsEnabled: false,
                zoomGesturesEnabled: false,
                myLocationButtonEnabled: false,
                myLocationEnabled: false,
              ),
            ),
            Align(
              alignment: Alignment.topLeft,
              child: Padding(
                padding: EdgeInsets.only(
                  left: 1.h,
                  top: 7.v,
                ),

                child: Text(
                  "All",
                  style: CustomTextStyles.titleMediumOnPrimaryContainer,
                ),
              ),
            ),
            Align(
              alignment: Alignment.topLeft,
              child: Padding(
                padding: EdgeInsets.only(left: 8.h),
                child: Text(
                  "Real time Map",
                  style: theme.textTheme.titleMedium,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
