import 'package:json_annotation/json_annotation.dart';

part 'add_address.g.dart';

@JsonSerializable()
class AddAddress {
  @JsonKey(name: 'addLine1')
  String? addLine1;

  @JsonKey(name: 'addLine2')
  String? addLine2;

  @JsonKey(name: 'addressType')
  String? addressType;

  @JsonKey(name: 'country')
  String? country;

  @JsonKey(name: 'custId')
  int? custId;

  @JsonKey(name: 'district')
  String? district;

  @JsonKey(name: 'firstName')
  String? firstName;

  @JsonKey(name: 'isDefaultBillingAddress')
  bool? isDefaultBillingAddress;

  @JsonKey(name: 'isDefaultShippingAddress')
  bool? isDefaultShippingAddress;

  @JsonKey(name: 'landmark')
  String? landmark;

  @JsonKey(name: 'lastName')
  String? lastName;

  @JsonKey(name: 'latitude')
  int? latitude;

  @JsonKey(name: 'longitude')
  int? longitude;

  @JsonKey(name: 'phone')
  String? phone;

  @JsonKey(name: 'pincode')
  String? pincode;

  @JsonKey(name: 'state')
  String? state;

  AddAddress(
      {this.addLine1,
      this.addLine2,
      this.addressType,
      this.country,
      this.custId,
      this.district,
      this.firstName,
      this.isDefaultBillingAddress,
      this.isDefaultShippingAddress,
      this.landmark,
      this.lastName,
      this.latitude,
      this.longitude,
      this.phone,
      this.pincode,
      this.state});

  factory AddAddress.fromJson(Map<String, dynamic> json) =>
      _$AddAddressFromJson(json);
  Map<String, dynamic> toJson() => _$AddAddressToJson(this);
}
