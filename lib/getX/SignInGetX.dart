import 'package:get/get.dart';
import 'package:shaikapp/models/clientProfile.dart';
import 'package:shaikapp/services/getData.dart';
import 'package:shaikapp/services/snackBAr.dart';
import 'ProfileX.dart';
import 'events.dart';
import 'package:flutter/material.dart';
class SignInGetX extends GetxController{
  Rx<xSignIn> status=xSignIn.enternumber.obs;
  final profileX = Get.put(ProfileX());
  void sendSMS(String phone)async{
    status.value=xSignIn.loadign;
    // try{
     await GetData().registerClient(phone);
      // status.value=xSignIn.entercode;
      // status.value=xSignIn.entercode;
    // }catch(_){
    //   throw(_);
    // }
  }
  void VerifyCode(String phone,String code,String? device_token)async{
    status.value=xSignIn.loadign;
    ClientProfile _profile;
    _profile=await GetData().codeVerify(phone, code,device_token);
    if(_profile.phone!=''){
      profileX.editProfile(_profile);
      status.value=xSignIn.completed;
    }
    else{
      ShowSnackBar('SHAIK','erorrcode');
      status.value=xSignIn.entercode;
    }

    // status.value=xSignIn.
  }


}