import 'package:get/get.dart';
import 'package:shaikapp/getX/events.dart';
import 'package:shaikapp/getX/productX.dart';
import 'package:shaikapp/models/category_list.dart';
import 'package:shaikapp/services/getData.dart';

class CategoryGetX extends GetxController{
  RxList<CategoryList>? listOfCategory = <CategoryList>[].obs;
  RxList<bool>? CategoryExpland=<bool>[].obs;
  Rx<xStatus> status=xStatus.empty.obs;

@override
  void onInit() {
  getCategory();
    super.onInit();
  }
 void _explanddefoult(int len){
  for(int i=0;i<=len-1;i++)
    CategoryExpland!.value.add(false);
  print('CategoryExpland='+CategoryExpland!.value.length.toString());
  }

  @override
  void getCategory()async{
  status.value=xStatus.loading;
  //TODO try goshmaly
  try{
    listOfCategory!.value=await GetData().getCategoryLIst();
    Get.find<ProductX>().getTopSalesList('');
    _explanddefoult(listOfCategory!.value.length);
    status.value=xStatus.loaded;
  }catch(_){
    status.value=xStatus.empty;
  }
  }
}