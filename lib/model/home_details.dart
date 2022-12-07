import 'package:json_annotation/json_annotation.dart';
import 'package:lenzcamera/model/main_banners.dart';
import 'package:lenzcamera/model/top_categories.dart';

part 'home_details.g.dart';

@JsonSerializable()
class HomeDetails {

  @JsonKey(name: 'MobileMainBanners')
  List<Banners>? MobileMainBanners;

  // @JsonKey(name: 'TopCategories')
  // List<TopCategories>? topcategories;



  HomeDetails({
      this.MobileMainBanners,
     });

  factory HomeDetails.fromJson(Map<String, dynamic> json) =>
      _$HomeDetailsFromJson(json);
  Map<String, dynamic> toJson() => _$HomeDetailsToJson(this);
}
