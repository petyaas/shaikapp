import 'dart:convert';

class ClientProfile{
  String id;
  String client_name=' ';
  int gender;
  String phone;
  List<dynamic> addres=[];
  String status;
  String devicetoken;
  String create_ts;
  String update_ts;
  ClientProfile({
    required this.id,
    required this.client_name,
    required this.gender,
    required this.phone,
    required this.addres,
    required this.status,
    required this.create_ts,
    required this.update_ts,
    required this.devicetoken,
});

  factory ClientProfile.fromJson(Map<String, dynamic> json) => ClientProfile(
    id: json["id"],
    client_name: json["client_name"]??"",
    gender: json["gender"],
    phone: json["phone"],
    addres: json["addres"]??[],
    status: json["status"],
    create_ts: json["create_ts"],
    update_ts: json["update_ts"],
    devicetoken: json["device_token"],
  );


  Map<String, dynamic> toJson() => {
    'id': id,
    'client_name': client_name,
    'gender': gender,
    'phone': phone,
    'addres': addres,
    'status': status,
    'create_ts': create_ts,
    'update_ts': update_ts,
    'device_token': devicetoken,
  };
  factory ClientProfile.emptyProf() => ClientProfile(id: '', client_name: '', phone: '', status: '', create_ts: '', update_ts: '',gender: -1, addres: [], devicetoken:'');

}
