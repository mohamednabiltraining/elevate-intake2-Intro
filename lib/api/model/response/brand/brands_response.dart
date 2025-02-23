import 'package:elevate_intake2_intro/api/model/response/PaginationData.dart';
import 'package:elevate_intake2_intro/api/model/response/brand/brand_dto.dart';
import 'package:json_annotation/json_annotation.dart';

part 'brands_response.g.dart';

@JsonSerializable()
class BrandsResponse {
  num? results;
  PaginationData? metadata;
  List<BrandDto>? data;

  BrandsResponse({this.results, this.metadata, this.data});

  factory BrandsResponse.fromJson(Map<String, dynamic> json) => _$BrandsResponseFromJson(json);

  Map<String, dynamic> toJson() => _$BrandsResponseToJson(this);
}
