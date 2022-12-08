// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_images.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProductImages _$ProductImagesFromJson(Map<String, dynamic> json) =>
    ProductImages(
      imageUrl: json['imageUrl'] as String?,
      position: json['position'] as int?,
      imgType: json['imgType'] as String?,
    );

Map<String, dynamic> _$ProductImagesToJson(ProductImages instance) =>
    <String, dynamic>{
      'imageUrl': instance.imageUrl,
      'position': instance.position,
      'imgType': instance.imgType,
    };
