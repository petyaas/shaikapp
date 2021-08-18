import 'package:get/get.dart';
import 'package:shaikapp/getX/events.dart';
class ScreenControllerX extends GetxController{
  Rx<xScreen> screen=xScreen.homepage.obs;
  RxInt screenIndex=0.obs;
  void setIndex(int index){
    if(index==0){
      screenIndex.value=index;
      screen.value=xScreen.homepage;
    }
    if(index==1){
      screenIndex.value=index;
      screen.value=xScreen.category;
    }
    if(index==2){
      screenIndex.value=index;
      screen.value=xScreen.shopbag;
    }
    if(index==3){
      screenIndex.value=index;
      screen.value=xScreen.liked;
    }
    if(index==4){
      screenIndex.value=index;
      screen.value=xScreen.profil;
    }
  }

}