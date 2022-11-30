// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'customer_details.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CustomerDetails _$CustomerDetailsFromJson(Map<String, dynamic> json) =>
    CustomerDetails(
      custName: json['custName'] as String?,
      emailId: json['emailId'] as String?,
      phoneNo: json['phoneNo'] as String?,
      delAgentVehicleType: json['delAgentVehicleType'] as String?,
      delAgentStatus: json['delAgentStatus'] as String?,
      custType: json['custType'] as String?,
    );

Map<String, dynamic> _$CustomerDetailsToJson(CustomerDetails instance) =>
    <String, dynamic>{
      'custName': instance.custName,
      'emailId': instance.emailId,
      'phoneNo': instance.phoneNo,
      'delAgentVehicleType': instance.delAgentVehicleType,
      'delAgentStatus': instance.delAgentStatus,
      'custType': instance.custType,
    };
