import 'package:json_annotation/json_annotation.dart';

part 'address_list.g.dart';

@JsonSerializable()
class AddressList {
  @JsonKey(name: 'custAdressId')
  int? custAdressId;

  @JsonKey(name: 'custId')
  int? custId;

  @JsonKey(name: 'firstName')
  String? firstName;

  @JsonKey(name: 'middleName')
  String? middleName;

  @JsonKey(name: 'lastName')
  String? lastName;

  @JsonKey(name: 'addLine1')
  String? addLine1;

  @JsonKey(name: 'addLine2')
  String? addLine2;
  
  @JsonKey(name: 'addLine3')
  String? addLine3;

  @JsonKey(name: 'pincode')
  String? pincode;

  @JsonKey(name: 'phone')
  String? phone;

  @JsonKey(name: 'state')
  String? state;

  @JsonKey(name: 'district')
  String? district;

  @JsonKey(name: 'taluk')
  String? taluk;

  @JsonKey(name: 'longitude')
  String? longitude;

  @JsonKey(name: 'latitude')
  String? latitude;

  @JsonKey(name: 'delDate')
  String? delDate;

  @JsonKey(name: 'addressType')
  String? addressType;

  @JsonKey(name: 'country')
  String? country;

  @JsonKey(name: 'area')
  String? area;

  @JsonKey(name: 'isDefaultShippingAddress')
  bool? isDefaultShippingAddress;

  @JsonKey(name: 'isDefaultBillingAddress')
  bool? isDefaultBillingAddress;

  @JsonKey(name: 'landmark')
  String? landmark;

  AddressList(
      {this.isDefaultBillingAddress,
      this.addLine1,
      this.addressType,
      this.area,
      this.country,
      this.custAdressId,
      this.custId,
      this.delDate,
      this.district,
      this.firstName,
      this.isDefaultShippingAddress,
      this.lastName,
      this.latitude,
      this.longitude,
      this.middleName,
      this.phone,
      this.pincode,
      this.state,
      this.taluk,
      this.landmark,
      this.addLine2,
      this.addLine3});

  factory AddressList.fromJson(Map<String, dynamic> json) =>
      _$AddressListFromJson(json);
  Map<String, dynamic> toJson() => _$AddressListToJson(this);
}
