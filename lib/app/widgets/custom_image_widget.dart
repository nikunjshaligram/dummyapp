import 'package:flutter/material.dart';

class CustomImageWidget {
  static imageAssetWidget(imgPath, imgHeight, imgWidth, boxfit) {
    return Image.asset(
      imgPath,
      height: imgHeight,
      width: imgWidth,
      fit: boxfit,
    );
  }

  static imageMemoryWidget(imgPath, imgHeight, imgWidth) {
    return Image.memory(
      imgPath,
      height: imgHeight,
      width: imgWidth,
      fit: BoxFit.fill,
    );
  }

  static imageFileWidget(imgPath, imgHeight, imgWidth) {
    return Image.file(
      imgPath,
      height: imgHeight,
      width: imgWidth,
      fit: BoxFit.fill,
    );
  }

  static imageNetworkWidget(imgPath, imgHeight, imgWidth, objectfit) {
    return Image.network(
      imgPath,
      height: imgHeight,
      width: imgWidth,
      fit: objectfit ?? BoxFit.fill,
    );
  }
}
