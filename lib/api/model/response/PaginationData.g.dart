// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'PaginationData.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PaginationData _$PaginationDataFromJson(Map<String, dynamic> json) =>
    PaginationData(
      currentPage: json['currentPage'] as num?,
      numberOfPages: json['numberOfPages'] as num?,
      limit: json['limit'] as num?,
    );

Map<String, dynamic> _$PaginationDataToJson(PaginationData instance) =>
    <String, dynamic>{
      'currentPage': instance.currentPage,
      'numberOfPages': instance.numberOfPages,
      'limit': instance.limit,
    };
