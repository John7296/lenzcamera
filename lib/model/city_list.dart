import 'package:json_annotation/json_annotation.dart';

part 'city_list.g.dart';

@JsonSerializable()
class CityList {

  @JsonKey(name: 'id')
  int? id;

  @JsonKey(name: 'name')
  String? name;

  @JsonKey(name: 'state_id')
  int? state_id;


 

  CityList({this.id,this.name,this.state_id});

  factory CityList.fromJson(Map<String, dynamic> json) =>
      _$CityListFromJson(json);
  Map<String, dynamic> toJson() => _$CityListToJson(this);
}
