// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_customer.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LoginCustomer _$LoginCustomerFromJson(Map<String, dynamic> json) =>
    LoginCustomer(
      customerId: json['custId'],
      customerName: json['custName'] as String?,
      emailId: json['emailId'] as String?,
      phoneNo: json['phoneNo'] as String?,
      token: json['token'] as String?,
      roleId: json['roleId'] as int?,
      userName: json['userName'] as String?,
      password: json['password'] as String?,
    );

Map<String, dynamic> _$LoginCustomerToJson(LoginCustomer instance) =>
    <String, dynamic>{
      'custId': instance.customerId,
      'custName': instance.customerName,
      'emailId': instance.emailId,
      'phoneNo': instance.phoneNo,
      'token': instance.token,
      'roleId': instance.roleId,
      'userName': instance.userName,
      'password': instance.password,
    };
