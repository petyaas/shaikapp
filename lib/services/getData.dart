import 'dart:convert';

import 'package:shaikapp/consts.dart';
import 'package:dio/dio.dart';
import 'package:shaikapp/models/bag_list.dart';
import 'package:shaikapp/models/category_list.dart';

import 'package:shaikapp/models/clientProfile.dart';
import 'package:shaikapp/models/orderInfo.dart';
import 'package:shaikapp/models/products.dart';
import 'package:shaikapp/models/slider_list.dart';

class GetData {
 Future<List<SliderList>> getSliderLIst()async{
   Response? _response;
   Map<String, dynamic> _map;
   List<dynamic>? _temp;
   // print('slider get');
   _response=await _postData(ApiLinks.sliderList, null, '');
   // print('slider get2');
   // print(_response.data);
   _map=_response.data;
   _temp=_map['data'];

   return _temp!.map((json) => SliderList.fromJson(json)).toList();
  }
 Future<List<CategoryList>> getCategoryLIst()async{
   Response? _response;
   Map<String, dynamic> _map;
   List<dynamic>? _temp;
   _response=await _postData(ApiLinks.categoryList, null, '');
   _map=_response.data;
   _temp=_map['data'];
   return _temp!.map((json) => CategoryList.fromJson(json)).toList();
 }
 Future<OrderInfo> getOrderInfo()async{
   Response? _response;
   Map<String, dynamic> _map;
   // List<dynamic>? _temp;
   _response=await _postData(ApiLinks.orderInfo, null, '');
   _map=_response.data['data'];
   // _temp=_map['data'];
   return OrderInfo.fromJson(_map);
 }
 Future<ClientProfile> codeVerify(String phone,String code,String? device_token)async{
   Response? _response;
   Map<String, dynamic> _map;
   FormData formData;
   formData=FormData.fromMap({
     'phone':phone,
     'code':code,
     'device_token':device_token,
   });

   _response=await _postData(ApiLinks.codeVerify, formData, '');
   print(_response.data);
   _map=_response.data;
   if(_map['data']!=null)
     {
       _map=_map['data'];
       if(_map['gender']=='NOT'){_map['gender']=-1;}
       if(_map['gender']=='MAN'){_map['gender']=0;}
       if(_map['gender']=='WOMAN'){_map['gender']=1;}
       return ClientProfile.fromJson(_map);
     }

   return ClientProfile.emptyProf();
 }
 Future<void> setToken(String id,String device_token)async{
   Response? _response;
   Map<String, dynamic> _map;
   FormData formData;
   formData=FormData.fromMap({
     'client_id':id,
     'device_token':device_token,
   });

   _response=await _postData(ApiLinks.setToken, formData, '');
   print(_response.data);
 }

 Future<bool> editProfile(ClientProfile profile)async{
   Response? _response;
   Map<String, dynamic> _map;
   FormData formData;
   String _gender='NOT';
   if(profile.gender==-1){_gender='not';}
   if(profile.gender==0){_gender='man';}
   if(profile.gender==1){_gender='woman';}

   formData=FormData.fromMap({
     'id':profile.id ,
     'client_name':profile.client_name,
     'phone':profile.phone,
     'address':jsonEncode(profile.address),
     'gender':_gender,
   });

   _response=await _postData(ApiLinks.editProfile, formData, '');
   print(_response.data);
   if(_response.statusCode==200){return true;}else{return false;}
 }

 Future<bool> registerClient(String phone)async{
   FormData formData;
   formData=FormData.fromMap({
     'phone':phone,
   });
   await _postData(ApiLinks.registerClient, formData, '');
   return true;
 }

