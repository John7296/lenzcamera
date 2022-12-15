// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_location.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Location _$LocationFromJson(Map<String, dynamic> json) => Location(
      area: json['area'] as String?,
      pincode: json['pincode'] as String?,
      pincodeId: json['pincodeId'] as int?,
      place: json['place'] as String?,
    );

Map<String, dynamic> _$LocationToJson(Location instance) => <String, dynamic>{
      'pincodeId': instance.pincodeId,
      'area': instance.area,
      'pincode': instance.pincode,
      'place': instance.place,
    };
