// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'position_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

PositionResponse _$PositionResponseFromJson(Map<String, dynamic> json) {
  return _PositionResponse.fromJson(json);
}

/// @nodoc
mixin _$PositionResponse {
  double get latitude => throw _privateConstructorUsedError;
  double get longitude => throw _privateConstructorUsedError;
  String get status => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PositionResponseCopyWith<PositionResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PositionResponseCopyWith<$Res> {
  factory $PositionResponseCopyWith(
          PositionResponse value, $Res Function(PositionResponse) then) =
      _$PositionResponseCopyWithImpl<$Res, PositionResponse>;
  @useResult
  $Res call({double latitude, double longitude, String status});
}

/// @nodoc
class _$PositionResponseCopyWithImpl<$Res, $Val extends PositionResponse>
    implements $PositionResponseCopyWith<$Res> {
  _$PositionResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? latitude = null,
    Object? longitude = null,
    Object? status = null,
  }) {
    return _then(_value.copyWith(
      latitude: null == latitude
          ? _value.latitude
          : latitude // ignore: cast_nullable_to_non_nullable
              as double,
      longitude: null == longitude
          ? _value.longitude
          : longitude // ignore: cast_nullable_to_non_nullable
              as double,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PositionResponseImplCopyWith<$Res>
    implements $PositionResponseCopyWith<$Res> {
  factory _$$PositionResponseImplCopyWith(_$PositionResponseImpl value,
          $Res Function(_$PositionResponseImpl) then) =
      __$$PositionResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({double latitude, double longitude, String status});
}

/// @nodoc
class __$$PositionResponseImplCopyWithImpl<$Res>
    extends _$PositionResponseCopyWithImpl<$Res, _$PositionResponseImpl>
    implements _$$PositionResponseImplCopyWith<$Res> {
  __$$PositionResponseImplCopyWithImpl(_$PositionResponseImpl _value,
      $Res Function(_$PositionResponseImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? latitude = null,
    Object? longitude = null,
    Object? status = null,
  }) {
    return _then(_$PositionResponseImpl(
      latitude: null == latitude
          ? _value.latitude
          : latitude // ignore: cast_nullable_to_non_nullable
              as double,
      longitude: null == longitude
          ? _value.longitude
          : longitude // ignore: cast_nullable_to_non_nullable
              as double,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PositionResponseImpl implements _PositionResponse {
  const _$PositionResponseImpl(
      {required this.latitude, required this.longitude, required this.status});

  factory _$PositionResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$PositionResponseImplFromJson(json);

  @override
  final double latitude;
  @override
  final double longitude;
  @override
  final String status;

  @override
  String toString() {
    return 'PositionResponse(latitude: $latitude, longitude: $longitude, status: $status)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PositionResponseImpl &&
            (identical(other.latitude, latitude) ||
                other.latitude == latitude) &&
            (identical(other.longitude, longitude) ||
                other.longitude == longitude) &&
            (identical(other.status, status) || other.status == status));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, latitude, longitude, status);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$PositionResponseImplCopyWith<_$PositionResponseImpl> get copyWith =>
      __$$PositionResponseImplCopyWithImpl<_$PositionResponseImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PositionResponseImplToJson(
      this,
    );
  }
}

abstract class _PositionResponse implements PositionResponse {
  const factory _PositionResponse(
      {required final double latitude,
      required final double longitude,
      required final String status}) = _$PositionResponseImpl;

  factory _PositionResponse.fromJson(Map<String, dynamic> json) =
      _$PositionResponseImpl.fromJson;

  @override
  double get latitude;
  @override
  double get longitude;
  @override
  String get status;
  @override
  @JsonKey(ignore: true)
  _$$PositionResponseImplCopyWith<_$PositionResponseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
