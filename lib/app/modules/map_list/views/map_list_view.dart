import 'dart:ui';
import 'package:dummyapp/app/utils/extensions.dart';
import 'package:dummyapp/app/widgets/common_widget.dart';
import 'package:dummyapp/app/widgets/custom_padding_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import '../../../core/constants/images.dart';
import '../../../core/theme/colors.dart';
import '../../../core/theme/styles.dart';
import '../../../widgets/custom_image_widget.dart';
import '../controllers/map_list_controller.dart';

class MapListView extends GetView<MapListController> {
  const MapListView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: [
        CustomImageWidget.imageAssetWidget(
          AppImages.mapImage,
          Get.height,
          Get.width,
          BoxFit.fill,
        ),
        bottomDetailsSheet(context)
      ],
    ));
  }

  Widget bottomDetailsSheet(context) {
    return Obx(
      () => AnimatedPositioned(
        duration: Duration(milliseconds: 300),
        curve: Curves.easeInOut,
        bottom: 0,
        left: 0,
        right: 0,
        height: controller.sheetHeight.value,
        child: DraggableScrollableSheet(
          initialChildSize: 0.7,
          minChildSize: 0.1,
          maxChildSize: 0.7,
          expand: true,
          builder: (BuildContext context, ScrollController scrollController) {
            return Container(
              padding: EdgeInsets.only(top: 1.screenHeight),
              alignment: Alignment.topCenter,
              child: Stack(
                alignment: Alignment.center,
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.only(
                      top: 2.screenHeight,
                    ),
                    child: Container(
                      decoration: BoxDecoration(
                        color: AppColors.whiteColor,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(25.0),
                          topRight: Radius.circular(25.0),
                        ),
                      ),
                      child: bottomsheetListDataField(),
                    ),
                  ),
                  bottomsheetUpDownField()
                ],
              ),
            );
          },
        ),
      ),
    );
  }

  Widget bottomsheetListDataField() {
    return Obx(
      () => ReorderableListView(
        buildDefaultDragHandles: false,
        onReorder: (oldIndex, newIndex) {
          controller.reorderItems(oldIndex, newIndex);
        },
        proxyDecorator: (child, index, animation) {
          return AnimatedBuilder(
            animation: animation,
            builder: (BuildContext context, Widget? child) {
              final double animValue =
                  Curves.easeInOut.transform(animation.value);
              final double scale = lerpDouble(1, 1.02, animValue)!;
              return Transform.scale(
                scale: scale,
                child: child,
              );
            },
            child: child,
          );
        },
        children: List.generate(
          controller.journeyList.length,
          (index) => ReorderableDragStartListener(
            index: index,
            key: Key('$index'),
            child: Column(
              children: [
                GestureDetector(
                  behavior: HitTestBehavior.translucent,
                  onTap: () {
                    controller.orderListTap();
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Expanded(
                        child: IgnorePointer(
                          ignoring: true,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              locationImageField(),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    companyTextField(
                                        controller.journeyList[index]),
                                    addressTextField(
                                        controller.journeyList[index]),
                                    statusMilesField(
                                        controller.journeyList[index])
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Stack(
                        alignment: Alignment.center,
                        children: [
                          Container(
                            height: 3.screenHeight,
                            width: 3.screenHeight,
                            decoration: BoxDecoration(
                              color: AppColors.darkOrangeColor,
                              borderRadius: BorderRadius.circular(50.0),
                            ),
                          ),
                          swipeImageField(),
                        ],
                      ),
                    ],
                  ),
                ),
                CommonWidget().dividerField().paddingVertical(1.3.screenHeight)
              ],
            ),
          ),
        ),
      ).paddingOnly(
          left: 6.screenWidth,
          right: 6.screenWidth,
          top: 4.screenHeight,
          bottom: 1.screenHeight),
    );
  }

  Widget companyTextField(journeyData) {
    return Text(
      journeyData["company_name"],
      maxLines: 2,
      overflow: TextOverflow.ellipsis,
      style: AppStyle.boldTextStyle(
        size: 11.sp,
        color: AppColors.primaryColor,
      ),
    ).paddingLeft(2.screenWidth);
  }

  Widget addressTextField(journeyData) {
    return Text(
      journeyData["address"],
      maxLines: 2,
      overflow: TextOverflow.ellipsis,
      style: AppStyle.regularTextStyle(
        size: 9.sp,
        color: AppColors.lightTextColor,
      ),
    ).paddingLeft(2.screenWidth);
  }

  Widget statusMilesField(journeyData) {
    return Row(
      children: [
        Text(
          journeyData["status"],
          style: AppStyle.semiBoldTextStyle(
            size: 7.sp,
            color: AppColors.darkOrangeColor,
          ),
        ).paddingRight(2.screenWidth),
        Container(
          height: 0.5.screenHeight,
          width: 0.5.screenHeight,
          decoration: BoxDecoration(
              color: AppColors.lightTextColor,
              borderRadius: BorderRadius.circular(50.0)),
        ).paddingRight(2.screenWidth),
        Text(
          "${journeyData["miles"]}" + " M",
          style: AppStyle.semiBoldTextStyle(
            size: 7.sp,
            color: AppColors.primaryColor,
          ),
        ),
      ],
    ).paddingOnly(left: 2.screenWidth, top: 0.5.screenHeight);
  }

  Widget locationImageField() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        CustomImageWidget.imageAssetWidget(
          AppImages.markerLightImage,
          2.5.screenHeight,
          2.screenHeight,
          BoxFit.fill,
        ),
        SizedBox()
      ],
    );
  }

  Widget swipeImageField() {
    return CustomImageWidget.imageAssetWidget(
      AppImages.swipeImage,
      1.2.screenHeight,
      1.2.screenHeight,
      BoxFit.fill,
    );
  }

  Widget bottomsheetUpDownField() {
    return GestureDetector(
      onTap: () {
        controller.toggleSheet();
      },
      child: Align(
        alignment: Alignment.topCenter,
        child: Stack(
          alignment: Alignment.center,
          children: [
            circleField(5.screenHeight, AppColors.statusPendingColor),
            circleField(3.5.screenHeight, AppColors.whiteColor),
            Icon(
              controller.isSheetOpen.value
                  ? Icons.keyboard_arrow_down
                  : Icons.keyboard_arrow_up,
              color: AppColors.lightTextColor,
              size: 22.0,
            ),
          ],
        ),
      ),
    );
  }

  Widget circleField(size, backColor) {
    return Container(
      height: size,
      width: size,
      decoration: BoxDecoration(
        color: backColor,
        borderRadius: BorderRadius.circular(50.0),
      ),
    );
  }
}
