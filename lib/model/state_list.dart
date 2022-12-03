import 'package:json_annotation/json_annotation.dart';

part 'state_list.g.dart';

@JsonSerializable()
class StateList {

  @JsonKey(name: 'id')
  int? id;

  @JsonKey(name: 'name')
  String? name;

  @JsonKey(name: 'country_id')
  int? country_id;


 

  StateList({this.id,this.name,this.country_id});

  factory StateList.fromJson(Map<String, dynamic> json) =>
      _$StateListFromJson(json);
  Map<String, dynamic> toJson() => _$StateListToJson(this);
}
