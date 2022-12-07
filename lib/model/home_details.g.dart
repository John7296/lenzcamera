// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_details.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

HomeDetails _$HomeDetailsFromJson(Map<String, dynamic> json) => HomeDetails(
      MobileMainBanners: (json['MobileMainBanners'] as List<dynamic>?)
          ?.map((e) => Banners.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$HomeDetailsToJson(HomeDetails instance) =>
    <String, dynamic>{
      'MobileMainBanners': instance.MobileMainBanners,
    };
