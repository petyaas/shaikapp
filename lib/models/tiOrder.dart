class ToOrder{
  //client_id, address, order_name, delivery_date, phone
  String client_id;
  String address;
  String order_name;
  String delivery_date;
  String phone;
  ToOrder({
    required this.client_id,
    required this.address,
    required this.order_name,
    required this.delivery_date,
    required this.phone,
});
  Map<String, dynamic> toJson() => {
    'client_id': client_id,
    'address': address,
    'order_name': order_name,
    'delivery_date': delivery_date,
    'phone': phone,
  };
}