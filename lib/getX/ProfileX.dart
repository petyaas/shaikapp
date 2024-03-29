import 'dart:convert';

import 'package:get/get.dart';
import 'package:shaikapp/consts.dart';
import 'package:shaikapp/getX/productX.dart';

import 'package:shaikapp/models/clientProfile.dart';
import 'package:shaikapp/services/Storage.dart';
import 'package:shaikapp/services/getData.dart';
import 'package:shaikapp/services/snackBAr.dart';

import 'events.dart';

  class ProfileX extends GetxController{
  LocalStorage _storage = LocalStorage();
  Rx<xStatus> status=xStatus.empty.obs;
  final  user=ClientProfile(id: '', client_name: '', gender: -1, phone: '', address: [], status: '', create_ts: '', update_ts: '', devicetoken: '').obs;
  // ClientProfile get user => _user;
  RxBool isUserLoad=false.obs;
  final productX = Get.put(ProductX());


  @override
  void onInit() {
    getProfile();
    // if(user.value.id!=''){productX.getLikeList(user.value.id);}
    super.onInit();
  }

void setgender(int gender){
    user.value.gender=gender;
    user.refresh();
}
void setClientName(String name){
    user.value.client_name=name;
    user.refresh();
}
Future<ProfileX> init()async{
  getProfile();
    return this;
}
  Future<bool> editProfile(ClientProfile userProfile) async {
    String userToMap = jsonEncode(userProfile.toJson());
    print(userToMap);
    try {
      bool success = true;
      if (success) {
        _storage.setCurrentUser(userToMap);
        user.value = userProfile;
        productX.getLikeList(user.value.id);
        productX.getBagList(user.value.id);
        if(user.value.phone!='')
          {
            isUserLoad.value=true;
            user.refresh();
          }else {isUserLoad.value=false;}

        return true;
      }
    } catch (e) {
      throw Exception('Не удалось обновить информацию');
    }

  }

  setCurrentUser(String userJson) async {
    var userRaw = json.decode(userJson);
    user.value = ClientProfile.fromJson(userRaw);
  }

  setTokenUser(String id,String device_token) async {
    GetData().setToken(id, device_token);
  }

  getProfile() async {
    String profile = await _storage.getCurrentUser();
    print(profile);
    if (profile.isNotEmpty) {
      Map<String, dynamic> map = jsonDecode(profile);
     print('getetprofil-'+map.toString());
      user.value = ClientProfile.fromJson(map);
      productX.getLikeList(user.value.id);
      productX.getBagList(user.value.id);
      isUserLoad.value=true;
    }else
    {
      print('EmptyProfile');
      user.value = ClientProfile.emptyProf();
      isUserLoad.value=false;
    }

    isUserLoad.refresh();
    user.refresh();
  }

  removeProfile() async {
    user.value=ClientProfile.emptyProf();
    productX.likeList.value=[];
    productX.bagList.value=[];
    user.refresh(); productX.likeList.refresh(); productX.bagList.refresh();
    isUserLoad.value=false;
    await _storage.removeCurrentUser();
  }
  
  toOrder(String address,String phone,String order_name,String delivery_date)async{

   if(await GetData().toOrder(user.value.id,address,phone,order_name,delivery_date)==true)
     {
       ShowSnackBar('SHAIK', DefText.orderSent.tr);
       productX.getBagList(user.value.id);
       productX.getBagByListId(productX.bagList.value);

       // productX.getBagByListId(productX.bagList.value);
     }
   else{
     ShowSnackBar('SHAIK', DefText.orderNotSent.tr);

   }
    
  }
  
}