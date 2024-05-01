import 'package:dummyapp/app/core/constants/app_label.dart';
import 'package:dummyapp/app/widgets/snackbar_cell.dart';

class Validation {
  RegExp regex =
      RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$');

  String pattern =
      r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';

  String? emailValidation(String? value) {
    RegExp regex = RegExp(pattern);
    if (value == null || value.trim().isEmpty) {
      return SnackBarWidget.showSnackBar(AppLabel.validationEmailEmptyText,
          title: "");
      // AppLabel.validationEmailEmptyText;
    }
    if (!(regex.hasMatch(value))) {
      return SnackBarWidget.showSnackBar(AppLabel.validationEmailInvalidText,
          title: "");
      // AppLabel.validationEmailInvalidText;
    }
    return null;
  }

  String? passwordValidation(String? value) {
    if (value == null || value.trim().isEmpty) {
      return SnackBarWidget.showSnackBar(AppLabel.validationPasswordEmptyText,
          title: "");
      // AppLabel.validationPasswordEmptyText;
    }
    if (!regex.hasMatch(value)) {
      return SnackBarWidget.showSnackBar(AppLabel.validationPasswordPatternText,
          title: "");
      // AppLabel.validationPasswordPatternText;
    }
    return null;
  }
}
