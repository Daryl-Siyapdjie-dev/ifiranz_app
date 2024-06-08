// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'verify_transaction_request.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

VerifyTransactionRequest _$VerifyTransactionRequestFromJson(
    Map<String, dynamic> json) {
  return _VerifyTransactionRequest.fromJson(json);
}

/// @nodoc
mixin _$VerifyTransactionRequest {
  int get commandId => throw _privateConstructorUsedError;
  String get trid => throw _privateConstructorUsedError;
  num get marchand => throw _privateConstructorUsedError;
  num get deliver => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $VerifyTransactionRequestCopyWith<VerifyTransactionRequest> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $VerifyTransactionRequestCopyWith<$Res> {
  factory $VerifyTransactionRequestCopyWith(VerifyTransactionRequest value,
          $Res Function(VerifyTransactionRequest) then) =
      _$VerifyTransactionRequestCopyWithImpl<$Res, VerifyTransactionRequest>;
  @useResult
  $Res call({int commandId, String trid, num marchand, num deliver});
}

/// @nodoc
class _$VerifyTransactionRequestCopyWithImpl<$Res,
        $Val extends VerifyTransactionRequest>
    implements $VerifyTransactionRequestCopyWith<$Res> {
  _$VerifyTransactionRequestCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? commandId = null,
    Object? trid = null,
    Object? marchand = null,
    Object? deliver = null,
  }) {
    return _then(_value.copyWith(
      commandId: null == commandId
          ? _value.commandId
          : commandId // ignore: cast_nullable_to_non_nullable
              as int,
      trid: null == trid
          ? _value.trid
          : trid // ignore: cast_nullable_to_non_nullable
              as String,
      marchand: null == marchand
          ? _value.marchand
          : marchand // ignore: cast_nullable_to_non_nullable
              as num,
      deliver: null == deliver
          ? _value.deliver
          : deliver // ignore: cast_nullable_to_non_nullable
              as num,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$VerifyTransactionRequestImplCopyWith<$Res>
    implements $VerifyTransactionRequestCopyWith<$Res> {
  factory _$$VerifyTransactionRequestImplCopyWith(
          _$VerifyTransactionRequestImpl value,
          $Res Function(_$VerifyTransactionRequestImpl) then) =
      __$$VerifyTransactionRequestImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int commandId, String trid, num marchand, num deliver});
}

/// @nodoc
class __$$VerifyTransactionRequestImplCopyWithImpl<$Res>
    extends _$VerifyTransactionRequestCopyWithImpl<$Res,
        _$VerifyTransactionRequestImpl>
    implements _$$VerifyTransactionRequestImplCopyWith<$Res> {
  __$$VerifyTransactionRequestImplCopyWithImpl(
      _$VerifyTransactionRequestImpl _value,
      $Res Function(_$VerifyTransactionRequestImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? commandId = null,
    Object? trid = null,
    Object? marchand = null,
    Object? deliver = null,
  }) {
    return _then(_$VerifyTransactionRequestImpl(
      commandId: null == commandId
          ? _value.commandId
          : commandId // ignore: cast_nullable_to_non_nullable
              as int,
      trid: null == trid
          ? _value.trid
          : trid // ignore: cast_nullable_to_non_nullable
              as String,
      marchand: null == marchand
          ? _value.marchand
          : marchand // ignore: cast_nullable_to_non_nullable
              as num,
      deliver: null == deliver
          ? _value.deliver
          : deliver // ignore: cast_nullable_to_non_nullable
              as num,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$VerifyTransactionRequestImpl implements _VerifyTransactionRequest {
  const _$VerifyTransactionRequestImpl(
      {required this.commandId,
      required this.trid,
      required this.marchand,
      required this.deliver});

  factory _$VerifyTransactionRequestImpl.fromJson(Map<String, dynamic> json) =>
      _$$VerifyTransactionRequestImplFromJson(json);

  @override
  final int commandId;
  @override
  final String trid;
  @override
  final num marchand;
  @override
  final num deliver;

  @override
  String toString() {
    return 'VerifyTransactionRequest(commandId: $commandId, trid: $trid, marchand: $marchand, deliver: $deliver)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$VerifyTransactionRequestImpl &&
            (identical(other.commandId, commandId) ||
                other.commandId == commandId) &&
            (identical(other.trid, trid) || other.trid == trid) &&
            (identical(other.marchand, marchand) ||
                other.marchand == marchand) &&
            (identical(other.deliver, deliver) || other.deliver == deliver));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, commandId, trid, marchand, deliver);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$VerifyTransactionRequestImplCopyWith<_$VerifyTransactionRequestImpl>
      get copyWith => __$$VerifyTransactionRequestImplCopyWithImpl<
          _$VerifyTransactionRequestImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$VerifyTransactionRequestImplToJson(
      this,
    );
  }
}

abstract class _VerifyTransactionRequest implements VerifyTransactionRequest {
  const factory _VerifyTransactionRequest(
      {required final int commandId,
      required final String trid,
      required final num marchand,
      required final num deliver}) = _$VerifyTransactionRequestImpl;

  factory _VerifyTransactionRequest.fromJson(Map<String, dynamic> json) =
      _$VerifyTransactionRequestImpl.fromJson;

  @override
  int get commandId;
  @override
  String get trid;
  @override
  num get marchand;
  @override
  num get deliver;
  @override
  @JsonKey(ignore: true)
  _$$VerifyTransactionRequestImplCopyWith<_$VerifyTransactionRequestImpl>
      get copyWith => throw _privateConstructorUsedError;
}
