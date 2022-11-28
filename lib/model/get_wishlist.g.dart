// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_wishlist.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

WishList _$WishListFromJson(Map<String, dynamic> json) => WishList(
      catName: json['catName'] as String?,
      imageUrl: json['imageUrl'] as String?,
      custId: json['custId'] as int?,
      prName: json['prName'] as String?,
      productId: json['productId'] as int?,
      urlKey: json['urlKey'] as String?,
      wishlistId: json['wishlistId'] as int?,
      unitPrice: (json['unitPrice'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$WishListToJson(WishList instance) => <String, dynamic>{
      'prName': instance.prName,
      'catName': instance.catName,
      'custId': instance.custId,
      'wishlistId': instance.wishlistId,
      'imageUrl': instance.imageUrl,
      'productId': instance.productId,
      'urlKey': instance.urlKey,
      'unitPrice': instance.unitPrice,
    };
