// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'filter_products.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FilterProducts _$FilterProductsFromJson(Map<String, dynamic> json) =>
    FilterProducts(
      catId: json['catId'] as int?,
      catName: json['catName'] as String?,
      image: json['image'] as String?,
      parentId: json['parentId'] as int?,
      code: json['code'] as int?,
      description: json['description'] as String?,
      urlKey: json['urlKey'] as String?,
      metaTitle: json['metaTitle'] as String?,
      metaKeywords: json['metaKeywords'] as String?,
      metaDescription: json['metaDescription'] as String?,
      delDate: json['delDate'] as String?,
      status: json['status'] as String?,
      catUrlKey: json['catUrlKey'] as String?,
      imageUrl: json['imageUrl'] as String?,
      position: json['position'] as String?,
      ShowInOfferZone: json['ShowInOfferZone'] as String?,
      showInHomePage: json['showInHomePage'] as String?,
      bannerImgUrl: json['bannerImgUrl'] as String?,
      MobbannerImgUrl: json['MobbannerImgUrl'] as String?,
      minPrize: json['minPrize'] as String?,
      maxPrize: json['maxPrize'] as String?,
    );

Map<String, dynamic> _$FilterProductsToJson(FilterProducts instance) =>
    <String, dynamic>{
      'catId': instance.catId,
      'catName': instance.catName,
      'image': instance.image,
      'parentId': instance.parentId,
      'code': instance.code,
      'description': instance.description,
      'urlKey': instance.urlKey,
      'metaTitle': instance.metaTitle,
      'metaKeywords': instance.metaKeywords,
      'metaDescription': instance.metaDescription,
      'delDate': instance.delDate,
      'status': instance.status,
      'catUrlKey': instance.catUrlKey,
      'imageUrl': instance.imageUrl,
      'position': instance.position,
      'ShowInOfferZone': instance.ShowInOfferZone,
      'showInHomePage': instance.showInHomePage,
      'bannerImgUrl': instance.bannerImgUrl,
      'MobbannerImgUrl': instance.MobbannerImgUrl,
      'minPrize': instance.minPrize,
      'maxPrize': instance.maxPrize,
    };
