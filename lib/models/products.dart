import 'category_list.dart';

List<Products> ProductsListFromJson(List<dynamic> str) {
  List<Products> _list=[];
  if(str!=null){
    for (int i=0;i<=str.length-1;i++)
    {
      // print(i.toString()+'-'+str[i]['name_tk']);
      _list.add(Products.fromJson(str[i]));
    }
  }
  return _list;


}
class Products{
String id;
String sub_category_id;
String code;
String analog_tk;
String analog_ru;
Imglist img_tk;
Imglist img_ru;
int volume;
int old_price;
int new_price;
int visited;
int buying;
int like_count;
String status;
List<dynamic> about_tk;
List<dynamic> about_ru;
String create_ts;
String update_ts;
Products({
  required this.id,
  required this.sub_category_id,
  required this.code,
  required this.analog_tk,
  required this.analog_ru,
  required this.img_tk,
  required this.img_ru,
  required this.volume,
  required this.old_price,
  required this.new_price,
  required this.visited,
  required this.buying,
  required this.like_count,
  required this.status,
  required this.about_tk,
  required this.about_ru,
  required this.create_ts,
  required this.update_ts
});
factory Products.fromJson(Map<String, dynamic> json) {
  return
    Products(
      id: json["id"],
      sub_category_id: json["sub_category_id"],
      code: json["code"],
      analog_tk: json["analog_tk"],
      analog_ru: json["analog_ru"],
      img_tk:Imglist.fromJson(json["img_tk"]),
      img_ru: Imglist.fromJson(json["img_ru"]),
      volume: json["volume"],
      old_price: json["old_price"],
      new_price: json["new_price"],
      visited:json ["visited"],
      buying:json ["buying"],
      like_count:json ["like_count"],
      status: json["status"],
      about_tk:json ["about_tk"],
      about_ru: json["about_ru"],
      create_ts: json["create_ts"],
      update_ts: json["update_ts"],
    );
}

}