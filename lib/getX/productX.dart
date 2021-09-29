import 'package:get/get.dart';
import 'package:shaikapp/consts.dart';
import 'package:shaikapp/models/bag_list.dart';
import 'package:shaikapp/models/products.dart';
import 'package:shaikapp/services/getData.dart';
import 'package:shaikapp/services/snackBAr.dart';

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
  RxList<BagList> bagList=<BagList>[].obs;
  Rx<xStatus> bagListStatus=xStatus.empty.obs;

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
      // print('getByListId-'+listOfProducts!.value.length.toString());
      checkLike();
      byListIdStatus.value=xStatus.loaded;
    }catch(_){
      byListIdStatus.value=xStatus.error;
    }
  }
  @override
  void getBagByListId(List<dynamic> listOfId)async{
    List<dynamic> _temp=[];
    listOfId.forEach((element) {
      _temp.add(element.product_id);
    });
    print('listOfId'+_temp.length.toString());
    byListIdStatus.value=xStatus.loading;
    try{
      listOfProducts!.value=await GetData().getListById(_temp);
      checkLike();
      byListIdStatus.value=xStatus.loaded;
    }catch(_){
      byListIdStatus.value=xStatus.error;
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
      likeStatus.value=xStatus.error;
    }
  }
  @override
  void getBagList(String clientId)async{
    bagListStatus.value=xStatus.loading;
    try{
      bagList.value=(await GetData().getBagList(clientId))!;
      print('getBagList-'+bagList.value.length.toString());
      bagListStatus.value=xStatus.loaded;
      checkLike();
    }catch(_){
      bagListStatus.value=xStatus.error;
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
      likeList.refresh();

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
    // else{}
  }
  void deleteFromBAg(String clientId,String productId)async{
      likeStatus.value = xStatus.loading;
      try {
        await GetData().deleteFromBag(productId, clientId);
        getLikeList(clientId);
        likeStatus.value = xStatus.loaded;
      } catch (_) {
        likeStatus.value = xStatus.empty;
      }
    }


  Future<void> checkBagList()async {
    for (int i=0;i<=listOfProducts!.value.length-1;i++)
    {
      if(listOfProducts!.value[i].count<bagList.value[i].amount)
        {
          if(listOfProducts!.value[i].count==0){
          }
          else {
            // productX.addBag(profileX.user.value.id, product.id, product.count);

          }
        }

    }

  }

  Future<void> addBag(String clientId,String productId,int count,int price)async{
    if(clientId!=''){
      bool _isFind = false;
      for (int i = 0; i <= bagList.value.length - 1; i++) {
        if (bagList.value[i].product_id == productId) {
          bagList.value[i].amount=count;
          _isFind = true;
          break;
        }
      }
      if (_isFind == false) {
        bagList.value.add(BagList(product_id: productId, amount: count, price: price));
      }
      bagList.refresh();

      // checkLike();
      // getByListId(likeList.value);
      likeStatus.value = xStatus.loading;
      try {
        await GetData().addToBag(productId, clientId,count);
        getLikeList(clientId);
        likeStatus.value = xStatus.loaded;
      } catch (_) {
        likeStatus.value = xStatus.empty;
      }
    }
    else{
      ShowSnackBar(DefText.alert.tr,DefText.signinpls.tr);
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
   bool chekLikeById(String id){
     for(int i=0;i<=likeList.value.length-1;i++)
     {
         if(likeList.value[i]==id)
         {
           return true;
         }
     }
     return false;

   }

}