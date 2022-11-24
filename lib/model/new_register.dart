import 'package:json_annotation/json_annotation.dart';

part 'new_register.g.dart';

@JsonSerializable()
class NewRegister {
  @JsonKey(name: 'custName')
  int? custName;

  @JsonKey(name: 'custId')
  int? custId;

  @JsonKey(name: 'otpUrlKey')
  String? otpUrlKey;

  @JsonKey(name: 'phoneNo')
  int? phoneNo;

  @JsonKey(name: 'emailId')
  String? emailId;


  NewRegister({
        this.custId,this.custName,this.emailId,this.otpUrlKey,this.phoneNo
  
      });

  factory NewRegister.fromJson(Map<String, dynamic> json) =>
      _$NewRegisterFromJson(json);
  Map<String, dynamic> toJson() => _$NewRegisterToJson(this);
}