 Future<bool> likeSet(String productId,String clientId)async{
   FormData formData;
   Response? _response;
   formData=FormData.fromMap({
     'product_id':productId,
     'client_id':clientId,
   });
   _response= await _postData(ApiLinks.likeSet, formData, '');
   print('likeSet-'+_response.data);
   return true;
 }
 Future<bool> addToBag(String productId,String clientId,int count,int price)async{
   FormData formData;
   Response? _response;
   formData=FormData.fromMap({
     'product_id':productId,
     'client_id':clientId,
     'amount':count,
     'price':price,
   });
   _response= await _postData(ApiLinks.addToBag, formData, '');
   print('likeSet-'+_response.data);
   return true;
 }
 Future<bool> toOrder(String client_id,String address,String phone,String order_name,String delivery_date)async{
   FormData formData;
   Response? _response;
   //client_id, address, order_name, delivery_date, phone
   formData=FormData.fromMap({
     'client_id':client_id,
     'address':address,
     'phone':phone,
     'order_name':order_name,
     'delivery_date':delivery_date,
   });
   _response= await _postData(ApiLinks.toOrder, formData, '');
   if(_response.statusCode==200)
     {return true;}else{return false;}
 }
 Future<bool> deleteFromBag(String productId,String clientId)async{
   FormData formData;
   Response? _response;
   formData=FormData.fromMap({
     'product_id':productId,
     'client_id':clientId,
   });
   _response= await _postData(ApiLinks.deleteFromBag, formData, '');
   return true;
 }

 Future<List<Products>> getProductLIst(String sub_category_id,int begin,int end)async{
   Response? _response;
   Map<String, dynamic> _map;
   List<dynamic>? _temp;
   FormData formData;
   formData=FormData.fromMap({
     'sub_category_id':sub_category_id,
     'filter':'{"begin":${begin},"end":${end}}',
   });
   _response=await _postData(ApiLinks.productList, formData, '');
   _map=_response.data;
   _temp=_map['data']['products'];

   // if(_temp[0]['total']!=0){_temp=_temp[0]['products'];}else{_temp=[];}

   return _temp!.map((json) => Products.fromJson(json)).toList();
 }

 Future<List<Products>> getListById(List<dynamic> listOfIds)async{
   Response? _response;
   Map<String, dynamic> _map;
   List<dynamic>? _temp;
   FormData formData;
   formData=FormData.fromMap({
     'id_list':jsonEncode(listOfIds),
   });
   _response=await _postData(ApiLinks.listById, formData, '');
   // print(_response.data);
   _map=_response.data;
   _temp=_map['data'];
   // print(_temp);

   // if(_temp[0]['total']!=0){_temp=_temp[0]['products'];}else{_temp=[];}

   return _temp!.map((json) => Products.fromJson(json)).toList();
 }
//GetALlLikeList data-client_id->productids
 Future<List<dynamic>?> getLikeList(String clientId)async{
   Response? _response;
   Map<String, dynamic> _map;
   List<dynamic>? temp=[];
   FormData formData;
   formData=FormData.fromMap({
     'client_id':clientId,
   });
   _response=await _postData(ApiLinks.likeListGet, formData, '');
   print(_response.data);
   _map=_response.data;

   print(_map['data']['product_id_list']);

   temp=_map['data']['product_id_list'];
   print('getLikeList='+temp.toString());
   return temp;
 }
 Future<List<BagList>?> getBagList(String clientId)async{
   Response? _response;
   Map<String, dynamic> _map;
   List<dynamic>? temp=[];
   print('getBagList-'+clientId);
   FormData formData;
   formData=FormData.fromMap({
     'client_id':clientId,
   });
   _response=await _postData(ApiLinks.bagListGet, formData, '');
   print(_response.data);
   _map=_response.data;

   print(_map['data']);

   temp=_map['data'];
   print('temp='+temp.toString());
   return temp!.map((json) => BagList.fromJson(json)).toList();
 }

  Future<Response> _postData(
      String endpoint, FormData? body, String token) async {
    var dio = Dio();
    Response  qwq;
    if (body!=null){print('_postData-'+body.fields.toString());}
      print('token-false');
      print('mla='+ApiLinks.host+endpoint);
      try {
        qwq= await dio.post(
            ApiLinks.host+endpoint,
            data: body,
            onReceiveProgress: (int sent,int total){
            }
        );
      } on DioError catch (e) {
        print('eee='+e.toString());
        if (e.response != null) {
          print(e.response!.data);
          print(e.response!.headers);
          // print(e.response!.realUri);
        } else {
          print(e.response);
          print(e.message);
        }
        qwq=e.response!;
      }
      return qwq;
    }
}
