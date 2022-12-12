// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'single_order_detail.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SingleOrderDetail _$SingleOrderDetailFromJson(Map<String, dynamic> json) =>
    SingleOrderDetail()
      ..OrderItemsDetails = (json['OrderItemsDetails'] as List<dynamic>?)
          ?.map((e) => OrderProductDetail.fromJson(e as Map<String, dynamic>))
          .toList();

Map<String, dynamic> _$SingleOrderDetailToJson(SingleOrderDetail instance) =>
    <String, dynamic>{
      'OrderItemsDetails': instance.OrderItemsDetails,
    };
