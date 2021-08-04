import 'dart:convert';

import 'package:shaikapp/consts.dart';
import 'package:http/http.dart' as http;
import 'package:shaikapp/models/category_list.dart';
import 'package:shaikapp/models/slider_list.dart';

class GetData {
 Future<List<SliderList>> getSliderLIst()async{
   List<dynamic>? _temp;
   _temp=await _postData(apiConsts.sliderList, '', '');
   return _temp.map((json) => SliderList.fromJson(json)).toList();
  }
 Future<List<CategoryList>> getCategoryLIst()async{
   List<dynamic>? _temp;
   _temp=await _postData(apiConsts.categoryList, '', '');
   return _temp.map((json) => CategoryList.fromJson(json)).toList();
  }

  Future<List<dynamic>> _postData(
      String endpoint, String body, String token) async {

    final http.Response q;
    print('dededededed');

    if (token.length > 0) {
      print('token-true');
      q = await http.post(
        Uri.https(
          apiConsts.host,
          endpoint,
        ),
        headers: <String, String>{
          'authorization': '$token',
        },
        body: body,
      );
    } else {
      print('token-false');
      print('mla='+apiConsts.host+endpoint);
      q = await http.post(
        Uri.parse(
          apiConsts.host+endpoint,
        ),
      );
    }
    if (q.statusCode == 200) {
      print('normano='+q.body);
      Map<String, dynamic> _temp;
      List<dynamic> _listmap=[];

      _temp = jsonDecode(q.body);

      _listmap=_temp['data'];
      return _listmap;
    } else {
      print('erere'+q.body);
      throw Exception(endpoint + '-load error');
    }
  }
}
