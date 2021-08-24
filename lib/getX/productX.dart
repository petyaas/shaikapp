import 'package:get/get.dart';
import 'package:shaikapp/models/products.dart';
import 'package:shaikapp/services/getData.dart';

import 'categoryX.dart';
import 'events.dart';
class ProductX extends GetxController{

  RxInt total=0.obs;
  RxList<Products>? listOfProducts = <Products>[].obs;
  Rx<xStatus> status=xStatus.empty.obs;

  @override
  void getProducts(String sub_category_id,int begin,int end)async{
    status.value=xStatus.loading;
    //TODO try goshmaly
    try{
    listOfProducts!.value=await GetData().getProductLIst(sub_category_id, begin, end);
    status.value=xStatus.loaded;
    }catch(_){
      status.value=xStatus.empty;
    }
  }

}