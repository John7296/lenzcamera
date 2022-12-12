// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order_product_detail.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OrderProductDetail _$OrderProductDetailFromJson(Map<String, dynamic> json) =>
    OrderProductDetail(
      imageUrl: json['imageUrl'] as String?,
      itemTotal: (json['itemTotal'] as num?)?.toDouble(),
      latitude: json['latitude'] as String?,
      longitude: json['longitude'] as String?,
      orderId: json['orderId'] as int?,
      orderItemsId: json['orderItemsId'] as int?,
      prName: json['prName'] as String?,
      productId: json['productId'] as int?,
      productPrice: (json['productPrice'] as num?)?.toDouble(),
      qty: (json['qty'] as num?)?.toDouble(),
      status: json['status'] as String?,
      venderDetails: json['venderDetails'] as String?,
    );

Map<String, dynamic> _$OrderProductDetailToJson(OrderProductDetail instance) =>
    <String, dynamic>{
      'prName': instance.prName,
      'imageUrl': instance.imageUrl,
      'orderId': instance.orderId,
      'latitude': instance.latitude,
      'longitude': instance.longitude,
      'productId': instance.productId,
      'venderDetails': instance.venderDetails,
      'qty': instance.qty,
      'productPrice': instance.productPrice,
      'itemTotal': instance.itemTotal,
      'orderItemsId': instance.orderItemsId,
      'status': instance.status,
    };
