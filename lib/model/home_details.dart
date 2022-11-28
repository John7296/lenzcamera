import 'package:json_annotation/json_annotation.dart';

part 'home_details.g.dart';

@JsonSerializable()
class HomeDetails {
  @JsonKey(name: 'featured_restuarants')
  List<HomeDetails>? featured_restuarants;

  @JsonKey(name: 'newest_restuarants')
  List<HomeDetails>? newest_restuarants;

  @JsonKey(name: 'trending_restuarants')
  List<HomeDetails>? trending_restuarants;

  @JsonKey(name: 'slider_banners')
  List<HomeDetails>? slider_banners;

  @JsonKey(name: 'additional_banners')
  List<HomeDetails>? additional_banners;

  @JsonKey(name: 'featured_products')
  List<HomeDetails>? featured_products;

  @JsonKey(name: 'bestseller_products')
  List<HomeDetails>? bestseller_products;

  @JsonKey(name: 'web_sliders')
  List<HomeDetails>? web_sliders;

  @JsonKey(name: 'offer_banners')
  List<HomeDetails>? offer_banners;


  HomeDetails(
      {
        this.additional_banners,this.bestseller_products,this.featured_products,this.featured_restuarants,this.newest_restuarants,this.offer_banners,this.slider_banners,this.trending_restuarants,this.web_sliders
      });

  factory HomeDetails.fromJson(Map<String, dynamic> json) =>
      _$HomeDetailsFromJson(json);
  Map<String, dynamic> toJson() => _$HomeDetailsToJson(this);
}
