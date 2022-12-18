
import 'package:json_annotation/json_annotation.dart';

part 'product_review.g.dart';

@JsonSerializable()
class ProductReview{

   @JsonKey(name: 'rating1')
  int? rating1;

   @JsonKey(name: 'rating2')
  int? rating2;

   @JsonKey(name: 'rating3')
  int? rating3;

   @JsonKey(name: 'rating4')
  int? rating4;

   @JsonKey(name: 'rating5')
  int? rating5;

   @JsonKey(name: 'review_count')
  int? review_count;

   @JsonKey(name: 'TotalCount')
  int? TotalCount;

   @JsonKey(name: 'IsReviewAvgrating')
  double? IsReviewAvgrating;

   ProductReview({

   this.rating1,
   this.rating2,
   this.rating3,
   this.rating4,
   this.rating5,
   this.review_count,
   this.TotalCount,
   this.IsReviewAvgrating

   });

    factory ProductReview.fromJson(Map<String, dynamic> json) =>
      _$ProductReviewFromJson(json);
  Map<String, dynamic> toJson() => _$ProductReviewToJson(this);

}