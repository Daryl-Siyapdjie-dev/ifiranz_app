import 'package:freezed_annotation/freezed_annotation.dart';

part 'filter_optional.freezed.dart';
part 'filter_optional.g.dart';

@freezed
class FilterOptional with _$FilterOptional {
  factory FilterOptional({String? aliasKey, String? key, value, String? value1, String? type, bool? applyAnd}) = _FilterOptional;

  factory FilterOptional.fromJson(Map<String, dynamic> json) => _$FilterOptionalFromJson(json);
}
