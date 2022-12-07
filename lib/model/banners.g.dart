// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'banners.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Banners _$BannersFromJson(Map<String, dynamic> json) => Banners(
      Link: json['Link'] as String?,
      delDate: json['delDate'] as String?,
      elementName: json['elementName'] as String?,
      imageUrl: json['imageUrl'] as String?,
      mob_type: json['mob_type'] as String?,
      mob_urlKey: json['mob_urlKey'] as String?,
      position: json['position'] as int?,
      status: json['status'] as bool?,
      teId: json['teId'] as int?,
    );

Map<String, dynamic> _$BannersToJson(Banners instance) => <String, dynamic>{
      'teId': instance.teId,
      'elementName': instance.elementName,
      'imageUrl': instance.imageUrl,
      'position': instance.position,
      'status': instance.status,
      'delDate': instance.delDate,
      'Link': instance.Link,
      'mob_urlKey': instance.mob_urlKey,
      'mob_type': instance.mob_type,
    };
