import 'package:elevate_intake2_intro/api/model/response/category/Category_dto.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test(
      'when call toCategory with non-null values it should return '
      'Category object with correct data', () {
    CategoryDto dto =
        CategoryDto(id: "1", name: "cat", image: "image", slug: "slug");
    var actual = dto.toCategory();
    expect(actual.id, dto.id);
    expect(actual.name, dto.name);
    expect(actual.image, dto.image);
    expect(actual.slug, dto.slug);
  });
  test(
      'when call toCategory with null values it should return '
      'Category object with null data', () {
    CategoryDto dto =
        CategoryDto();
    var actual = dto.toCategory();
    expect(actual.id, null);
    expect(actual.name, null);
    expect(actual.image, null);
    expect(actual.slug, null);
  });
}
