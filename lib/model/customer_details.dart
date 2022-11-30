import 'package:json_annotation/json_annotation.dart';

part 'customer_details.g.dart';

@JsonSerializable()


class CustomerDetails{
    @JsonKey(name: 'custName')
  final String? custName;

  @JsonKey(name: 'emailId')
  final String? emailId;

  @JsonKey(name: 'phoneNo')
  final String? phoneNo;

  @JsonKey(name: 'delAgentVehicleType')
  String? delAgentVehicleType;

   @JsonKey(name: 'delAgentStatus')
  String? delAgentStatus;
   
    @JsonKey(name: 'custType')
  String? custType;

 
  CustomerDetails({
    this.custName,
    this.emailId,
    this.phoneNo,
    this.delAgentVehicleType,
    this.delAgentStatus,
    this.custType,

  });

  factory CustomerDetails.fromJson(Map<String, dynamic> json) => _$CustomerDetailsFromJson(json);
  Map<String, dynamic> toJson() => _$CustomerDetailsToJson(this);


}