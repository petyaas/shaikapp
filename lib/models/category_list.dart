class CategoryList{
  String id;
  String name_tk;
  String name_ru;
  String img_tk;
  String img_ru;
  String create_ts;
  String update_ts;
  CategoryList({
    required this.id,
    required this.name_tk,
    required this.name_ru,
    required this.img_tk,
    required this.img_ru,
    required this.create_ts,
    required this.update_ts,
});

  factory CategoryList.fromJson(Map<String, dynamic> json) {
    return
      CategoryList(
        id: json["id"],
        name_tk: json["name_tk"],
        name_ru: json["name_ru"],
        img_tk: json["img_tk"],
        img_ru: json["img_ru"],
        create_ts: json["create_ts"],
        update_ts:json["update_ts"],
      );
  }

  CategoryList empty(){
    return CategoryList(id: '',
        name_tk: '',
        name_ru: '',
        img_tk: '',
        img_ru: '',
        create_ts: '',
        update_ts: '');
  }
}