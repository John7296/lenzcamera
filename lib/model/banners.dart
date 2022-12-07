import 'package:json_annotation/json_annotation.dart';

part 'banners.g.dart';

@JsonSerializable()
class Banners {
  @JsonKey(name: 'teId')
  int? teId;

  @JsonKey(name: 'elementName')
  String? elementName;

  @JsonKey(name: 'imageUrl')
  String? imageUrl;

  @JsonKey(name: 'position')
  int? position;

  @JsonKey(name: 'status')
  bool? status;

  @JsonKey(name: 'delDate')
  String? delDate;

  @JsonKey(name: 'Link')
  String? Link;

  @JsonKey(name: 'mob_urlKey')
  String? mob_urlKey;

  @JsonKey(name: 'mob_type')
  String? mob_type;

  Banners(
      {this.Link,
      this.delDate,
      this.elementName,
      this.imageUrl,
      this.mob_type,
      this.mob_urlKey,
      this.position,
      this.status,
      this.teId});

  factory Banners.fromJson(Map<String, dynamic> json) =>
      _$BannersFromJson(json);
  Map<String, dynamic> toJson() => _$BannersToJson(this);
}
