import 'dart:convert';

List<SubCategoryList> SubCategoryListsFromJson(List<dynamic> str) {
  List<SubCategoryList> _list=[];
  if(str!=null){
    for (int i=0;i<=str.length-1;i++)
      {
        // print(i.toString()+'-'+str[i]['name_tk']);
        _list.add(SubCategoryList.fromJson(str[i]));
      }
  }
  return _list;


}

class SubCategoryList{
  String id;
  String category_id;
  String name_tk;
  String name_ru;
  Imglist img_tk;
  Imglist img_ru;
  int product_count;
  String create_ts;
  String update_ts;
  SubCategoryList(
      {
        required this.id,
        required this.category_id,
        required this.name_tk,
        required this.name_ru,
        required this.img_tk,
        required this.img_ru,
        required this.product_count,
        required this.create_ts,
        required this.update_ts
      });
  factory SubCategoryList.fromJson(Map<String, dynamic> json) {
    return
      SubCategoryList(
        id: json["id"],
        category_id: json["category_id"],
        name_tk: json["name_tk"],
        name_ru: json["name_ru"],
        product_count: json["product_count"],
        img_tk: Imglist.fromJson(json["img_tk"]),
        img_ru: Imglist.fromJson(json["img_ru"]),
        create_ts: json["create_ts"],
        update_ts: json["update_ts"],
      );
  }

}
class Imglist{
  String little;
  String middle;
  String big;

  Imglist({required this.little,required this.middle,required this.big});

  factory Imglist.fromJson(Map<String, dynamic> json) {
    return
      Imglist(
        little: json["little"],
        middle: json["middle"],
        big: json["big"],
      );
  }
}

List<CategoryList> CategoryListFromJson(String str) {
  return List<CategoryList>.from(
      json.decode(str).map((x) => CategoryList.fromJson(x))
  );

}

class CategoryList{
  String id;
  String name_tk;
  String name_ru;
  Imglist img_tk;
  Imglist img_ru;
  String create_ts;
  String update_ts;
  List<SubCategoryList> sub_category_list;
  CategoryList({
    required this.id,
    required this.name_tk,
    required this.name_ru,
    required this.img_tk,
    required this.img_ru,
    required this.sub_category_list,
    required this.create_ts,
    required this.update_ts,
});

  factory CategoryList.fromJson(Map<String, dynamic> json) {
    return
      CategoryList(
        id: json["id"],
        name_tk: json["name_tk"],
        name_ru: json["name_ru"],
        img_tk:  Imglist.fromJson(json["img_tk"]),
        img_ru: Imglist.fromJson(json["img_ru"]),
        sub_category_list: SubCategoryListsFromJson(json["sub_category_list"]),
        create_ts: json["create_ts"],
        update_ts:json["update_ts"],
      );
  }

}