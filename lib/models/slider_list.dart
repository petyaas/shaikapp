import 'dart:convert';

List<SliderList> dataClassFromJson(String str) {
  return List<SliderList>.from(
      json.decode(str).map((x) => SliderList.fromJson(x))
  );

}

class SliderList{
  String id;
  String img_tk;
  String img_ru;
  String create_ts;
  String update_ts;
  SliderList({required this.id,required this.img_tk,required this.img_ru,required this.create_ts,required this.update_ts});

  factory SliderList.fromJson(Map<String, dynamic> json) {
    return
      SliderList(
        id: json["id"],
        img_tk: json["img_tk"],
        img_ru: json["img_ru"],
        create_ts: json["create_ts"],
        update_ts:json["update_ts"],
      );
  }
}