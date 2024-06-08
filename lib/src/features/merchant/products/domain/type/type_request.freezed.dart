// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'type_request.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

TypeRequest _$TypeRequestFromJson(Map<String, dynamic> json) {
  return _TypeRequest.fromJson(json);
}

/// @nodoc
mixin _$TypeRequest {
  String get designation => throw _privateConstructorUsedError;
  String get code => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $TypeRequestCopyWith<TypeRequest> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TypeRequestCopyWith<$Res> {
  factory $TypeRequestCopyWith(
          TypeRequest value, $Res Function(TypeRequest) then) =
      _$TypeRequestCopyWithImpl<$Res, TypeRequest>;
  @useResult
  $Res call({String designation, String code});
}

/// @nodoc
class _$TypeRequestCopyWithImpl<$Res, $Val extends TypeRequest>
    implements $TypeRequestCopyWith<$Res> {
  _$TypeRequestCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? designation = null,
    Object? code = null,
  }) {
    return _then(_value.copyWith(
      designation: null == designation
          ? _value.designation
          : designation // ignore: cast_nullable_to_non_nullable
              as String,
      code: null == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$TypeRequestImplCopyWith<$Res>
    implements $TypeRequestCopyWith<$Res> {
  factory _$$TypeRequestImplCopyWith(
          _$TypeRequestImpl value, $Res Function(_$TypeRequestImpl) then) =
      __$$TypeRequestImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String designation, String code});
}

/// @nodoc
class __$$TypeRequestImplCopyWithImpl<$Res>
    extends _$TypeRequestCopyWithImpl<$Res, _$TypeRequestImpl>
    implements _$$TypeRequestImplCopyWith<$Res> {
  __$$TypeRequestImplCopyWithImpl(
      _$TypeRequestImpl _value, $Res Function(_$TypeRequestImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? designation = null,
    Object? code = null,
  }) {
    return _then(_$TypeRequestImpl(
      designation: null == designation
          ? _value.designation
          : designation // ignore: cast_nullable_to_non_nullable
              as String,
      code: null == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$TypeRequestImpl implements _TypeRequest {
  _$TypeRequestImpl({required this.designation, required this.code});

  factory _$TypeRequestImpl.fromJson(Map<String, dynamic> json) =>
      _$$TypeRequestImplFromJson(json);

  @override
  final String designation;
  @override
  final String code;

  @override
  String toString() {
    return 'TypeRequest(designation: $designation, code: $code)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TypeRequestImpl &&
            (identical(other.designation, designation) ||
                other.designation == designation) &&
            (identical(other.code, code) || other.code == code));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, designation, code);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$TypeRequestImplCopyWith<_$TypeRequestImpl> get copyWith =>
      __$$TypeRequestImplCopyWithImpl<_$TypeRequestImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$TypeRequestImplToJson(
      this,
    );
  }
}

abstract class _TypeRequest implements TypeRequest {
  factory _TypeRequest(
      {required final String designation,
      required final String code}) = _$TypeRequestImpl;

  factory _TypeRequest.fromJson(Map<String, dynamic> json) =
      _$TypeRequestImpl.fromJson;

  @override
  String get designation;
  @override
  String get code;
  @override
  @JsonKey(ignore: true)
  _$$TypeRequestImplCopyWith<_$TypeRequestImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
