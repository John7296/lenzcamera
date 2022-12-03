import 'package:json_annotation/json_annotation.dart';
import 'package:lenzcamera/manager/data_manager.dart';
import 'package:lenzcamera/model/cart_details.dart';

part 'order_list.g.dart';

@JsonSerializable()
class OrderList {
  @JsonKey(name: 'status')
  String? status;

  @JsonKey(name: 'customer')
  String? customer;

  @JsonKey(name: 'Products')
  String? Products;

  @JsonKey(name: 'ProductCount')
  String? ProductCount;

  @JsonKey(name: 'Address')
  String? Address;

  @JsonKey(name: 'ProductImgUrl')
  String? ProductImgUrl;

  @JsonKey(name: 'IsCanCancelOrder')
  bool? IsCanCancelOrder;

  @JsonKey(name: 'orderId')
  int? orderId;

  @JsonKey(name: 'cartID')
  int? cartID;

  @JsonKey(name: 'custId')
  int? custId;

  @JsonKey(name: 'custBillingAdressId')
  String? custBillingAdressId;

  @JsonKey(name: 'orderDate')
  String? orderDate;

  @JsonKey(name: 'orderAmount')
  double? orderAmount;

  @JsonKey(name: 'orderTax')
  double? orderTax;

  @JsonKey(name: 'orderDiscount')
  double? orderDiscount;

  @JsonKey(name: 'orderStatus')
  String? orderStatus;

  @JsonKey(name: 'orderDeliveryDate')
  String? orderDeliveryDate;

  @JsonKey(name: 'orderCancelledDate')
  String? orderCancelledDate;

  @JsonKey(name: 'orderReturnDate')
  String? orderReturnDate;

  @JsonKey(name: 'orderReturnStatus')
  String? orderReturnStatus;

  @JsonKey(name: 'returnOrderId')
  String? returnOrderId;

  @JsonKey(name: 'delDate')
  String? delDate;

  @JsonKey(name: 'orderDeliveryCharge')
  double? orderDeliveryCharge;

  @JsonKey(name: 'orderNumber')
  String? orderNumber;

  @JsonKey(name: 'custShippingAdressId')
  String? custShippingAdressId;

  @JsonKey(name: 'cpId')
  String? cpId;

  @JsonKey(name: 'couponDiscount')
  String? couponDiscount;

  @JsonKey(name: 'orderWeight')
  String? orderWeight;

  @JsonKey(name: 'orderPincode')
  String? orderPincode;

  @JsonKey(name: 'OTP')
  String? OTP;

  @JsonKey(name: 'OTPExpiry')
  String? OTPExpiry;

  

  OrderList(
      {this.Address,this.IsCanCancelOrder,this.OTP,this.OTPExpiry,this.ProductCount,this.ProductImgUrl,this.Products,this.cartID,this.couponDiscount,this.cpId,this.custBillingAdressId,this.custId,this.custShippingAdressId,this.customer,this.delDate,this.orderAmount,this.orderCancelledDate,this.orderDate,this.orderDeliveryCharge,this.orderDeliveryDate,this.orderDiscount,this.orderId,this.orderNumber,this.orderPincode,this.orderReturnDate,this.orderReturnStatus,this.orderStatus,this.orderTax,this.orderWeight,this.returnOrderId,this.status});


  factory OrderList.fromJson(Map<String, dynamic> json) =>
      _$OrderListFromJson(json);
  Map<String, dynamic> toJson() => _$OrderListToJson(this);
}
