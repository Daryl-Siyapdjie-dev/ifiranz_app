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
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

PositionRequest _$PositionRequestFromJson(Map<String, dynamic> json) {
  return _PositionRequest.fromJson(json);
}

/// @nodoc
mixin _$PositionRequest {
  double get latitude => throw _privateConstructorUsedError;
  double get longitude => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PositionRequestCopyWith<PositionRequest> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PositionRequestCopyWith<$Res> {
  factory $PositionRequestCopyWith(PositionRequest value, $Res Function(PositionRequest) then) =
      _$PositionRequestCopyWithImpl<$Res, PositionRequest>;
  @useResult
  $Res call({double latitude, double longitude});
}

/// @nodoc
class _$PositionRequestCopyWithImpl<$Res, $Val extends PositionRequest> implements $PositionRequestCopyWith<$Res> {
  _$PositionRequestCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? latitude = null,
    Object? longitude = null,
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
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PositionRequestImplCopyWith<$Res> implements $PositionRequestCopyWith<$Res> {
  factory _$$PositionRequestImplCopyWith(_$PositionRequestImpl value, $Res Function(_$PositionRequestImpl) then) =
      __$$PositionRequestImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({double latitude, double longitude});
}

/// @nodoc
class __$$PositionRequestImplCopyWithImpl<$Res> extends _$PositionRequestCopyWithImpl<$Res, _$PositionRequestImpl>
    implements _$$PositionRequestImplCopyWith<$Res> {
  __$$PositionRequestImplCopyWithImpl(_$PositionRequestImpl _value, $Res Function(_$PositionRequestImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? latitude = null,
    Object? longitude = null,
  }) {
    return _then(_$PositionRequestImpl(
      latitude: null == latitude
          ? _value.latitude
          : latitude // ignore: cast_nullable_to_non_nullable
              as double,
      longitude: null == longitude
          ? _value.longitude
          : longitude // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PositionRequestImpl implements _PositionRequest {
  const _$PositionRequestImpl({required this.latitude, required this.longitude});

  factory _$PositionRequestImpl.fromJson(Map<String, dynamic> json) => _$$PositionRequestImplFromJson(json);

  @override
  final double latitude;
  @override
  final double longitude;

  @override
  String toString() {
    return 'PositionRequest(latitude: $latitude, longitude: $longitude)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PositionRequestImpl &&
            (identical(other.latitude, latitude) || other.latitude == latitude) &&
            (identical(other.longitude, longitude) || other.longitude == longitude));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, latitude, longitude);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$PositionRequestImplCopyWith<_$PositionRequestImpl> get copyWith =>
      __$$PositionRequestImplCopyWithImpl<_$PositionRequestImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PositionRequestImplToJson(
      this,
    );
  }
}

abstract class _PositionRequest implements PositionRequest {
  const factory _PositionRequest({required final double latitude, required final double longitude}) =
      _$PositionRequestImpl;

  factory _PositionRequest.fromJson(Map<String, dynamic> json) = _$PositionRequestImpl.fromJson;

  @override
  double get latitude;
  @override
  double get longitude;
  @override
  @JsonKey(ignore: true)
  _$$PositionRequestImplCopyWith<_$PositionRequestImpl> get copyWith => throw _privateConstructorUsedError;
}
