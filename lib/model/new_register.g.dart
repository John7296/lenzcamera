// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'new_register.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NewRegister _$NewRegisterFromJson(Map<String, dynamic> json) => NewRegister(
      custId: json['custId'] as int?,
      custName: json['custName'] as int?,
      emailId: json['emailId'] as String?,
      otpUrlKey: json['otpUrlKey'] as String?,
      phoneNo: json['phoneNo'] as int?,
    );

Map<String, dynamic> _$NewRegisterToJson(NewRegister instance) =>
    <String, dynamic>{
      'custName': instance.custName,
      'custId': instance.custId,
      'otpUrlKey': instance.otpUrlKey,
      'phoneNo': instance.phoneNo,
      'emailId': instance.emailId,
    };
