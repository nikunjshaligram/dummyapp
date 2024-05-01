import 'package:dummyapp/app/core/theme/colors.dart';
import 'package:dummyapp/app/utils/extensions.dart';
import 'package:dummyapp/app/widgets/journey_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import '../../../core/constants/app_label.dart';
import '../../../core/constants/images.dart';
import '../../../core/theme/styles.dart';
import '../../../widgets/common_widget.dart';
import '../../../widgets/custom_button_widget.dart';
import '../../../widgets/custom_image_widget.dart';
import '../controllers/journey_detail_controller.dart';

class JourneydetailView extends GetView<JourneydetailController> {
  const JourneydetailView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        backgroundColor: AppColors.statusPendingColor,
        appBar: AppBar(
          surfaceTintColor: Colors.transparent,
          backgroundColor: AppColors.statusPendingColor,
          leading: CommonWidget()
              .backArrowField(AppColors.whiteColor)
              .paddingOnly(left: 5.screenWidth),
          title: CommonWidget().appbarTextWidget(
            controller.journeyId.toString(),
          ),
          centerTitle: true,
        ),

        body: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.max,
            children: [
              Expanded(
                child: Obx(
                  () => ListView.builder(
                    key: Key(
                        'builder ${controller.expandedIndex.value.toString()}'),
                    itemCount: controller.journeyData.length,
                    itemBuilder: (BuildContext context, int index) {
                      return ExpansionTile(
                        tilePadding: EdgeInsets.zero,
                        shape: Border(),
                        title: Text(
                          controller.journeyData[index]["journeyname"],
                          style: AppStyle.semiBoldTextStyle(
                            size: 10.sp,
                            color: AppColors.lightTextColor,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        children: [
                          JourneyWidget(controller).userDetailCardField(),
                          2.screenHeight.height,
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              'Products (${(controller.journeyData[index]["products"].length)}) ',
                              textAlign: TextAlign.left,
                              style: AppStyle.semiBoldTextStyle(
                                size: 10.sp,
                                color: AppColors.lightTextColor,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                          2.screenHeight.height,
                          ListView.builder(
                            shrinkWrap: true,
                            physics: NeverScrollableScrollPhysics(),
                            itemCount: controller
                                .journeyData[index]["products"].length,
                            itemBuilder: (context, productIndex) {
                              var product = controller.journeyData[index]
                                  ["products"][productIndex];
                              return ListTile(
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8.0)),
                                tileColor: AppColors.whiteColor,
                                contentPadding: EdgeInsets.symmetric(
                                    horizontal: 10.0, vertical: 0),
                                leading: CustomImageWidget.imageAssetWidget(
                                  AppImages.productIcon,
                                  40.0,
                                  40.0,
                                  BoxFit.fill,
                                ),
                                title: Row(
                                  children: [
                                    Text(
                                      product["id"],
                                      style: AppStyle.semiBoldTextStyle(
                                        size: 11.sp,
                                        color: AppColors.primaryColor,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                    2.screenWidth.width,
                                    Container(
                                      height: 4,
                                      width: 4,
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(50.0),
                                          color: AppColors.darkOrangeColor),
                                    ),
                                    2.screenWidth.width,
                                    Text(
                                      product["date"],
                                      style: AppStyle.regularTextStyle(
                                        size: 10.sp,
                                        color: AppColors.lightTextColor,
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                  ],
                                ),
                                subtitle: Text(
                                  product["productname"].toString(),
                                  style: AppStyle.semiBoldTextStyle(
                                    size: 11.sp,
                                    color: AppColors.primaryColor,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                trailing: Container(
                                    width: 20,
                                    child: Transform.scale(
                                      scale: 0.8,
                                      child: Checkbox(
                                          value: product['isSelect'],
                                          checkColor: AppColors.whiteColor,
                                          fillColor: MaterialStatePropertyAll(
                                              product['isSelect']
                                                  ? AppColors.darkOrangeColor
                                                  : AppColors.whiteColor),
                                          side: MaterialStateBorderSide
                                              .resolveWith(
                                            (states) => BorderSide(
                                                width: 1,
                                                color: product['isSelect'] ==
                                                        false
                                                    ? AppColors.lightTextColor
                                                    : AppColors
                                                        .transparentColor),
                                          ),
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(2),
                                          ),
                                          onChanged: (bool? value) {
                                            controller.actionRemeberMe(value!,
                                                index, productIndex, product);
                                          }),
                                    )),
                              ).paddingOnly(bottom: 10.0);
                            },
                          ),
                        ],
                        onExpansionChanged: (expanded) {
                          controller.toggleExpansion(index, expanded);
                        },
                        initiallyExpanded:
                            index == controller.expandedIndex.value,
                        trailing: Container(
                          height: 24,
                          width: 24,
                          decoration: BoxDecoration(
                              color: AppColors.whiteColor,
                              borderRadius: BorderRadius.circular(8.0)),
                          child: Icon(
                            index == controller.expandedIndex.value
                                ? Icons.remove
                                : Icons.add,
                            color: AppColors.lightTextColor,
                            size: 18.0,
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ),
            ],
          ),
        ), //.paddingAll(15.sp), //JourneyWidget(controller),
        bottomNavigationBar: btnContinue(context),
      ),
    );
  }

  Widget btnContinue(context) {
    return CustomButtonWidget(
      buttonHeight: 0.065,
      buttonWidth: 1.0,
      title: AppLabel.picked,
      isLoading: controller.isLoading.value,
      onButtonPressed: () {},
    ).paddingAll(15.sp);
  }
}
