// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'profile.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Profile _$ProfileFromJson(Map<String, dynamic> json) => Profile(
      custName: json['custName'] as String?,
      custType: json['custType'] as String?,
      delAgentVehicleType: json['delAgentVehicleType'] as String?,
      emailId: json['emailId'] as String?,
      phoneNo: json['phoneNo'] as String?,
      delAgentStatus: json['delAgentStatus'] as String?,
    );

Map<String, dynamic> _$ProfileToJson(Profile instance) => <String, dynamic>{
      'custName': instance.custName,
      'emailId': instance.emailId,
      'phoneNo': instance.phoneNo,
      'delAgentVehicleType': instance.delAgentVehicleType,
      'delAgentStatus': instance.delAgentStatus,
      'custType': instance.custType,
    };
