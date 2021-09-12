import 'package:get/get.dart';
import 'package:shaikapp/models/products.dart';
import 'package:shaikapp/services/getData.dart';

import 'ProfileX.dart';
import 'categoryX.dart';
import 'events.dart';
class ProductX extends GetxController{

  RxInt total=0.obs;
  RxList<Products>? listOfProducts = <Products>[].obs;
  RxList<bool>? likeProduct = <bool>[].obs;
  Rx<xStatus> productStatus=xStatus.empty.obs;
  Rx<xStatus> likeStatus=xStatus.empty.obs;
  Rx<xStatus> byListIdStatus=xStatus.empty.obs;
  RxList<dynamic> likeList=<dynamic>[].obs;

  // @override
  // void onInit() {
  //   // getLikeList(profileX.user.value.id);
  //   super.onInit();
  // }

  @override
  void getProducts(String sub_category_id,int begin,int end)async{
    productStatus.value=xStatus.loading;
    try{
      listOfProducts!.value=await GetData().getProductLIst(sub_category_id, begin, end);
      checkLike();
      productStatus.value=xStatus.loaded;
    }catch(_){
      productStatus.value=xStatus.empty;
    }
  }
  @override
  void getByListId(List<dynamic> listOfId)async{
    print('listOfId'+listOfId.length.toString());
    byListIdStatus.value=xStatus.loading;
    try{
      listOfProducts!.value=await GetData().getListById(listOfId);
      checkLike();
      byListIdStatus.value=xStatus.loaded;
    }catch(_){
      byListIdStatus.value=xStatus.empty;
    }
  }
  @override
  void getLikeList(String clientId)async{
    likeStatus.value=xStatus.loading;
    try{
      likeList.value=(await GetData().getLikeList(clientId))!;
      likeStatus.value=xStatus.loaded;
      checkLike();
    }catch(_){
      likeStatus.value=xStatus.empty;
    }
  }

  void setLike(String clientId,String productId)async{
    if(clientId!=''){
      bool _isFind = false;
      for (int i = 0; i <= likeList.value.length - 1; i++) {
        if (likeList.value[i] == productId) {
          likeList.value.removeAt(i);
          _isFind = true;
          break;
        }
      }
      if (_isFind == false) {
        likeList.value.add(productId);
      }
      checkLike();
      // getByListId(likeList.value);
      likeStatus.value = xStatus.loading;
      try {
        await GetData().likeSet(productId, clientId);
        getLikeList(clientId);
        likeStatus.value = xStatus.loaded;
      } catch (_) {
        likeStatus.value = xStatus.empty;
      }
    }
  }

  void checkLike(){
    likeProduct!.value=[];
    bool _isliked;
    for(int i=0;i<=listOfProducts!.value.length-1;i++)
      {
        _isliked=false;
        for(int j=0;j<=likeList.value.length-1;j++)
        if(likeList.value[j]==listOfProducts!.value[i].id)
        {
          _isliked=true;
        }
        if(_isliked==true){
          likeProduct!.value.add(true);
        }
        else{likeProduct!.value.add(false);}
      }
    // likeProduct!.refresh();
  }

}