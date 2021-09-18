import 'dart:convert';

import 'package:get/get.dart';
import 'package:shaikapp/getX/productX.dart';

import 'package:shaikapp/models/clientProfile.dart';
import 'package:shaikapp/services/Storage.dart';
import 'package:shaikapp/services/getData.dart';

import 'events.dart';

  class ProfileX extends GetxController{
  LocalStorage _storage = LocalStorage();
  Rx<xStatus> status=xStatus.empty.obs;
  final  user=ClientProfile(id: '', client_name: '', gender: -1, phone: '', addres: [], status: '', create_ts: '', update_ts: '').obs;
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

  Future<bool> editProfile(ClientProfile userProfile) async {
    String userToMap = jsonEncode(userProfile.toJson());
    print(userToMap);
    try {
      bool success = true;
      if (success) {
        _storage.setCurrentUser(userToMap);
        user.value = userProfile;
        productX.getLikeList(user.value.id);
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

  getProfile() async {
    String profile = await _storage.getCurrentUser();
    print(profile);
    if (profile.isNotEmpty) {
      Map<String, dynamic> map = jsonDecode(profile);
     print('getetprofil-'+map.toString());
      user.value = ClientProfile.fromJson(map);
      productX.getLikeList(user.value.id);
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
    user.refresh();
    isUserLoad.value=false;
    await _storage.removeCurrentUser();
  }
}