class BagList{
  String product_id;
  int amount;
  int price;
  int oldamount;
  int oldprice;
  BagList({required this.product_id,required this.amount,required this.price,this.oldamount=-1,this.oldprice=-1});

  factory BagList.fromJson(Map<String, dynamic> json) {
    return
      BagList(
        product_id: json["product_id"],
        amount: json["amount"],
        price: json["price"],
      );
  }
}