import 'dart:convert';

import 'package:shaikapp/consts.dart';
import 'package:dio/dio.dart';
import 'package:shaikapp/models/category_list.dart';
import 'package:shaikapp/models/products.dart';
import 'package:shaikapp/models/slider_list.dart';

class GetData {
 Future<List<SliderList>> getSliderLIst()async{
   Response? _response;
   Map<String, dynamic> _map;
   List<dynamic>? _temp;
   _response=await _postData(ApiLinks.sliderList, null, '');
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

  Future<Response> _postData(
      String endpoint, FormData? body, String token) async {
    var dio = Dio();
    // FormData formData;
    // if (body.length>0){formData = new FormData.fromMap(jsonDecode(body));}else{formData;}
    //
    Response  q;
    if (body!=null){print(body.fields.toString());}


    if (token.length > 0) {
      print('token-true');
      q = await dio.post(ApiLinks.host+endpoint,
        // data: formData,
        options: Options(headers: {
            'authorization': '$token',
        })
        // headers: <String, String>{
        // },
        // body: body,
      );
    } else {
      print('token-false');
      print('mla='+ApiLinks.host+endpoint);
      q = await dio.post(ApiLinks.host+endpoint,

          data: body,
          // options: Options(headers: {
          //   'authorization': '$token',
          );
    }
    if (q.statusCode == 200) {
      print('normalno='+q.data.toString());
      // Map<String, dynamic> _temp;
      // List<dynamic> _listmap=[];
      //
      // _temp = q.data;
      // print(_temp);
      //
      // _listmap=_temp['data'];
      // print(_listmap.runtimeType);
      return q;
    } else {
      print('erere'+q.data.toString());
      throw Exception(endpoint + '-load error');
    }
  }
}
