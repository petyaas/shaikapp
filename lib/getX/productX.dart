import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:shaikapp/consts.dart';
import 'package:shaikapp/models/bag_list.dart';
import 'package:shaikapp/models/orderInfo.dart';
import 'package:shaikapp/models/products.dart';
import 'package:shaikapp/services/getData.dart';
import 'package:shaikapp/services/snackBAr.dart';

import 'ProfileX.dart';
import 'categoryX.dart';
import 'events.dart';
class ProductX extends GetxController{

  RxInt totalPrice=0.obs;
  RxList<Products>? listOfProducts = <Products>[].obs;
  RxList<bool>? likeProduct = <bool>[].obs;
  Rx<xStatus> productStatus=xStatus.empty.obs;
  Rx<xStatus> likeStatus=xStatus.empty.obs;
  Rx<xStatus> byListIdStatus=xStatus.empty.obs;
  RxList<dynamic> likeList=<dynamic>[].obs;
  RxList<BagList> bagList=<BagList>[].obs;
  RxList<Products> topSalesbagList=<Products>[].obs;
  RxList<Products> topManSalesbagList=<Products>[].obs;
  RxList<Products> topWomanSalesbagList=<Products>[].obs;
  RxList<Products> topUnisexSalesbagList=<Products>[].obs;
  RxList<Products> topChildSalesbagList=<Products>[].obs;
  Rx<xStatus> bagListStatus=xStatus.empty.obs;
  Rx<xStatus> topSalesList=xStatus.empty.obs;
  RxBool checkBagNotify=false.obs;
  RxBool orderNotSup=false.obs;
  final  orderInfo=OrderInfo(delivery: true, hour: '0', delivery_price: 0, toDay: 0, deliveryHour: '', dminMinute: 0, dmaxMinute: 0, deliverDate: '').obs;

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
      checkBagList();
      checkTotalPrice();
      productStatus.value=xStatus.loaded;
    }catch(_){
      productStatus.value=xStatus.empty;
    }
  }
  @override
  void getOrderInfo()async{
    try{
      orderInfo.value=await GetData().getOrderInfo();
      checkTimeDeliver();
    }catch(_){
    }
  }
  void checkTimeDeliver(){
    int hour=int.parse((orderInfo.value.hour.substring(0,orderInfo.value.hour.indexOf(":"))));
    print('hpihph='+hour.toString());
    if(orderInfo.value.toDay==0)
      {
        if(hour>=21)
        {
          orderInfo.value.toDay=1;
          orderNotSup.value=true;
          // ShowSnackBar('SHAIK', DefText.deliveryNotSupDay.tr);
          orderInfo.value.dminMinute=9;
          orderInfo.value.dmaxMinute=21;
          orderInfo.value.deliveryHour=DateFormat("HH:ss").format(DateTime(DateTime.now().year,0,0,orderInfo.value.dminMinute.toInt(),0));
        }
        else{
          if((hour>=0)&&(hour<=9))
          {
            if(hour<3){
              orderNotSup.value=true;
              orderInfo.value.toDay=1;
              // ShowSnackBar('SHAIK', DefText.deliveryNotSupDay.tr);
            }
            orderInfo.value.dminMinute=9;
            orderInfo.value.dmaxMinute=21;
            orderInfo.value.deliveryHour=DateFormat("HH:ss").format(DateTime(DateTime.now().year,0,0,orderInfo.value.dminMinute.toInt(),0));
          }
          else{
            orderInfo.value.dminMinute=hour.toDouble();
            orderInfo.value.dmaxMinute=21;
            orderInfo.value.deliveryHour=DateFormat("HH:ss").format(DateTime(DateTime.now().year,0,0,orderInfo.value.dminMinute.toInt(),0));
          }
        }
      }else{
      orderInfo.value.dminMinute=9;
      orderInfo.value.dmaxMinute=21;
      orderInfo.value.deliveryHour=DateFormat("HH:ss").format(DateTime(DateTime.now().year,0,0,orderInfo.value.dminMinute.toInt(),0));
    }
    if(orderInfo.value.toDay==0){orderInfo.value.deliverDate= DateFormat("yyyy-MM-dd").format(DateTime.now())+' '+orderInfo.value.deliveryHour;}
    if(orderInfo.value.toDay==1){orderInfo.value.deliverDate= DateFormat("yyyy-MM-dd").format(DateTime.now().add(Duration(days: 1)))+' '+orderInfo.value.deliveryHour;}

    orderInfo.refresh();
  }
  void setOrderDay(int b){
    orderNotSup.value=false;
    orderInfo.value.toDay=b;
    checkTimeDeliver();

    orderInfo.refresh();
  }
  void setDeliveryTime(String time){
    orderInfo.value.deliveryHour=time+'0';
    if(orderInfo.value.toDay==0){orderInfo.value.deliverDate= DateFormat("yyyy-MM-dd").format(DateTime.now())+' '+orderInfo.value.deliveryHour;}
    if(orderInfo.value.toDay==1){orderInfo.value.deliverDate= DateFormat("yyyy-MM-dd").format(DateTime.now().add(Duration(days: 1)))+' '+orderInfo.value.deliveryHour;}
    orderInfo.refresh();
  }
  @override
  void getByListId(List<dynamic> listOfId)async{
    print('listOfId'+listOfId.length.toString());
    byListIdStatus.value=xStatus.loading;
    try{
      listOfProducts!.value=await GetData().getListById(listOfId);
      // print('getByListId-'+listOfProducts!.value.length.toString());
      // getOrderInfo();
      checkLike();
      checkBagList();
      checkTotalPrice();

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
    listOfProducts!.value=[];
    byListIdStatus.value=xStatus.loading;
    try{
      if(_temp.length!=0){listOfProducts!.value=await GetData().getListById(_temp);}else{listOfProducts!.value=[];}
      getOrderInfo();
      checkLike();
      checkBagList();
      checkTotalPrice();
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
      checkBagList();
    }catch(_){
      likeStatus.value=xStatus.error;
    }
  }
  @override
  void getBagList(String clientId)async{
    bagListStatus.value=xStatus.loading;
    bagList.value=[];
    try{
      bagList.value=(await GetData().getBagList(clientId))!;
      print('getBagList-'+bagList.value.length.toString());
      bagListStatus.value=xStatus.loaded;
      // getOrderInfo();
      checkLike();
      checkBagList();
      checkTotalPrice();
    }catch(_){
      bagListStatus.value=xStatus.error;
    }
  }

  @override
  void getTopSalesList(String category_id)async{
    topSalesList.value=xStatus.loading;
    topSalesbagList.value=[];
    try{
      topSalesbagList.value=(await GetData().getTopSalesList(''))!;
      topManSalesbagList.value=(await GetData().getTopSalesList(Get.find<CategoryGetX>().listOfCategory!.value[0].id))!;
      topWomanSalesbagList.value=(await GetData().getTopSalesList(Get.find<CategoryGetX>().listOfCategory!.value[1].id))!;
      topUnisexSalesbagList.value=(await GetData().getTopSalesList(Get.find<CategoryGetX>().listOfCategory!.value[2].id))!;
      topChildSalesbagList.value=(await GetData().getTopSalesList(Get.find<CategoryGetX>().listOfCategory!.value[3].id))!;
      print('getTopSalesList-'+topSalesbagList.value.length.toString());
      // getOrderInfo();
      topSalesList.value=xStatus.loaded;
      topSalesbagList.refresh();
      topManSalesbagList.refresh();
      topWomanSalesbagList.refresh();
      topUnisexSalesbagList.refresh();
      topChildSalesbagList.refresh();
      checkLike();
      checkBagList();
      checkTotalPrice();
    }catch(_){
      topSalesList.value=xStatus.error;
    }
  }

  void checkTotalPrice(){
    if(bagList.value.length!=0)
      {
        totalPrice.value=0;
        bagList.value.forEach((element) {
          totalPrice.value=totalPrice.value+(element.price*element.amount);
        });
      }
    else{totalPrice.value=0;}

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
      checkBagList();

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
        checkTotalPrice();
        likeStatus.value = xStatus.loaded;
      } catch (_) {
        likeStatus.value = xStatus.empty;
      }
    }


  Future<void> checkBagList()async {
    for (int i=0;i<=listOfProducts!.value.length-1;i++)
    {
      for(int j=0;j<=bagList.value.length-1;j++)
        {
          if(listOfProducts!.value[i].id==bagList.value[j].product_id)
          {
            if(listOfProducts!.value[i].count<bagList.value[j].amount)
            {
              bagList.value[j].oldamount=bagList.value[j].amount;
              bagList.value[j].amount=listOfProducts!.value[i].count;
              checkBagNotify.value=true;
            }
            if(listOfProducts!.value[i].new_price!=bagList.value[j].price)
            {
              bagList.value[j].oldprice=bagList.value[j].price;
              bagList.value[j].price=listOfProducts!.value[i].new_price;
              checkBagNotify.value=true;
            }
          }
        }
    }
    checkTotalPrice();
  }

  void addBagNotify(String clientId){
    checkBagNotify.value=false;
    for (int i=0;i<=listOfProducts!.value.length-1;i++)
    {
      for(int j=0;j<=bagList.value.length-1;j++)
      {
        if(listOfProducts!.value[i].id==bagList.value[j].product_id)
        {
          addBag(clientId,listOfProducts!.value[i].id,bagList.value[j].amount,bagList.value[j].price);
          bagList.value[j].oldprice=-1; bagList.value[j].oldamount=-1;
        }
      }
    }
    checkBagList();
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
      checkTotalPrice();

      // checkLike();
      // getByListId(likeList.value);
      likeStatus.value = xStatus.loading;
      try {
        await GetData().addToBag(productId, clientId,count,price);
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