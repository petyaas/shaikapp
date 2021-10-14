import 'package:get/get.dart';
import 'package:shaikapp/models/slider_list.dart';
import 'package:shaikapp/services/getData.dart';

import 'events.dart';

class SliderGetX extends GetxController{
  RxList<SliderList>? listOfSliders = <SliderList>[].obs;
  Rx<xStatus> status=xStatus.empty.obs;

  @override
  void onInit() {
    // getSliders();
    super.onInit();
  }
  @override
  void getSliders()async{
    status.value=xStatus.loading;
    //TODO try goshmaly
// try{
      listOfSliders!.value=await GetData().getSliderLIst();
      status.value=xStatus.loaded;
    // }catch(_){
    //   status.value=xStatus.empty;
    // }
  }
  Future<SliderGetX> init() async {
    getSliders();
    return this;
  }

}