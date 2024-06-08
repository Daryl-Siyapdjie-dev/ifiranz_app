// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'initiate_request.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

InitiateRequest _$InitiateRequestFromJson(Map<String, dynamic> json) {
  return _InitiateRequest.fromJson(json);
}

/// @nodoc
mixin _$InitiateRequest {
  @JsonKey(name: 'command')
  int? get command => throw _privateConstructorUsedError;
  @JsonKey(name: 'paymentMethod')
  int? get paymentMethod => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $InitiateRequestCopyWith<InitiateRequest> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $InitiateRequestCopyWith<$Res> {
  factory $InitiateRequestCopyWith(
          InitiateRequest value, $Res Function(InitiateRequest) then) =
      _$InitiateRequestCopyWithImpl<$Res, InitiateRequest>;
  @useResult
  $Res call(
      {@JsonKey(name: 'command') int? command,
      @JsonKey(name: 'paymentMethod') int? paymentMethod});
}

/// @nodoc
class _$InitiateRequestCopyWithImpl<$Res, $Val extends InitiateRequest>
    implements $InitiateRequestCopyWith<$Res> {
  _$InitiateRequestCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? command = freezed,
    Object? paymentMethod = freezed,
  }) {
    return _then(_value.copyWith(
      command: freezed == command
          ? _value.command
          : command // ignore: cast_nullable_to_non_nullable
              as int?,
      paymentMethod: freezed == paymentMethod
          ? _value.paymentMethod
          : paymentMethod // ignore: cast_nullable_to_non_nullable
              as int?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$InitiateRequestImplCopyWith<$Res>
    implements $InitiateRequestCopyWith<$Res> {
  factory _$$InitiateRequestImplCopyWith(_$InitiateRequestImpl value,
          $Res Function(_$InitiateRequestImpl) then) =
      __$$InitiateRequestImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'command') int? command,
      @JsonKey(name: 'paymentMethod') int? paymentMethod});
}

/// @nodoc
class __$$InitiateRequestImplCopyWithImpl<$Res>
    extends _$InitiateRequestCopyWithImpl<$Res, _$InitiateRequestImpl>
    implements _$$InitiateRequestImplCopyWith<$Res> {
  __$$InitiateRequestImplCopyWithImpl(
      _$InitiateRequestImpl _value, $Res Function(_$InitiateRequestImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? command = freezed,
    Object? paymentMethod = freezed,
  }) {
    return _then(_$InitiateRequestImpl(
      command: freezed == command
          ? _value.command
          : command // ignore: cast_nullable_to_non_nullable
              as int?,
      paymentMethod: freezed == paymentMethod
          ? _value.paymentMethod
          : paymentMethod // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true)
class _$InitiateRequestImpl implements _InitiateRequest {
  _$InitiateRequestImpl(
      {@JsonKey(name: 'command') this.command,
      @JsonKey(name: 'paymentMethod') this.paymentMethod});

  factory _$InitiateRequestImpl.fromJson(Map<String, dynamic> json) =>
      _$$InitiateRequestImplFromJson(json);

  @override
  @JsonKey(name: 'command')
  final int? command;
  @override
  @JsonKey(name: 'paymentMethod')
  final int? paymentMethod;

  @override
  String toString() {
    return 'InitiateRequest(command: $command, paymentMethod: $paymentMethod)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$InitiateRequestImpl &&
            (identical(other.command, command) || other.command == command) &&
            (identical(other.paymentMethod, paymentMethod) ||
                other.paymentMethod == paymentMethod));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, command, paymentMethod);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$InitiateRequestImplCopyWith<_$InitiateRequestImpl> get copyWith =>
      __$$InitiateRequestImplCopyWithImpl<_$InitiateRequestImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$InitiateRequestImplToJson(
      this,
    );
  }
}

abstract class _InitiateRequest implements InitiateRequest {
  factory _InitiateRequest(
          {@JsonKey(name: 'command') final int? command,
          @JsonKey(name: 'paymentMethod') final int? paymentMethod}) =
      _$InitiateRequestImpl;

  factory _InitiateRequest.fromJson(Map<String, dynamic> json) =
      _$InitiateRequestImpl.fromJson;

  @override
  @JsonKey(name: 'command')
  int? get command;
  @override
  @JsonKey(name: 'paymentMethod')
  int? get paymentMethod;
  @override
  @JsonKey(ignore: true)
  _$$InitiateRequestImplCopyWith<_$InitiateRequestImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
