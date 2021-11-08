class OrderInfo{
  bool delivery;
  String hour;
  int delivery_price;
  int toDay;
  String deliveryHour;
  double dminMinute;
  double dmaxMinute;
  String deliverDate;

  OrderInfo({required this.delivery,required this.hour,required this.delivery_price,required this.toDay,required this.deliveryHour,required this.dminMinute,required this.dmaxMinute,required this.deliverDate});

  factory OrderInfo.fromJson(Map<String, dynamic> json) {
    return
      OrderInfo(
        delivery: json["delivery"],
        hour: json["hour"],
        delivery_price: json["delivery_price"],
        toDay: 0,
        deliveryHour: '',
        dminMinute: 0,
        dmaxMinute: 0,
        deliverDate: '',
      );
  }

}