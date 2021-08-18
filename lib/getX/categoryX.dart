import 'package:get/get.dart';
import 'package:shaikapp/getX/events.dart';
import 'package:shaikapp/models/category_list.dart';
import 'package:shaikapp/services/getData.dart';

class CategoryGetX extends GetxController{
  RxList<CategoryList>? listOfCategory = <CategoryList>[].obs;
  Rx<xStatus> status=xStatus.empty.obs;

@override
  void onInit() {
  getCategory();
    super.onInit();
  }
  @override
  void getCategory()async{
  status.value=xStatus.loading;
  // try{
    listOfCategory!.value=await GetData().getCategoryLIst();
    status.value=xStatus.loaded;
  // }catch(_){
  //   status.value=xStatus.empty;
  // }
  }
}