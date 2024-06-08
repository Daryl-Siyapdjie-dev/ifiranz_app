// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'cashout_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

CashoutModel _$CashoutModelFromJson(Map<String, dynamic> json) {
  return _CashoutModel.fromJson(json);
}

/// @nodoc
mixin _$CashoutModel {
  @JsonKey(name: 'serviceid')
  int? get serviceId =>
      throw _privateConstructorUsedError; // @JsonKey(name: 'merchant') String? merchant,
// @JsonKey(name: 'payItemId') String? payItemId,
// @JsonKey(name: 'payItemDescr') String? payItemDescr,
// @JsonKey(name: 'amountType') String? amountType,
  @JsonKey(name: 'isEnabled')
  bool? get isEnabled => throw _privateConstructorUsedError;
  @JsonKey(name: 'name')
  String? get name => throw _privateConstructorUsedError;
  @JsonKey(name: 'id')
  int? get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'description')
  String? get description => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CashoutModelCopyWith<CashoutModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CashoutModelCopyWith<$Res> {
  factory $CashoutModelCopyWith(
          CashoutModel value, $Res Function(CashoutModel) then) =
      _$CashoutModelCopyWithImpl<$Res, CashoutModel>;
  @useResult
  $Res call(
      {@JsonKey(name: 'serviceid') int? serviceId,
      @JsonKey(name: 'isEnabled') bool? isEnabled,
      @JsonKey(name: 'name') String? name,
      @JsonKey(name: 'id') int? id,
      @JsonKey(name: 'description') String? description});
}

/// @nodoc
class _$CashoutModelCopyWithImpl<$Res, $Val extends CashoutModel>
    implements $CashoutModelCopyWith<$Res> {
  _$CashoutModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? serviceId = freezed,
    Object? isEnabled = freezed,
    Object? name = freezed,
    Object? id = freezed,
    Object? description = freezed,
  }) {
    return _then(_value.copyWith(
      serviceId: freezed == serviceId
          ? _value.serviceId
          : serviceId // ignore: cast_nullable_to_non_nullable
              as int?,
      isEnabled: freezed == isEnabled
          ? _value.isEnabled
          : isEnabled // ignore: cast_nullable_to_non_nullable
              as bool?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CashoutModelImplCopyWith<$Res>
    implements $CashoutModelCopyWith<$Res> {
  factory _$$CashoutModelImplCopyWith(
          _$CashoutModelImpl value, $Res Function(_$CashoutModelImpl) then) =
      __$$CashoutModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'serviceid') int? serviceId,
      @JsonKey(name: 'isEnabled') bool? isEnabled,
      @JsonKey(name: 'name') String? name,
      @JsonKey(name: 'id') int? id,
      @JsonKey(name: 'description') String? description});
}

/// @nodoc
class __$$CashoutModelImplCopyWithImpl<$Res>
    extends _$CashoutModelCopyWithImpl<$Res, _$CashoutModelImpl>
    implements _$$CashoutModelImplCopyWith<$Res> {
  __$$CashoutModelImplCopyWithImpl(
      _$CashoutModelImpl _value, $Res Function(_$CashoutModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? serviceId = freezed,
    Object? isEnabled = freezed,
    Object? name = freezed,
    Object? id = freezed,
    Object? description = freezed,
  }) {
    return _then(_$CashoutModelImpl(
      serviceId: freezed == serviceId
          ? _value.serviceId
          : serviceId // ignore: cast_nullable_to_non_nullable
              as int?,
      isEnabled: freezed == isEnabled
          ? _value.isEnabled
          : isEnabled // ignore: cast_nullable_to_non_nullable
              as bool?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true)
class _$CashoutModelImpl implements _CashoutModel {
  _$CashoutModelImpl(
      {@JsonKey(name: 'serviceid') this.serviceId,
      @JsonKey(name: 'isEnabled') this.isEnabled,
      @JsonKey(name: 'name') this.name,
      @JsonKey(name: 'id') this.id,
      @JsonKey(name: 'description') this.description});

  factory _$CashoutModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$CashoutModelImplFromJson(json);

  @override
  @JsonKey(name: 'serviceid')
  final int? serviceId;
// @JsonKey(name: 'merchant') String? merchant,
// @JsonKey(name: 'payItemId') String? payItemId,
// @JsonKey(name: 'payItemDescr') String? payItemDescr,
// @JsonKey(name: 'amountType') String? amountType,
  @override
  @JsonKey(name: 'isEnabled')
  final bool? isEnabled;
  @override
  @JsonKey(name: 'name')
  final String? name;
  @override
  @JsonKey(name: 'id')
  final int? id;
  @override
  @JsonKey(name: 'description')
  final String? description;

  @override
  String toString() {
    return 'CashoutModel(serviceId: $serviceId, isEnabled: $isEnabled, name: $name, id: $id, description: $description)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CashoutModelImpl &&
            (identical(other.serviceId, serviceId) ||
                other.serviceId == serviceId) &&
            (identical(other.isEnabled, isEnabled) ||
                other.isEnabled == isEnabled) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.description, description) ||
                other.description == description));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, serviceId, isEnabled, name, id, description);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CashoutModelImplCopyWith<_$CashoutModelImpl> get copyWith =>
      __$$CashoutModelImplCopyWithImpl<_$CashoutModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CashoutModelImplToJson(
      this,
    );
  }
}

abstract class _CashoutModel implements CashoutModel {
  factory _CashoutModel(
          {@JsonKey(name: 'serviceid') final int? serviceId,
          @JsonKey(name: 'isEnabled') final bool? isEnabled,
          @JsonKey(name: 'name') final String? name,
          @JsonKey(name: 'id') final int? id,
          @JsonKey(name: 'description') final String? description}) =
      _$CashoutModelImpl;

  factory _CashoutModel.fromJson(Map<String, dynamic> json) =
      _$CashoutModelImpl.fromJson;

  @override
  @JsonKey(name: 'serviceid')
  int? get serviceId;
  @override // @JsonKey(name: 'merchant') String? merchant,
// @JsonKey(name: 'payItemId') String? payItemId,
// @JsonKey(name: 'payItemDescr') String? payItemDescr,
// @JsonKey(name: 'amountType') String? amountType,
  @JsonKey(name: 'isEnabled')
  bool? get isEnabled;
  @override
  @JsonKey(name: 'name')
  String? get name;
  @override
  @JsonKey(name: 'id')
  int? get id;
  @override
  @JsonKey(name: 'description')
  String? get description;
  @override
  @JsonKey(ignore: true)
  _$$CashoutModelImplCopyWith<_$CashoutModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
