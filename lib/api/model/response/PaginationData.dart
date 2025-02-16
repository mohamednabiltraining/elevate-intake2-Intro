import 'package:json_annotation/json_annotation.dart';

/// currentPage : 1
/// numberOfPages : 1
/// limit : 40

part 'PaginationData.g.dart';

@JsonSerializable()
class PaginationData {
  num? currentPage;
  num? numberOfPages;
  num? limit;

  PaginationData({this.currentPage, this.numberOfPages, this.limit});

  factory PaginationData.fromJson(Map<String, dynamic> json) => _$PaginationDataFromJson(json);

  Map<String, dynamic> toJson() => _$PaginationDataToJson(this);
}