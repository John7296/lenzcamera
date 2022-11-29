// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'search_products.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SearchProducts _$SearchProductsFromJson(Map<String, dynamic> json) =>
    SearchProducts(
      rNum: json['rNum'] as int?,
      catName: json['catName'] as String?,
      emailId: json['emailId'] as String?,
      imageUrl: json['imageUrl'] as String?,
      vendorsName: json['vendorsName'] as String?,
      roleId: json['roleId'] as int?,
      productId: json['productId'] as int?,
      prName: json['prName'] as String?,
      unitPrice: (json['unitPrice'] as num?)?.toDouble(),
      rc: json['rc'] as int?,
    );

Map<String, dynamic> _$SearchProductsToJson(SearchProducts instance) =>
    <String, dynamic>{
      'rNum': instance.rNum,
      'catName': instance.catName,
      'emailId': instance.emailId,
      'imageUrl': instance.imageUrl,
      'vendorsName': instance.vendorsName,
      'roleId': instance.roleId,
      'rc': instance.rc,
      'productId': instance.productId,
      'prName': instance.prName,
      'unitPrice': instance.unitPrice,
    };
