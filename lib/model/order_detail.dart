import 'package:json_annotation/json_annotation.dart';
part 'order_detail.g.dart';

@JsonSerializable(genericArgumentFactories: true)
class OrderDetail {
 
  @JsonKey(name: "status")
  String? status;

  @JsonKey(name: "PayMethod")
  String? payMethod;

  @JsonKey(name: "subTotal")
  String? subTotal;

  @JsonKey(name: "latitude")
  String? latitude;

  @JsonKey(name: "longitude")
  String? longitude;

  @JsonKey(name: "joborderItemsId")
  int? joborderItemsId;

  @JsonKey(name: "custPhone")
  String? custPhone;

  @JsonKey(name: "walletAmount")
  double? walletAmount;

  @JsonKey(name: "orderNote")
  String? orderNote;

  @JsonKey(name: "custBillingAdressId")
  int? custBillingAdressId;

  @JsonKey(name: "custShippingAdressId")
  int? custShippingAdressId;

  @JsonKey(name: "jobOrderId")
  int? jobOrderId;

  @JsonKey(name: "joborderNumber")
  int? joborderNumber;

  @JsonKey(name: "joborderDate")
  String? joborderDate;

  @JsonKey(name: "orderId")
  int? orderId;

  @JsonKey(name: "cartID")
  int? cartID;

  @JsonKey(name: "custId")
  int? custId;

  @JsonKey(name: "orderDate")
  String? orderDate;

  @JsonKey(name: "orderAmount")
  double? orderAmount;

  @JsonKey(name: "orderTax")
  double? jorderTax;

  @JsonKey(name: "orderDiscount")
  double? orderDiscount;

  @JsonKey(name: "orderStatus")
  String? orderStatus;

  @JsonKey(name: "orderDeliveryDate")
  String? orderDeliveryDate;

  @JsonKey(name: "orderCancelledDate")
  String? orderCancelledDate;

  @JsonKey(name: "orderReturnDate")
  String? orderReturnDate;

  @JsonKey(name: "orderReturnStatus")
  String? orderReturnStatus;

  @JsonKey(name: "returnOrderId")
  int? returnOrderId;

  @JsonKey(name: "delDate")
  String? delDate;

  @JsonKey(name: "orderDeliveryCharge")
  double? orderDeliveryCharge;

  @JsonKey(name: "orderNumber")
  String? orderNumber;

  @JsonKey(name: "cpId")
  String? cpId;

  @JsonKey(name: "couponDiscount")
  double? couponDiscount;

  @JsonKey(name: "orderWeight")
  String? orderWeight;

  @JsonKey(name: "orderPincode")
  int? orderPincode;

  @JsonKey(name: "OTP")
  String? OTP;

  @JsonKey(name: "OTPExpiry")
  String? OTPExpiry;

  OrderDetail(
      {this.status,
      this.payMethod,
      this.subTotal,
      this.latitude,
      this.longitude,
      this.joborderItemsId,
      this.custPhone,
      this.walletAmount,
      this.orderNote,
      this.custBillingAdressId,
      this.custShippingAdressId,
      this.jobOrderId,
      this.joborderNumber,
      this.joborderDate,
      this.orderId,
      this.cartID,
      this.custId,
      this.orderDate,
      this.orderAmount,
      this.jorderTax,
      this.orderDiscount,
      this.orderStatus,
      this.orderDeliveryDate,
      this.orderCancelledDate,
      this.orderReturnDate,
      this.orderReturnStatus,
      this.returnOrderId,
      this.delDate,
      this.orderDeliveryCharge,
      this.orderNumber,
      this.cpId,
      this.couponDiscount,
      this.orderWeight,
      this.orderPincode,
      this.OTP,
      this.OTPExpiry});

  factory OrderDetail.fromJson(Map<String, dynamic> json) =>
      _$OrderDetailFromJson(json);
  Map<String, dynamic> toJson() => _$OrderDetailToJson(this);
}

 