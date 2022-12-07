import 'package:json_annotation/json_annotation.dart';

part 'main_banners.g.dart';

@JsonSerializable()
class Banners {
  @JsonKey(name: 'teId')
  final int? teId;

  @JsonKey(name: 'elementName')
  final String? elementName;

  @JsonKey(name: 'imageUrl')
  final String? imageUrl;

  @JsonKey(name: 'position')
  final int? position;

  @JsonKey(name: 'status')
  final bool? status;

  @JsonKey(name: 'delDate')
  final String? delDate;

  @JsonKey(name: 'Link')
  final String? Link;

  @JsonKey(name: 'mob_urlKey')
  final String? mob_urlKey;

  @JsonKey(name: 'mob_type')
  final String? mob_type;

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
