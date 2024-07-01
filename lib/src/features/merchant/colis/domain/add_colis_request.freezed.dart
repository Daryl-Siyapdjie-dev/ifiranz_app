// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'add_colis_request.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

AddColisRequest _$AddColisRequestFromJson(Map<String, dynamic> json) {
  return _AddColisRequest.fromJson(json);
}

/// @nodoc
mixin _$AddColisRequest {
  String get designation => throw _privateConstructorUsedError;
  String get clientName => throw _privateConstructorUsedError;
  String get clientPhone => throw _privateConstructorUsedError;
  Quartier get quartier => throw _privateConstructorUsedError;
  String get modePayement => throw _privateConstructorUsedError;
  String get localisationGps => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  bool? get isParcel => throw _privateConstructorUsedError;
  double get dueAmount => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AddColisRequestCopyWith<AddColisRequest> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AddColisRequestCopyWith<$Res> {
  factory $AddColisRequestCopyWith(
          AddColisRequest value, $Res Function(AddColisRequest) then) =
      _$AddColisRequestCopyWithImpl<$Res, AddColisRequest>;
  @useResult
  $Res call(
      {String designation,
      String clientName,
      String clientPhone,
      Quartier quartier,
      String modePayement,
      String localisationGps,
      String description,
      bool? isParcel,
      double dueAmount});

  $QuartierCopyWith<$Res> get quartier;
}

/// @nodoc
class _$AddColisRequestCopyWithImpl<$Res, $Val extends AddColisRequest>
    implements $AddColisRequestCopyWith<$Res> {
  _$AddColisRequestCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? designation = null,
    Object? clientName = null,
    Object? clientPhone = null,
    Object? quartier = null,
    Object? modePayement = null,
    Object? localisationGps = null,
    Object? description = null,
    Object? isParcel = freezed,
    Object? dueAmount = null,
  }) {
    return _then(_value.copyWith(
      designation: null == designation
          ? _value.designation
          : designation // ignore: cast_nullable_to_non_nullable
              as String,
      clientName: null == clientName
          ? _value.clientName
          : clientName // ignore: cast_nullable_to_non_nullable
              as String,
      clientPhone: null == clientPhone
          ? _value.clientPhone
          : clientPhone // ignore: cast_nullable_to_non_nullable
              as String,
      quartier: null == quartier
          ? _value.quartier
          : quartier // ignore: cast_nullable_to_non_nullable
              as Quartier,
      modePayement: null == modePayement
          ? _value.modePayement
          : modePayement // ignore: cast_nullable_to_non_nullable
              as String,
      localisationGps: null == localisationGps
          ? _value.localisationGps
          : localisationGps // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      isParcel: freezed == isParcel
          ? _value.isParcel
          : isParcel // ignore: cast_nullable_to_non_nullable
              as bool?,
      dueAmount: null == dueAmount
          ? _value.dueAmount
          : dueAmount // ignore: cast_nullable_to_non_nullable
              as double,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $QuartierCopyWith<$Res> get quartier {
    return $QuartierCopyWith<$Res>(_value.quartier, (value) {
      return _then(_value.copyWith(quartier: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$AddColisRequestImplCopyWith<$Res>
    implements $AddColisRequestCopyWith<$Res> {
  factory _$$AddColisRequestImplCopyWith(_$AddColisRequestImpl value,
          $Res Function(_$AddColisRequestImpl) then) =
      __$$AddColisRequestImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String designation,
      String clientName,
      String clientPhone,
      Quartier quartier,
      String modePayement,
      String localisationGps,
      String description,
      bool? isParcel,
      double dueAmount});

  @override
  $QuartierCopyWith<$Res> get quartier;
}

/// @nodoc
class __$$AddColisRequestImplCopyWithImpl<$Res>
    extends _$AddColisRequestCopyWithImpl<$Res, _$AddColisRequestImpl>
    implements _$$AddColisRequestImplCopyWith<$Res> {
  __$$AddColisRequestImplCopyWithImpl(
      _$AddColisRequestImpl _value, $Res Function(_$AddColisRequestImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? designation = null,
    Object? clientName = null,
    Object? clientPhone = null,
    Object? quartier = null,
    Object? modePayement = null,
    Object? localisationGps = null,
    Object? description = null,
    Object? isParcel = freezed,
    Object? dueAmount = null,
  }) {
    return _then(_$AddColisRequestImpl(
      designation: null == designation
          ? _value.designation
          : designation // ignore: cast_nullable_to_non_nullable
              as String,
      clientName: null == clientName
          ? _value.clientName
          : clientName // ignore: cast_nullable_to_non_nullable
              as String,
      clientPhone: null == clientPhone
          ? _value.clientPhone
          : clientPhone // ignore: cast_nullable_to_non_nullable
              as String,
      quartier: null == quartier
          ? _value.quartier
          : quartier // ignore: cast_nullable_to_non_nullable
              as Quartier,
      modePayement: null == modePayement
          ? _value.modePayement
          : modePayement // ignore: cast_nullable_to_non_nullable
              as String,
      localisationGps: null == localisationGps
          ? _value.localisationGps
          : localisationGps // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      isParcel: freezed == isParcel
          ? _value.isParcel
          : isParcel // ignore: cast_nullable_to_non_nullable
              as bool?,
      dueAmount: null == dueAmount
          ? _value.dueAmount
          : dueAmount // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$AddColisRequestImpl implements _AddColisRequest {
  const _$AddColisRequestImpl(
      {required this.designation,
      required this.clientName,
      required this.clientPhone,
      required this.quartier,
      required this.modePayement,
      required this.localisationGps,
      required this.description,
      this.isParcel = true,
      required this.dueAmount});

  factory _$AddColisRequestImpl.fromJson(Map<String, dynamic> json) =>
      _$$AddColisRequestImplFromJson(json);

  @override
  final String designation;
  @override
  final String clientName;
  @override
  final String clientPhone;
  @override
  final Quartier quartier;
  @override
  final String modePayement;
  @override
  final String localisationGps;
  @override
  final String description;
  @override
  @JsonKey()
  final bool? isParcel;
  @override
  final double dueAmount;

  @override
  String toString() {
    return 'AddColisRequest(designation: $designation, clientName: $clientName, clientPhone: $clientPhone, quartier: $quartier, modePayement: $modePayement, localisationGps: $localisationGps, description: $description, isParcel: $isParcel, dueAmount: $dueAmount)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AddColisRequestImpl &&
            (identical(other.designation, designation) ||
                other.designation == designation) &&
            (identical(other.clientName, clientName) ||
                other.clientName == clientName) &&
            (identical(other.clientPhone, clientPhone) ||
                other.clientPhone == clientPhone) &&
            (identical(other.quartier, quartier) ||
                other.quartier == quartier) &&
            (identical(other.modePayement, modePayement) ||
                other.modePayement == modePayement) &&
            (identical(other.localisationGps, localisationGps) ||
                other.localisationGps == localisationGps) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.isParcel, isParcel) ||
                other.isParcel == isParcel) &&
            (identical(other.dueAmount, dueAmount) ||
                other.dueAmount == dueAmount));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      designation,
      clientName,
      clientPhone,
      quartier,
      modePayement,
      localisationGps,
      description,
      isParcel,
      dueAmount);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AddColisRequestImplCopyWith<_$AddColisRequestImpl> get copyWith =>
      __$$AddColisRequestImplCopyWithImpl<_$AddColisRequestImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AddColisRequestImplToJson(
      this,
    );
  }
}

abstract class _AddColisRequest implements AddColisRequest {
  const factory _AddColisRequest(
      {required final String designation,
      required final String clientName,
      required final String clientPhone,
      required final Quartier quartier,
      required final String modePayement,
      required final String localisationGps,
      required final String description,
      final bool? isParcel,
      required final double dueAmount}) = _$AddColisRequestImpl;

  factory _AddColisRequest.fromJson(Map<String, dynamic> json) =
      _$AddColisRequestImpl.fromJson;

  @override
  String get designation;
  @override
  String get clientName;
  @override
  String get clientPhone;
  @override
  Quartier get quartier;
  @override
  String get modePayement;
  @override
  String get localisationGps;
  @override
  String get description;
  @override
  bool? get isParcel;
  @override
  double get dueAmount;
  @override
  @JsonKey(ignore: true)
  _$$AddColisRequestImplCopyWith<_$AddColisRequestImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
