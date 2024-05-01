// ignore_for_file: unused_local_variable, unnecessary_null_comparison

import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'dart:typed_data';

import 'package:dummyapp/app/core/constants/app_label.dart';
import 'package:dummyapp/app/core/theme/colors.dart';
import 'package:dummyapp/app/utils/extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_signature_pad/flutter_signature_pad.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:sizer/sizer.dart';
import 'dart:ui' as ui;
import '../../../core/live_network/base_getx_controller.dart';
import '../../../core/theme/styles.dart';

class DeliveredDetailsController extends BaseGetXController
    with GetTickerProviderStateMixin {
  var nameOfPersonController = TextEditingController();
  var instructionsController = TextEditingController();
  var selectDeliveryStatus = "".obs;
  final signatures = GlobalKey<SignatureState>().obs;
  var strokeWidth = 3.0.obs;
  var color = AppColors.blackColor.obs;
  var isSignature = false.obs;
  var isLocationImage = false.obs;
  var opacity = 0.0.obs;
  var img = ByteData(0).obs;
  File? myPickedImage;
  var base64string = "".obs;
  var imagebytes = Uint8List(0).obs;

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void changeDeliveryStatus(val) {
    selectDeliveryStatus.value = val;
  }

  void signatureDraw() async {
    final sign = signatures.value.currentState;
    isSignature.value = true;

    opacity.value = 1.0;
  }

  void removeSignatureTap() {
    final sign = signatures.value.currentState;
    sign?.clear();
    isSignature.value = false;

    opacity.value = 0.0;
  }

  void getSignatureImageTap() async {
    final sign = signatures.value.currentState;
    final image = await sign?.getData();
    var data = await image?.toByteData(format: ui.ImageByteFormat.png);

    final encoded = base64.encode(data!.buffer.asUint8List());

    log(encoded);
    // img.value = data;
  }

  void cameraGalleryImageTap(context) {
    showDialog<ImageSource>(
      context: context,
      builder: (context) => AlertDialog(
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(16.0),
          ),
        ),
        backgroundColor: AppColors.whiteColor,
        contentPadding: const EdgeInsets.all(0),
        actionsPadding: const EdgeInsets.all(0),
        content: Container(
          decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(16.0),
                topRight: Radius.circular(16.0),
              ),
              color: AppColors.darkOrangeColor),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              textAlign: TextAlign.center,
              "Choose Image Source",
              style: AppStyle.boldTextStyle(
                size: 9.sp,
                color: AppColors.whiteColor,
              ),
            ),
          ),
        ),
        actionsAlignment: MainAxisAlignment.spaceAround,
        actions: [
          GestureDetector(
            onTap: () {
              Navigator.pop(context, ImageSource.camera);
            },
            child:
                cardCameraGallery(Icons.camera_alt_outlined, AppLabel.camera),
          ),
          GestureDetector(
            onTap: () {
              Navigator.pop(context, ImageSource.gallery);
            },
            child: cardCameraGallery(Icons.image_outlined, AppLabel.gallery),
          ),
        ],
      ),
    ).then((ImageSource? source) async {
      if (source == null) return;

      var pickedFile = await ImagePicker().pickImage(source: source);
      if (pickedFile == null) return;
      myPickedImage = File(pickedFile.path);
      imagebytes.value = await myPickedImage!.readAsBytes();

      if (imagebytes != null) {
        base64string.value = base64.encode(imagebytes.value);
        print("base64string ${base64string}");
      }
      isLocationImage.value = true;
    });
  }

  Widget cardCameraGallery(icon, title) {
    return Card(
      elevation: 5,
      margin: EdgeInsets.symmetric(vertical: 2.screenHeight),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Icon(
              icon,
              size: 30,
            ),
            Text(
              title,
              style: AppStyle.boldTextStyle(
                size: 9.sp,
                color: AppColors.primaryColor,
              ),
            )
          ],
        ),
      ),
    );
  }

  void removeLocationImageTap() {
    isLocationImage.value = false;
    base64string.value = "";
  }
}
