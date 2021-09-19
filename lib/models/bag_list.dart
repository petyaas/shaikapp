class BagList{
  String product_id;
  int count;
  BagList({required this.product_id,required this.count});

  factory BagList.fromJson(Map<String, dynamic> json) {
    return
      BagList(
        product_id: json["product_id"],
        count: json["count"],
      );
  }
}