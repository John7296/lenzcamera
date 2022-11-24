// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'company_policy.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CompanyPolicy _$CompanyPolicyFromJson(Map<String, dynamic> json) =>
    CompanyPolicy(
      name: json['stName'] as String?,
      value: json['stValue'] as String?,
    );

Map<String, dynamic> _$CompanyPolicyToJson(CompanyPolicy instance) =>
    <String, dynamic>{
      'stName': instance.name,
      'stValue': instance.value,
    };
