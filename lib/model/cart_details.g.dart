// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cart_details.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CartDetails _$CartDetailsFromJson(Map<String, dynamic> json) => CartDetails(
      catName: json['cartId'] as int?,
      imageUrl: json['imageUrl'] as String?,
      prName: json['prName'] as String?,
      productId: json['productId'] as int?,
      urlKey: json['urlKey'] as String?,
      unitPrice: (json['unitPrice'] as num?)?.toDouble(),
      IsAvailPincode: json['IsAvailPincode'] as bool?,
      actDate: json['actDate'] as String?,
      cartItemsId: json['cartItemsId'] as int?,
      cartStatus: json['cartStatus'] as bool?,
      catId: json['catId'] as int?,
      cpAmount: (json['cpAmount'] as num?)?.toDouble(),
      cpName: json['cpName'] as String?,
      deliveryAmount: (json['deliveryAmount'] as num?)?.toDouble(),
      description: json['description'] as String?,
      grandTotal: (json['grandTotal'] as num?)?.toDouble(),
      itemTotal: (json['itemTotal'] as num?)?.toDouble(),
      metaDescription: json['metaDescription'] as String?,
      metaKeywords: json['metaKeywords'] as String?,
      metaTitle: json['metaTitle'] as String?,
      pincode: json['pincode'] as String?,
      prDate: json['prDate'] as String?,
      qty: (json['qty'] as num?)?.toDouble(),
      shortDescription: json['shortDescription'] as String?,
      sku: json['sku'] as String?,
      status: json['status'] as bool?,
      subTotal: (json['subTotal'] as num?)?.toDouble(),
      totalDiscount: (json['totalDiscount'] as num?)?.toDouble(),
      venderName: json['venderName'] as String?,
      vendorId: json['vendorId'] as int?,
      vendorUrlKey: json['vendorUrlKey'] as String?,
      vendorid: json['vendorid'] as int?,
    );

Map<String, dynamic> _$CartDetailsToJson(CartDetails instance) =>
    <String, dynamic>{
      'catId': instance.catId,
      'cartId': instance.catName,
      'cartItemsId': instance.cartItemsId,
      'qty': instance.qty,
      'imageUrl': instance.imageUrl,
      'vendorId': instance.vendorId,
      'vendorUrlKey': instance.vendorUrlKey,
      'venderName': instance.venderName,
      'pincode': instance.pincode,
      'grandTotal': instance.grandTotal,
      'subTotal': instance.subTotal,
      'itemTotal': instance.itemTotal,
      'cpAmount': instance.cpAmount,
      'cpName': instance.cpName,
      'totalDiscount': instance.totalDiscount,
      'deliveryAmount': instance.deliveryAmount,
      'cartStatus': instance.cartStatus,
      'IsAvailPincode': instance.IsAvailPincode,
      'productId': instance.productId,
      'vendorid': instance.vendorid,
      'prDate': instance.prDate,
      'actDate': instance.actDate,
      'prName': instance.prName,
      'sku': instance.sku,
      'unitPrice': instance.unitPrice,
      'description': instance.description,
      'shortDescription': instance.shortDescription,
      'urlKey': instance.urlKey,
      'metaTitle': instance.metaTitle,
      'metaKeywords': instance.metaKeywords,
      'metaDescription': instance.metaDescription,
      'status': instance.status,
    };
