import 'package:elevate_intake2_intro/domain/model/Brand.dart';
import 'package:json_annotation/json_annotation.dart';

part 'brand_dto.g.dart';


@JsonSerializable()
class BrandDto {
  @JsonKey(name: '_id')
  String? id;
  String? name;
  String? slug;
  String? image;

  BrandDto({this.id, this.name, this.slug, this.image});

  factory BrandDto.fromJson(Map<String, dynamic> json) => _$BrandDtoFromJson(json);

  Map<String, dynamic> toJson() => _$BrandDtoToJson(this);

  Brand toBrand(){
    return Brand(
      id: id,
      name: name,
      slug: slug,
      image: image,
    );
  }
}

