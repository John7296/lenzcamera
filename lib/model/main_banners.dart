import 'package:json_annotation/json_annotation.dart';
import 'package:lenzcamera/model/banners.dart';
part 'main_banners.g.dart';

@JsonSerializable(genericArgumentFactories: true)
class MainBanner {
  @JsonKey(name: "MainBanners")
  List<Banners>? MainBanners;

  MainBanner();

  factory MainBanner.fromJson(Map<String, dynamic> json) =>
      _$MainBannerFromJson(json);
  Map<String, dynamic> toJson() => _$MainBannerToJson(this);
}
