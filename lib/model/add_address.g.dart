// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'add_address.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AddAddress _$AddAddressFromJson(Map<String, dynamic> json) => AddAddress(
      addLine1: json['addLine1'] as String?,
      addLine2: json['addLine2'] as String?,
      addressType: json['addressType'] as String?,
      country: json['country'] as String?,
      custId: json['custId'] as String?,
      district: json['district'] as String?,
      firstName: json['firstName'] as String?,
      isDefaultBillingAddress: json['isDefaultBillingAddress'] as String?,
      isDefaultShippingAddress: json['isDefaultShippingAddress'] as String?,
      landmark: json['landmark'] as String?,
      lastName: json['lastName'] as String?,
      latitude: json['latitude'] as String?,
      longitude: json['longitude'] as String?,
      phone: json['phone'] as String?,
      pincode: json['pincode'] as String?,
      state: json['state'] as String?,
    );

Map<String, dynamic> _$AddAddressToJson(AddAddress instance) =>
    <String, dynamic>{
      'addLine1': instance.addLine1,
      'addLine2': instance.addLine2,
      'addressType': instance.addressType,
      'country': instance.country,
      'custId': instance.custId,
      'district': instance.district,
      'firstName': instance.firstName,
      'isDefaultBillingAddress': instance.isDefaultBillingAddress,
      'isDefaultShippingAddress': instance.isDefaultShippingAddress,
      'landmark': instance.landmark,
      'lastName': instance.lastName,
      'latitude': instance.latitude,
      'longitude': instance.longitude,
      'phone': instance.phone,
      'pincode': instance.pincode,
      'state': instance.state,
    };
