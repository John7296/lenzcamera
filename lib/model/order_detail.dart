import 'package:json_annotation/json_annotation.dart';
part 'order_detail.g.dart';

@JsonSerializable(genericArgumentFactories: true)
class OrderDetail {
  @JsonKey(name: 'status')
  String? status;

  @JsonKey(name: 'PayMethod')
  String? PayMethod;

  @JsonKey(name: 'subTotal')
  double? subTotal;

  @JsonKey(name: 'latitude')
  String? latitude;

  @JsonKey(name: 'longitude')
  String? longitude;

  @JsonKey(name: 'joborderItemsId')
  int? joborderItemsId;

  @JsonKey(name: 'custPhone')
  int? custPhone;

  @JsonKey(name: 'walletAmount')
  double? walletAmount;

  @JsonKey(name: 'orderNote')
  String? orderNote;

  @JsonKey(name: 'custBillingAdressId')
  int? custBillingAdressId;

  @JsonKey(name: 'custShippingAdressId')
  int? custShippingAdressId;

  @JsonKey(name: 'jobOrderId')
  int? jobOrderId;

  @JsonKey(name: 'joborderNumber')
  int? joborderNumber;

  @JsonKey(name: 'joborderDate')
  String? joborderDate;

  @JsonKey(name: 'orderId')
  int? orderId;

  @JsonKey(name: 'cartID')
  int? cartID;

  @JsonKey(name: 'custId')
  int? custId;

  @JsonKey(name: 'orderAmount')
  double? orderAmount;

  @JsonKey(name: 'orderTax')
  double? orderTax;

  @JsonKey(name: 'orderDate')
  String? orderDate;

  @JsonKey(name: 'orderDiscount')
  String? orderDiscount;

  @JsonKey(name: 'orderStatus')
  String? orderStatus;

  @JsonKey(name: 'orderDeliveryDate')
  double? orderDeliveryDate;

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
  String? orderDeliveryCharge;

  @JsonKey(name: 'orderNumber')
  String? orderNumber;

  @JsonKey(name: 'cpId')
  String? cpId;

  @JsonKey(name: 'couponDiscount')
  String? couponDiscount;

  OrderDetail(
      {this.PayMethod,
      this.cartID,
      this.couponDiscount,
      this.cpId,
      this.custBillingAdressId,
      this.custId,
      this.custPhone,
      this.custShippingAdressId,
      this.delDate,
      this.jobOrderId,
      this.joborderDate,
      this.joborderItemsId,
      this.joborderNumber,
      this.latitude,
      this.longitude,
      this.orderAmount,
      this.orderCancelledDate,
      this.orderDate,
      this.orderDeliveryCharge,
      this.orderDeliveryDate,
      this.orderDiscount,
      this.orderId,
      this.orderNote,
      this.orderNumber,
      this.orderReturnDate,
      this.orderReturnStatus,
      this.orderStatus,
      this.orderTax,
      this.returnOrderId,
      this.status,
      this.subTotal,
      this.walletAmount});

  factory OrderDetail.fromJson(Map<String, dynamic> json) =>
      _$OrderDetailFromJson(json);
  Map<String, dynamic> toJson() => _$OrderDetailToJson(this);
}
