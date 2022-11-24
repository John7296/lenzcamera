import 'package:json_annotation/json_annotation.dart';

part 'company_policy.g.dart';

@JsonSerializable()
class CompanyPolicy {


  @JsonKey(name: 'stName')
  String? name;

  @JsonKey(name: 'stValue')
  String? value;




  CompanyPolicy(
      {this.name,
      this.value,
      });

  factory CompanyPolicy.fromJson(Map<String, dynamic> json) =>
      _$CompanyPolicyFromJson(json);
  Map<String, dynamic> toJson() => _$CompanyPolicyToJson(this);
}
