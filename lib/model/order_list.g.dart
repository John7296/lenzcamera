// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order_list.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OrderList _$OrderListFromJson(Map<String, dynamic> json) => OrderList(
      Address: json['Address'] as String?,
      IsCanCancelOrder: json['IsCanCancelOrder'] as bool?,
      OTP: json['OTP'] as String?,
      OTPExpiry: json['OTPExpiry'] as String?,
      ProductCount: json['ProductCount'] as String?,
      ProductImgUrl: json['ProductImgUrl'] as String?,
      Products: json['Products'] as String?,
      cartID: json['cartID'] as int?,
      couponDiscount: json['couponDiscount'] as String?,
      cpId: json['cpId'] as String?,
      custBillingAdressId: json['custBillingAdressId'] as String?,
      custId: json['custId'] as int?,
      custShippingAdressId: json['custShippingAdressId'] as String?,
      customer: json['customer'] as String?,
      delDate: json['delDate'] as String?,
      orderAmount: (json['orderAmount'] as num?)?.toDouble(),
      orderCancelledDate: json['orderCancelledDate'] as String?,
      orderDate: json['orderDate'] as String?,
      orderDeliveryCharge: (json['orderDeliveryCharge'] as num?)?.toDouble(),
      orderDeliveryDate: json['orderDeliveryDate'] as String?,
      orderDiscount: (json['orderDiscount'] as num?)?.toDouble(),
      orderId: json['orderId'] as int?,
      orderNumber: json['orderNumber'] as String?,
      orderPincode: json['orderPincode'] as String?,
      orderReturnDate: json['orderReturnDate'] as String?,
      orderReturnStatus: json['orderReturnStatus'] as String?,
      orderStatus: json['orderStatus'] as String?,
      orderTax: (json['orderTax'] as num?)?.toDouble(),
      orderWeight: json['orderWeight'] as String?,
      returnOrderId: json['returnOrderId'] as String?,
      status: json['status'] as String?,
    );

Map<String, dynamic> _$OrderListToJson(OrderList instance) => <String, dynamic>{
      'status': instance.status,
      'customer': instance.customer,
      'Products': instance.Products,
      'ProductCount': instance.ProductCount,
      'Address': instance.Address,
      'ProductImgUrl': instance.ProductImgUrl,
      'IsCanCancelOrder': instance.IsCanCancelOrder,
      'orderId': instance.orderId,
      'cartID': instance.cartID,
      'custId': instance.custId,
      'custBillingAdressId': instance.custBillingAdressId,
      'orderDate': instance.orderDate,
      'orderAmount': instance.orderAmount,
      'orderTax': instance.orderTax,
      'orderDiscount': instance.orderDiscount,
      'orderStatus': instance.orderStatus,
      'orderDeliveryDate': instance.orderDeliveryDate,
      'orderCancelledDate': instance.orderCancelledDate,
      'orderReturnDate': instance.orderReturnDate,
      'orderReturnStatus': instance.orderReturnStatus,
      'returnOrderId': instance.returnOrderId,
      'delDate': instance.delDate,
      'orderDeliveryCharge': instance.orderDeliveryCharge,
      'orderNumber': instance.orderNumber,
      'custShippingAdressId': instance.custShippingAdressId,
      'cpId': instance.cpId,
      'couponDiscount': instance.couponDiscount,
      'orderWeight': instance.orderWeight,
      'orderPincode': instance.orderPincode,
      'OTP': instance.OTP,
      'OTPExpiry': instance.OTPExpiry,
    };