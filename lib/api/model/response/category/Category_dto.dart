import 'package:elevate_intake2_intro/domain/model/category.dart';
import 'package:json_annotation/json_annotation.dart';

/// _id : "6439d61c0049ad0b52b90051"
/// name : "Music"
/// slug : "music"
/// image : "https://ecommerce.routemisr.com/Route-Academy-categories/1681511964020.jpeg"
/// createdAt : "2023-04-14T22:39:24.365Z"
/// updatedAt : "2023-04-14T22:39:24.365Z"
part 'Category_dto.g.dart';

@JsonSerializable()
class CategoryDto {
  CategoryDto({
      this.id, 
      this.name, 
      this.slug, 
      this.image, 
      this.createdAt, 
      this.updatedAt,});

  factory CategoryDto.fromJson(Map<String, dynamic> json)=> _$CategoryDtoFromJson(json);
  String? id;
  String? name;
  String? slug;
  String? image;
  String? createdAt;
  String? updatedAt;

  Map<String, dynamic> toJson() => _$CategoryDtoToJson(this);

  Category toCategory(){
    return Category(
      id: id,
      name: name,
      slug: slug,
      image: image,
    );
  }
}