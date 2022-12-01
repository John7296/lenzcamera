import 'package:lenzcamera/model/customer_details.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:lenzcamera/model/login_customer.dart';

part 'customer.g.dart';

@JsonSerializable()
class Customer{
   LoginCustomer? data;

 Customer();

  factory Customer.fromJson(Map<String, dynamic> json) =>
      _$CustomerFromJson(json);
  Map<String, dynamic> toJson() => _$CustomerToJson(this);
}