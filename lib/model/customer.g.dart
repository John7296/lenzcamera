// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'customer.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Customer _$CustomerFromJson(Map<String, dynamic> json) => Customer()
  ..data = json['data'] == null
      ? null
      : LoginCustomer.fromJson(json['data'] as Map<String, dynamic>);

Map<String, dynamic> _$CustomerToJson(Customer instance) => <String, dynamic>{
      'data': instance.data,
    };
