// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cart.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Cart _$CartFromJson(Map<String, dynamic> json) => Cart()
  ..cartItems = (json['cartList'] as List<dynamic>?)
      ?.map((e) => CartDetails.fromJson(e as Map<String, dynamic>))
      .toList();

Map<String, dynamic> _$CartToJson(Cart instance) => <String, dynamic>{
      'cartList': instance.cartItems,
    };
