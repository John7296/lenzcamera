// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'address_list.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AddressList _$AddressListFromJson(Map<String, dynamic> json) => AddressList(
      isDefaultBillingAddress: json['isDefaultBillingAddress'] as bool?,
      addLine1: json['addLine1'] as String?,
      addressType: json['addressType'] as String?,
      area: json['area'] as String?,
      country: json['country'] as String?,
      custAdressId: json['custAdressId'] as int?,
      custId: json['custId'] as int?,
      delDate: json['delDate'] as String?,
      district: json['district'] as String?,
      firstName: json['firstName'] as String?,
      isDefaultShippingAddress: json['isDefaultShippingAddress'] as bool?,
      lastName: json['lastName'] as String?,
      latitude: json['latitude'] as String?,
      longitude: json['longitude'] as String?,
      middleName: json['middleName'] as String?,
      phone: json['phone'] as String?,
      pincode: json['pincode'] as String?,
      state: json['state'] as String?,
      taluk: json['taluk'] as String?,
      landmark: json['landmark'] as String?,
      addLine2: json['addLine2'] as String?,
      addLine3: json['addLine3'] as String?,
    );

Map<String, dynamic> _$AddressListToJson(AddressList instance) =>
    <String, dynamic>{
      'custAdressId': instance.custAdressId,
      'custId': instance.custId,
      'firstName': instance.firstName,
      'middleName': instance.middleName,
      'lastName': instance.lastName,
      'addLine1': instance.addLine1,
      'addLine2': instance.addLine2,
      'addLine3': instance.addLine3,
      'pincode': instance.pincode,
      'phone': instance.phone,
      'state': instance.state,
      'district': instance.district,
      'taluk': instance.taluk,
      'longitude': instance.longitude,
      'latitude': instance.latitude,
      'delDate': instance.delDate,
      'addressType': instance.addressType,
      'country': instance.country,
      'area': instance.area,
      'isDefaultShippingAddress': instance.isDefaultShippingAddress,
      'isDefaultBillingAddress': instance.isDefaultBillingAddress,
      'landmark': instance.landmark,
    };
