import 'package:json_annotation/json_annotation.dart';

part 'login_customer.g.dart';

@JsonSerializable()
class LoginCustomer {
  @JsonKey(name: 'custId')
  final int? customerId;

  @JsonKey(name: 'custName')
  final String? customerName;

  @JsonKey(name: 'emailId')
  final String? emailId;

  @JsonKey(name: 'phoneNo')
  final String? phoneNo;

  @JsonKey(name: 'token')
  final String? token;

  @JsonKey(name: 'roleId')
  final int? roleId;

  @JsonKey(name: 'userName')
  final String? userName;

  @JsonKey(name: 'password')
  final String? password;

  LoginCustomer(
      {this.customerId,
      this.customerName,
      this.emailId,
      this.phoneNo,
      this.token,
      this.roleId,
      this.userName,
      this.password});

  factory LoginCustomer.fromJson(Map<String, dynamic> json) =>
      _$LoginCustomerFromJson(json);
  Map<String, dynamic> toJson() => _$LoginCustomerToJson(this);
}
