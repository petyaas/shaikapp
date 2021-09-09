import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:shaikapp/style.dart';
void ShowSnackBar(String title,String massage) {
  return Get.snackbar(

    title,
    massage,
    colorText: Colors.white,
    backgroundColor: AppColor.backgroundcolor,
    // icon: Icon(Icons.person, color: Colors.white),
    snackPosition: SnackPosition.TOP,
  );
}
