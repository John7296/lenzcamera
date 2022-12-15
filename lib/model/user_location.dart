import 'package:json_annotation/json_annotation.dart';

part 'user_location.g.dart';

@JsonSerializable()
class Location {
  @JsonKey(name: 'pincodeId')
  int? pincodeId;

  @JsonKey(name: 'area')
  String? area;

  @JsonKey(name: 'pincode')
  String? pincode;

  @JsonKey(name: 'place')
  String? place;

  Location({this.area, this.pincode, this.pincodeId, this.place});

  factory Location.fromJson(Map<String, dynamic> json) =>
      _$LocationFromJson(json);
  Map<String, dynamic> toJson() => _$LocationToJson(this);
}
