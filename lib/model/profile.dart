import 'package:json_annotation/json_annotation.dart';

part 'profile.g.dart';

@JsonSerializable()
class Profile {
  @JsonKey(name: 'custName')
  String? custName;

  @JsonKey(name: 'emailId')
  String? emailId;

  @JsonKey(name: 'phoneNo')
  String? phoneNo;

  @JsonKey(name: 'delAgentVehicleType')
  String? delAgentVehicleType;

  @JsonKey(name: 'delAgentStatus')
  String? delAgentStatus;

  @JsonKey(name: 'custType')
  String? custType;

  Profile(
      {this.custName,
      this.custType,
      this.delAgentVehicleType,
      this.emailId,
      this.phoneNo,
      this.delAgentStatus});

  factory Profile.fromJson(Map<String, dynamic> json) =>
      _$ProfileFromJson(json);
  Map<String, dynamic> toJson() => _$ProfileToJson(this);
}
