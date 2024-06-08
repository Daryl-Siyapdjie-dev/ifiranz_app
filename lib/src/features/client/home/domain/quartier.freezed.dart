// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'quartier.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Quartier _$QuartierFromJson(Map<String, dynamic> json) {
  return _Quartier.fromJson(json);
}

/// @nodoc
mixin _$Quartier {
  int? get id => throw _privateConstructorUsedError;
  int? get version => throw _privateConstructorUsedError;
  String? get code => throw _privateConstructorUsedError;
  String? get designation => throw _privateConstructorUsedError;
  QuartierArrondissement? get arrondissement =>
      throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $QuartierCopyWith<Quartier> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $QuartierCopyWith<$Res> {
  factory $QuartierCopyWith(Quartier value, $Res Function(Quartier) then) =
      _$QuartierCopyWithImpl<$Res, Quartier>;
  @useResult
  $Res call(
      {int? id,
      int? version,
      String? code,
      String? designation,
      QuartierArrondissement? arrondissement});

  $QuartierArrondissementCopyWith<$Res>? get arrondissement;
}

/// @nodoc
class _$QuartierCopyWithImpl<$Res, $Val extends Quartier>
    implements $QuartierCopyWith<$Res> {
  _$QuartierCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? version = freezed,
    Object? code = freezed,
    Object? designation = freezed,
    Object? arrondissement = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      version: freezed == version
          ? _value.version
          : version // ignore: cast_nullable_to_non_nullable
              as int?,
      code: freezed == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String?,
      designation: freezed == designation
          ? _value.designation
          : designation // ignore: cast_nullable_to_non_nullable
              as String?,
      arrondissement: freezed == arrondissement
          ? _value.arrondissement
          : arrondissement // ignore: cast_nullable_to_non_nullable
              as QuartierArrondissement?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $QuartierArrondissementCopyWith<$Res>? get arrondissement {
    if (_value.arrondissement == null) {
      return null;
    }

    return $QuartierArrondissementCopyWith<$Res>(_value.arrondissement!,
        (value) {
      return _then(_value.copyWith(arrondissement: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$QuartierImplCopyWith<$Res>
    implements $QuartierCopyWith<$Res> {
  factory _$$QuartierImplCopyWith(
          _$QuartierImpl value, $Res Function(_$QuartierImpl) then) =
      __$$QuartierImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int? id,
      int? version,
      String? code,
      String? designation,
      QuartierArrondissement? arrondissement});

  @override
  $QuartierArrondissementCopyWith<$Res>? get arrondissement;
}

/// @nodoc
class __$$QuartierImplCopyWithImpl<$Res>
    extends _$QuartierCopyWithImpl<$Res, _$QuartierImpl>
    implements _$$QuartierImplCopyWith<$Res> {
  __$$QuartierImplCopyWithImpl(
      _$QuartierImpl _value, $Res Function(_$QuartierImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? version = freezed,
    Object? code = freezed,
    Object? designation = freezed,
    Object? arrondissement = freezed,
  }) {
    return _then(_$QuartierImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      version: freezed == version
          ? _value.version
          : version // ignore: cast_nullable_to_non_nullable
              as int?,
      code: freezed == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String?,
      designation: freezed == designation
          ? _value.designation
          : designation // ignore: cast_nullable_to_non_nullable
              as String?,
      arrondissement: freezed == arrondissement
          ? _value.arrondissement
          : arrondissement // ignore: cast_nullable_to_non_nullable
              as QuartierArrondissement?,
    ));
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true)
class _$QuartierImpl implements _Quartier {
  _$QuartierImpl(
      {this.id,
      this.version,
      this.code,
      this.designation,
      this.arrondissement});

  factory _$QuartierImpl.fromJson(Map<String, dynamic> json) =>
      _$$QuartierImplFromJson(json);

  @override
  final int? id;
  @override
  final int? version;
  @override
  final String? code;
  @override
  final String? designation;
  @override
  final QuartierArrondissement? arrondissement;

  @override
  String toString() {
    return 'Quartier(id: $id, version: $version, code: $code, designation: $designation, arrondissement: $arrondissement)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$QuartierImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.version, version) || other.version == version) &&
            (identical(other.code, code) || other.code == code) &&
            (identical(other.designation, designation) ||
                other.designation == designation) &&
            (identical(other.arrondissement, arrondissement) ||
                other.arrondissement == arrondissement));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, id, version, code, designation, arrondissement);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$QuartierImplCopyWith<_$QuartierImpl> get copyWith =>
      __$$QuartierImplCopyWithImpl<_$QuartierImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$QuartierImplToJson(
      this,
    );
  }
}

abstract class _Quartier implements Quartier {
  factory _Quartier(
      {final int? id,
      final int? version,
      final String? code,
      final String? designation,
      final QuartierArrondissement? arrondissement}) = _$QuartierImpl;

  factory _Quartier.fromJson(Map<String, dynamic> json) =
      _$QuartierImpl.fromJson;

  @override
  int? get id;
  @override
  int? get version;
  @override
  String? get code;
  @override
  String? get designation;
  @override
  QuartierArrondissement? get arrondissement;
  @override
  @JsonKey(ignore: true)
  _$$QuartierImplCopyWith<_$QuartierImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

QuartierArrondissement _$QuartierArrondissementFromJson(
    Map<String, dynamic> json) {
  return _QuartierArrondissement.fromJson(json);
}

/// @nodoc
mixin _$QuartierArrondissement {
  int? get id => throw _privateConstructorUsedError;
  int? get version => throw _privateConstructorUsedError;
  String? get code => throw _privateConstructorUsedError;
  String? get designation => throw _privateConstructorUsedError;
  double? get montant => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $QuartierArrondissementCopyWith<QuartierArrondissement> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $QuartierArrondissementCopyWith<$Res> {
  factory $QuartierArrondissementCopyWith(QuartierArrondissement value,
          $Res Function(QuartierArrondissement) then) =
      _$QuartierArrondissementCopyWithImpl<$Res, QuartierArrondissement>;
  @useResult
  $Res call(
      {int? id,
      int? version,
      String? code,
      String? designation,
      double? montant});
}

/// @nodoc
class _$QuartierArrondissementCopyWithImpl<$Res,
        $Val extends QuartierArrondissement>
    implements $QuartierArrondissementCopyWith<$Res> {
  _$QuartierArrondissementCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? version = freezed,
    Object? code = freezed,
    Object? designation = freezed,
    Object? montant = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      version: freezed == version
          ? _value.version
          : version // ignore: cast_nullable_to_non_nullable
              as int?,
      code: freezed == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String?,
      designation: freezed == designation
          ? _value.designation
          : designation // ignore: cast_nullable_to_non_nullable
              as String?,
      montant: freezed == montant
          ? _value.montant
          : montant // ignore: cast_nullable_to_non_nullable
              as double?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$QuartierArrondissementImplCopyWith<$Res>
    implements $QuartierArrondissementCopyWith<$Res> {
  factory _$$QuartierArrondissementImplCopyWith(
          _$QuartierArrondissementImpl value,
          $Res Function(_$QuartierArrondissementImpl) then) =
      __$$QuartierArrondissementImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int? id,
      int? version,
      String? code,
      String? designation,
      double? montant});
}

/// @nodoc
class __$$QuartierArrondissementImplCopyWithImpl<$Res>
    extends _$QuartierArrondissementCopyWithImpl<$Res,
        _$QuartierArrondissementImpl>
    implements _$$QuartierArrondissementImplCopyWith<$Res> {
  __$$QuartierArrondissementImplCopyWithImpl(
      _$QuartierArrondissementImpl _value,
      $Res Function(_$QuartierArrondissementImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? version = freezed,
    Object? code = freezed,
    Object? designation = freezed,
    Object? montant = freezed,
  }) {
    return _then(_$QuartierArrondissementImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      version: freezed == version
          ? _value.version
          : version // ignore: cast_nullable_to_non_nullable
              as int?,
      code: freezed == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String?,
      designation: freezed == designation
          ? _value.designation
          : designation // ignore: cast_nullable_to_non_nullable
              as String?,
      montant: freezed == montant
          ? _value.montant
          : montant // ignore: cast_nullable_to_non_nullable
              as double?,
    ));
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true)
class _$QuartierArrondissementImpl implements _QuartierArrondissement {
  _$QuartierArrondissementImpl(
      {this.id, this.version, this.code, this.designation, this.montant});

  factory _$QuartierArrondissementImpl.fromJson(Map<String, dynamic> json) =>
      _$$QuartierArrondissementImplFromJson(json);

  @override
  final int? id;
  @override
  final int? version;
  @override
  final String? code;
  @override
  final String? designation;
  @override
  final double? montant;

  @override
  String toString() {
    return 'QuartierArrondissement(id: $id, version: $version, code: $code, designation: $designation, montant: $montant)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$QuartierArrondissementImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.version, version) || other.version == version) &&
            (identical(other.code, code) || other.code == code) &&
            (identical(other.designation, designation) ||
                other.designation == designation) &&
            (identical(other.montant, montant) || other.montant == montant));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, id, version, code, designation, montant);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$QuartierArrondissementImplCopyWith<_$QuartierArrondissementImpl>
      get copyWith => __$$QuartierArrondissementImplCopyWithImpl<
          _$QuartierArrondissementImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$QuartierArrondissementImplToJson(
      this,
    );
  }
}

abstract class _QuartierArrondissement implements QuartierArrondissement {
  factory _QuartierArrondissement(
      {final int? id,
      final int? version,
      final String? code,
      final String? designation,
      final double? montant}) = _$QuartierArrondissementImpl;

  factory _QuartierArrondissement.fromJson(Map<String, dynamic> json) =
      _$QuartierArrondissementImpl.fromJson;

  @override
  int? get id;
  @override
  int? get version;
  @override
  String? get code;
  @override
  String? get designation;
  @override
  double? get montant;
  @override
  @JsonKey(ignore: true)
  _$$QuartierArrondissementImplCopyWith<_$QuartierArrondissementImpl>
      get copyWith => throw _privateConstructorUsedError;
}
