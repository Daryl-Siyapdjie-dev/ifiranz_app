// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'commission_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Commission _$CommissionFromJson(Map<String, dynamic> json) {
  return _Commission.fromJson(json);
}

/// @nodoc
mixin _$Commission {
  String? get timeStamp => throw _privateConstructorUsedError;
  int? get statusCode => throw _privateConstructorUsedError;
  String? get httpStatus => throw _privateConstructorUsedError;
  String? get message => throw _privateConstructorUsedError;
  Datas? get datas => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CommissionCopyWith<Commission> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CommissionCopyWith<$Res> {
  factory $CommissionCopyWith(
          Commission value, $Res Function(Commission) then) =
      _$CommissionCopyWithImpl<$Res, Commission>;
  @useResult
  $Res call(
      {String? timeStamp,
      int? statusCode,
      String? httpStatus,
      String? message,
      Datas? datas});

  $DatasCopyWith<$Res>? get datas;
}

/// @nodoc
class _$CommissionCopyWithImpl<$Res, $Val extends Commission>
    implements $CommissionCopyWith<$Res> {
  _$CommissionCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? timeStamp = freezed,
    Object? statusCode = freezed,
    Object? httpStatus = freezed,
    Object? message = freezed,
    Object? datas = freezed,
  }) {
    return _then(_value.copyWith(
      timeStamp: freezed == timeStamp
          ? _value.timeStamp
          : timeStamp // ignore: cast_nullable_to_non_nullable
              as String?,
      statusCode: freezed == statusCode
          ? _value.statusCode
          : statusCode // ignore: cast_nullable_to_non_nullable
              as int?,
      httpStatus: freezed == httpStatus
          ? _value.httpStatus
          : httpStatus // ignore: cast_nullable_to_non_nullable
              as String?,
      message: freezed == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
      datas: freezed == datas
          ? _value.datas
          : datas // ignore: cast_nullable_to_non_nullable
              as Datas?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $DatasCopyWith<$Res>? get datas {
    if (_value.datas == null) {
      return null;
    }

    return $DatasCopyWith<$Res>(_value.datas!, (value) {
      return _then(_value.copyWith(datas: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$CommissionImplCopyWith<$Res>
    implements $CommissionCopyWith<$Res> {
  factory _$$CommissionImplCopyWith(
          _$CommissionImpl value, $Res Function(_$CommissionImpl) then) =
      __$$CommissionImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? timeStamp,
      int? statusCode,
      String? httpStatus,
      String? message,
      Datas? datas});

  @override
  $DatasCopyWith<$Res>? get datas;
}

/// @nodoc
class __$$CommissionImplCopyWithImpl<$Res>
    extends _$CommissionCopyWithImpl<$Res, _$CommissionImpl>
    implements _$$CommissionImplCopyWith<$Res> {
  __$$CommissionImplCopyWithImpl(
      _$CommissionImpl _value, $Res Function(_$CommissionImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? timeStamp = freezed,
    Object? statusCode = freezed,
    Object? httpStatus = freezed,
    Object? message = freezed,
    Object? datas = freezed,
  }) {
    return _then(_$CommissionImpl(
      timeStamp: freezed == timeStamp
          ? _value.timeStamp
          : timeStamp // ignore: cast_nullable_to_non_nullable
              as String?,
      statusCode: freezed == statusCode
          ? _value.statusCode
          : statusCode // ignore: cast_nullable_to_non_nullable
              as int?,
      httpStatus: freezed == httpStatus
          ? _value.httpStatus
          : httpStatus // ignore: cast_nullable_to_non_nullable
              as String?,
      message: freezed == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
      datas: freezed == datas
          ? _value.datas
          : datas // ignore: cast_nullable_to_non_nullable
              as Datas?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CommissionImpl extends _Commission {
  const _$CommissionImpl(
      {this.timeStamp,
      this.statusCode,
      this.httpStatus,
      this.message,
      this.datas})
      : super._();

  factory _$CommissionImpl.fromJson(Map<String, dynamic> json) =>
      _$$CommissionImplFromJson(json);

  @override
  final String? timeStamp;
  @override
  final int? statusCode;
  @override
  final String? httpStatus;
  @override
  final String? message;
  @override
  final Datas? datas;

  @override
  String toString() {
    return 'Commission(timeStamp: $timeStamp, statusCode: $statusCode, httpStatus: $httpStatus, message: $message, datas: $datas)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CommissionImpl &&
            (identical(other.timeStamp, timeStamp) ||
                other.timeStamp == timeStamp) &&
            (identical(other.statusCode, statusCode) ||
                other.statusCode == statusCode) &&
            (identical(other.httpStatus, httpStatus) ||
                other.httpStatus == httpStatus) &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.datas, datas) || other.datas == datas));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, timeStamp, statusCode, httpStatus, message, datas);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CommissionImplCopyWith<_$CommissionImpl> get copyWith =>
      __$$CommissionImplCopyWithImpl<_$CommissionImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CommissionImplToJson(
      this,
    );
  }
}

abstract class _Commission extends Commission {
  const factory _Commission(
      {final String? timeStamp,
      final int? statusCode,
      final String? httpStatus,
      final String? message,
      final Datas? datas}) = _$CommissionImpl;
  const _Commission._() : super._();

  factory _Commission.fromJson(Map<String, dynamic> json) =
      _$CommissionImpl.fromJson;

  @override
  String? get timeStamp;
  @override
  int? get statusCode;
  @override
  String? get httpStatus;
  @override
  String? get message;
  @override
  Datas? get datas;
  @override
  @JsonKey(ignore: true)
  _$$CommissionImplCopyWith<_$CommissionImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

Datas _$DatasFromJson(Map<String, dynamic> json) {
  return _Datas.fromJson(json);
}

/// @nodoc
mixin _$Datas {
  Commissions? get commissions => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $DatasCopyWith<Datas> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DatasCopyWith<$Res> {
  factory $DatasCopyWith(Datas value, $Res Function(Datas) then) =
      _$DatasCopyWithImpl<$Res, Datas>;
  @useResult
  $Res call({Commissions? commissions});

  $CommissionsCopyWith<$Res>? get commissions;
}

/// @nodoc
class _$DatasCopyWithImpl<$Res, $Val extends Datas>
    implements $DatasCopyWith<$Res> {
  _$DatasCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? commissions = freezed,
  }) {
    return _then(_value.copyWith(
      commissions: freezed == commissions
          ? _value.commissions
          : commissions // ignore: cast_nullable_to_non_nullable
              as Commissions?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $CommissionsCopyWith<$Res>? get commissions {
    if (_value.commissions == null) {
      return null;
    }

    return $CommissionsCopyWith<$Res>(_value.commissions!, (value) {
      return _then(_value.copyWith(commissions: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$DatasImplCopyWith<$Res> implements $DatasCopyWith<$Res> {
  factory _$$DatasImplCopyWith(
          _$DatasImpl value, $Res Function(_$DatasImpl) then) =
      __$$DatasImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({Commissions? commissions});

  @override
  $CommissionsCopyWith<$Res>? get commissions;
}

/// @nodoc
class __$$DatasImplCopyWithImpl<$Res>
    extends _$DatasCopyWithImpl<$Res, _$DatasImpl>
    implements _$$DatasImplCopyWith<$Res> {
  __$$DatasImplCopyWithImpl(
      _$DatasImpl _value, $Res Function(_$DatasImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? commissions = freezed,
  }) {
    return _then(_$DatasImpl(
      commissions: freezed == commissions
          ? _value.commissions
          : commissions // ignore: cast_nullable_to_non_nullable
              as Commissions?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$DatasImpl extends _Datas {
  const _$DatasImpl({this.commissions}) : super._();

  factory _$DatasImpl.fromJson(Map<String, dynamic> json) =>
      _$$DatasImplFromJson(json);

  @override
  final Commissions? commissions;

  @override
  String toString() {
    return 'Datas(commissions: $commissions)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DatasImpl &&
            (identical(other.commissions, commissions) ||
                other.commissions == commissions));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, commissions);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$DatasImplCopyWith<_$DatasImpl> get copyWith =>
      __$$DatasImplCopyWithImpl<_$DatasImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$DatasImplToJson(
      this,
    );
  }
}

abstract class _Datas extends Datas {
  const factory _Datas({final Commissions? commissions}) = _$DatasImpl;
  const _Datas._() : super._();

  factory _Datas.fromJson(Map<String, dynamic> json) = _$DatasImpl.fromJson;

  @override
  Commissions? get commissions;
  @override
  @JsonKey(ignore: true)
  _$$DatasImplCopyWith<_$DatasImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

Commissions _$CommissionsFromJson(Map<String, dynamic> json) {
  return _Commissions.fromJson(json);
}

/// @nodoc
mixin _$Commissions {
  List<CommissionModel>? get content => throw _privateConstructorUsedError;
  Pageable? get pageable => throw _privateConstructorUsedError;
  int? get totalPages => throw _privateConstructorUsedError;
  int? get totalElements => throw _privateConstructorUsedError;
  bool? get last => throw _privateConstructorUsedError;
  int? get size => throw _privateConstructorUsedError;
  int? get number => throw _privateConstructorUsedError;
  List<Object>? get sort => throw _privateConstructorUsedError;
  int? get numberOfElements => throw _privateConstructorUsedError;
  bool? get first => throw _privateConstructorUsedError;
  bool? get empty => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CommissionsCopyWith<Commissions> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CommissionsCopyWith<$Res> {
  factory $CommissionsCopyWith(
          Commissions value, $Res Function(Commissions) then) =
      _$CommissionsCopyWithImpl<$Res, Commissions>;
  @useResult
  $Res call(
      {List<CommissionModel>? content,
      Pageable? pageable,
      int? totalPages,
      int? totalElements,
      bool? last,
      int? size,
      int? number,
      List<Object>? sort,
      int? numberOfElements,
      bool? first,
      bool? empty});

  $PageableCopyWith<$Res>? get pageable;
}

/// @nodoc
class _$CommissionsCopyWithImpl<$Res, $Val extends Commissions>
    implements $CommissionsCopyWith<$Res> {
  _$CommissionsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? content = freezed,
    Object? pageable = freezed,
    Object? totalPages = freezed,
    Object? totalElements = freezed,
    Object? last = freezed,
    Object? size = freezed,
    Object? number = freezed,
    Object? sort = freezed,
    Object? numberOfElements = freezed,
    Object? first = freezed,
    Object? empty = freezed,
  }) {
    return _then(_value.copyWith(
      content: freezed == content
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as List<CommissionModel>?,
      pageable: freezed == pageable
          ? _value.pageable
          : pageable // ignore: cast_nullable_to_non_nullable
              as Pageable?,
      totalPages: freezed == totalPages
          ? _value.totalPages
          : totalPages // ignore: cast_nullable_to_non_nullable
              as int?,
      totalElements: freezed == totalElements
          ? _value.totalElements
          : totalElements // ignore: cast_nullable_to_non_nullable
              as int?,
      last: freezed == last
          ? _value.last
          : last // ignore: cast_nullable_to_non_nullable
              as bool?,
      size: freezed == size
          ? _value.size
          : size // ignore: cast_nullable_to_non_nullable
              as int?,
      number: freezed == number
          ? _value.number
          : number // ignore: cast_nullable_to_non_nullable
              as int?,
      sort: freezed == sort
          ? _value.sort
          : sort // ignore: cast_nullable_to_non_nullable
              as List<Object>?,
      numberOfElements: freezed == numberOfElements
          ? _value.numberOfElements
          : numberOfElements // ignore: cast_nullable_to_non_nullable
              as int?,
      first: freezed == first
          ? _value.first
          : first // ignore: cast_nullable_to_non_nullable
              as bool?,
      empty: freezed == empty
          ? _value.empty
          : empty // ignore: cast_nullable_to_non_nullable
              as bool?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $PageableCopyWith<$Res>? get pageable {
    if (_value.pageable == null) {
      return null;
    }

    return $PageableCopyWith<$Res>(_value.pageable!, (value) {
      return _then(_value.copyWith(pageable: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$CommissionsImplCopyWith<$Res>
    implements $CommissionsCopyWith<$Res> {
  factory _$$CommissionsImplCopyWith(
          _$CommissionsImpl value, $Res Function(_$CommissionsImpl) then) =
      __$$CommissionsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {List<CommissionModel>? content,
      Pageable? pageable,
      int? totalPages,
      int? totalElements,
      bool? last,
      int? size,
      int? number,
      List<Object>? sort,
      int? numberOfElements,
      bool? first,
      bool? empty});

  @override
  $PageableCopyWith<$Res>? get pageable;
}

/// @nodoc
class __$$CommissionsImplCopyWithImpl<$Res>
    extends _$CommissionsCopyWithImpl<$Res, _$CommissionsImpl>
    implements _$$CommissionsImplCopyWith<$Res> {
  __$$CommissionsImplCopyWithImpl(
      _$CommissionsImpl _value, $Res Function(_$CommissionsImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? content = freezed,
    Object? pageable = freezed,
    Object? totalPages = freezed,
    Object? totalElements = freezed,
    Object? last = freezed,
    Object? size = freezed,
    Object? number = freezed,
    Object? sort = freezed,
    Object? numberOfElements = freezed,
    Object? first = freezed,
    Object? empty = freezed,
  }) {
    return _then(_$CommissionsImpl(
      content: freezed == content
          ? _value._content
          : content // ignore: cast_nullable_to_non_nullable
              as List<CommissionModel>?,
      pageable: freezed == pageable
          ? _value.pageable
          : pageable // ignore: cast_nullable_to_non_nullable
              as Pageable?,
      totalPages: freezed == totalPages
          ? _value.totalPages
          : totalPages // ignore: cast_nullable_to_non_nullable
              as int?,
      totalElements: freezed == totalElements
          ? _value.totalElements
          : totalElements // ignore: cast_nullable_to_non_nullable
              as int?,
      last: freezed == last
          ? _value.last
          : last // ignore: cast_nullable_to_non_nullable
              as bool?,
      size: freezed == size
          ? _value.size
          : size // ignore: cast_nullable_to_non_nullable
              as int?,
      number: freezed == number
          ? _value.number
          : number // ignore: cast_nullable_to_non_nullable
              as int?,
      sort: freezed == sort
          ? _value._sort
          : sort // ignore: cast_nullable_to_non_nullable
              as List<Object>?,
      numberOfElements: freezed == numberOfElements
          ? _value.numberOfElements
          : numberOfElements // ignore: cast_nullable_to_non_nullable
              as int?,
      first: freezed == first
          ? _value.first
          : first // ignore: cast_nullable_to_non_nullable
              as bool?,
      empty: freezed == empty
          ? _value.empty
          : empty // ignore: cast_nullable_to_non_nullable
              as bool?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CommissionsImpl extends _Commissions {
  const _$CommissionsImpl(
      {final List<CommissionModel>? content,
      this.pageable,
      this.totalPages,
      this.totalElements,
      this.last,
      this.size,
      this.number,
      final List<Object>? sort,
      this.numberOfElements,
      this.first,
      this.empty})
      : _content = content,
        _sort = sort,
        super._();

  factory _$CommissionsImpl.fromJson(Map<String, dynamic> json) =>
      _$$CommissionsImplFromJson(json);

  final List<CommissionModel>? _content;
  @override
  List<CommissionModel>? get content {
    final value = _content;
    if (value == null) return null;
    if (_content is EqualUnmodifiableListView) return _content;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  final Pageable? pageable;
  @override
  final int? totalPages;
  @override
  final int? totalElements;
  @override
  final bool? last;
  @override
  final int? size;
  @override
  final int? number;
  final List<Object>? _sort;
  @override
  List<Object>? get sort {
    final value = _sort;
    if (value == null) return null;
    if (_sort is EqualUnmodifiableListView) return _sort;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  final int? numberOfElements;
  @override
  final bool? first;
  @override
  final bool? empty;

  @override
  String toString() {
    return 'Commissions(content: $content, pageable: $pageable, totalPages: $totalPages, totalElements: $totalElements, last: $last, size: $size, number: $number, sort: $sort, numberOfElements: $numberOfElements, first: $first, empty: $empty)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CommissionsImpl &&
            const DeepCollectionEquality().equals(other._content, _content) &&
            (identical(other.pageable, pageable) ||
                other.pageable == pageable) &&
            (identical(other.totalPages, totalPages) ||
                other.totalPages == totalPages) &&
            (identical(other.totalElements, totalElements) ||
                other.totalElements == totalElements) &&
            (identical(other.last, last) || other.last == last) &&
            (identical(other.size, size) || other.size == size) &&
            (identical(other.number, number) || other.number == number) &&
            const DeepCollectionEquality().equals(other._sort, _sort) &&
            (identical(other.numberOfElements, numberOfElements) ||
                other.numberOfElements == numberOfElements) &&
            (identical(other.first, first) || other.first == first) &&
            (identical(other.empty, empty) || other.empty == empty));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_content),
      pageable,
      totalPages,
      totalElements,
      last,
      size,
      number,
      const DeepCollectionEquality().hash(_sort),
      numberOfElements,
      first,
      empty);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CommissionsImplCopyWith<_$CommissionsImpl> get copyWith =>
      __$$CommissionsImplCopyWithImpl<_$CommissionsImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CommissionsImplToJson(
      this,
    );
  }
}

abstract class _Commissions extends Commissions {
  const factory _Commissions(
      {final List<CommissionModel>? content,
      final Pageable? pageable,
      final int? totalPages,
      final int? totalElements,
      final bool? last,
      final int? size,
      final int? number,
      final List<Object>? sort,
      final int? numberOfElements,
      final bool? first,
      final bool? empty}) = _$CommissionsImpl;
  const _Commissions._() : super._();

  factory _Commissions.fromJson(Map<String, dynamic> json) =
      _$CommissionsImpl.fromJson;

  @override
  List<CommissionModel>? get content;
  @override
  Pageable? get pageable;
  @override
  int? get totalPages;
  @override
  int? get totalElements;
  @override
  bool? get last;
  @override
  int? get size;
  @override
  int? get number;
  @override
  List<Object>? get sort;
  @override
  int? get numberOfElements;
  @override
  bool? get first;
  @override
  bool? get empty;
  @override
  @JsonKey(ignore: true)
  _$$CommissionsImplCopyWith<_$CommissionsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

CommissionModel _$CommissionModelFromJson(Map<String, dynamic> json) {
  return _CommissionModel.fromJson(json);
}

/// @nodoc
mixin _$CommissionModel {
  int? get idCommission => throw _privateConstructorUsedError;
  String? get code => throw _privateConstructorUsedError;
  int? get commandId => throw _privateConstructorUsedError;
  String? get commandCode => throw _privateConstructorUsedError;
  int? get merchant => throw _privateConstructorUsedError;
  double? get commandAmount => throw _privateConstructorUsedError;
  double? get amount => throw _privateConstructorUsedError;
  double? get retainedAmount => throw _privateConstructorUsedError;
  double? get transactionFees => throw _privateConstructorUsedError;
  double? get deliveryFees => throw _privateConstructorUsedError;
  double? get dueAmount => throw _privateConstructorUsedError;
  bool? get paid => throw _privateConstructorUsedError;
  String? get paymentDate => throw _privateConstructorUsedError;
  String? get date => throw _privateConstructorUsedError;
  String? get time => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CommissionModelCopyWith<CommissionModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CommissionModelCopyWith<$Res> {
  factory $CommissionModelCopyWith(
          CommissionModel value, $Res Function(CommissionModel) then) =
      _$CommissionModelCopyWithImpl<$Res, CommissionModel>;
  @useResult
  $Res call(
      {int? idCommission,
      String? code,
      int? commandId,
      String? commandCode,
      int? merchant,
      double? commandAmount,
      double? amount,
      double? retainedAmount,
      double? transactionFees,
      double? deliveryFees,
      double? dueAmount,
      bool? paid,
      String? paymentDate,
      String? date,
      String? time});
}

/// @nodoc
class _$CommissionModelCopyWithImpl<$Res, $Val extends CommissionModel>
    implements $CommissionModelCopyWith<$Res> {
  _$CommissionModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? idCommission = freezed,
    Object? code = freezed,
    Object? commandId = freezed,
    Object? commandCode = freezed,
    Object? merchant = freezed,
    Object? commandAmount = freezed,
    Object? amount = freezed,
    Object? retainedAmount = freezed,
    Object? transactionFees = freezed,
    Object? deliveryFees = freezed,
    Object? dueAmount = freezed,
    Object? paid = freezed,
    Object? paymentDate = freezed,
    Object? date = freezed,
    Object? time = freezed,
  }) {
    return _then(_value.copyWith(
      idCommission: freezed == idCommission
          ? _value.idCommission
          : idCommission // ignore: cast_nullable_to_non_nullable
              as int?,
      code: freezed == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String?,
      commandId: freezed == commandId
          ? _value.commandId
          : commandId // ignore: cast_nullable_to_non_nullable
              as int?,
      commandCode: freezed == commandCode
          ? _value.commandCode
          : commandCode // ignore: cast_nullable_to_non_nullable
              as String?,
      merchant: freezed == merchant
          ? _value.merchant
          : merchant // ignore: cast_nullable_to_non_nullable
              as int?,
      commandAmount: freezed == commandAmount
          ? _value.commandAmount
          : commandAmount // ignore: cast_nullable_to_non_nullable
              as double?,
      amount: freezed == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as double?,
      retainedAmount: freezed == retainedAmount
          ? _value.retainedAmount
          : retainedAmount // ignore: cast_nullable_to_non_nullable
              as double?,
      transactionFees: freezed == transactionFees
          ? _value.transactionFees
          : transactionFees // ignore: cast_nullable_to_non_nullable
              as double?,
      deliveryFees: freezed == deliveryFees
          ? _value.deliveryFees
          : deliveryFees // ignore: cast_nullable_to_non_nullable
              as double?,
      dueAmount: freezed == dueAmount
          ? _value.dueAmount
          : dueAmount // ignore: cast_nullable_to_non_nullable
              as double?,
      paid: freezed == paid
          ? _value.paid
          : paid // ignore: cast_nullable_to_non_nullable
              as bool?,
      paymentDate: freezed == paymentDate
          ? _value.paymentDate
          : paymentDate // ignore: cast_nullable_to_non_nullable
              as String?,
      date: freezed == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as String?,
      time: freezed == time
          ? _value.time
          : time // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CommissionModelImplCopyWith<$Res>
    implements $CommissionModelCopyWith<$Res> {
  factory _$$CommissionModelImplCopyWith(_$CommissionModelImpl value,
          $Res Function(_$CommissionModelImpl) then) =
      __$$CommissionModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int? idCommission,
      String? code,
      int? commandId,
      String? commandCode,
      int? merchant,
      double? commandAmount,
      double? amount,
      double? retainedAmount,
      double? transactionFees,
      double? deliveryFees,
      double? dueAmount,
      bool? paid,
      String? paymentDate,
      String? date,
      String? time});
}

/// @nodoc
class __$$CommissionModelImplCopyWithImpl<$Res>
    extends _$CommissionModelCopyWithImpl<$Res, _$CommissionModelImpl>
    implements _$$CommissionModelImplCopyWith<$Res> {
  __$$CommissionModelImplCopyWithImpl(
      _$CommissionModelImpl _value, $Res Function(_$CommissionModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? idCommission = freezed,
    Object? code = freezed,
    Object? commandId = freezed,
    Object? commandCode = freezed,
    Object? merchant = freezed,
    Object? commandAmount = freezed,
    Object? amount = freezed,
    Object? retainedAmount = freezed,
    Object? transactionFees = freezed,
    Object? deliveryFees = freezed,
    Object? dueAmount = freezed,
    Object? paid = freezed,
    Object? paymentDate = freezed,
    Object? date = freezed,
    Object? time = freezed,
  }) {
    return _then(_$CommissionModelImpl(
      idCommission: freezed == idCommission
          ? _value.idCommission
          : idCommission // ignore: cast_nullable_to_non_nullable
              as int?,
      code: freezed == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String?,
      commandId: freezed == commandId
          ? _value.commandId
          : commandId // ignore: cast_nullable_to_non_nullable
              as int?,
      commandCode: freezed == commandCode
          ? _value.commandCode
          : commandCode // ignore: cast_nullable_to_non_nullable
              as String?,
      merchant: freezed == merchant
          ? _value.merchant
          : merchant // ignore: cast_nullable_to_non_nullable
              as int?,
      commandAmount: freezed == commandAmount
          ? _value.commandAmount
          : commandAmount // ignore: cast_nullable_to_non_nullable
              as double?,
      amount: freezed == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as double?,
      retainedAmount: freezed == retainedAmount
          ? _value.retainedAmount
          : retainedAmount // ignore: cast_nullable_to_non_nullable
              as double?,
      transactionFees: freezed == transactionFees
          ? _value.transactionFees
          : transactionFees // ignore: cast_nullable_to_non_nullable
              as double?,
      deliveryFees: freezed == deliveryFees
          ? _value.deliveryFees
          : deliveryFees // ignore: cast_nullable_to_non_nullable
              as double?,
      dueAmount: freezed == dueAmount
          ? _value.dueAmount
          : dueAmount // ignore: cast_nullable_to_non_nullable
              as double?,
      paid: freezed == paid
          ? _value.paid
          : paid // ignore: cast_nullable_to_non_nullable
              as bool?,
      paymentDate: freezed == paymentDate
          ? _value.paymentDate
          : paymentDate // ignore: cast_nullable_to_non_nullable
              as String?,
      date: freezed == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as String?,
      time: freezed == time
          ? _value.time
          : time // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CommissionModelImpl extends _CommissionModel {
  const _$CommissionModelImpl(
      {this.idCommission,
      this.code,
      this.commandId,
      this.commandCode,
      this.merchant,
      this.commandAmount = 0.0,
      this.amount = 0.0,
      this.retainedAmount = 0.0,
      this.transactionFees = 0.0,
      this.deliveryFees = 0.0,
      this.dueAmount = 0.0,
      this.paid,
      this.paymentDate,
      this.date,
      this.time})
      : super._();

  factory _$CommissionModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$CommissionModelImplFromJson(json);

  @override
  final int? idCommission;
  @override
  final String? code;
  @override
  final int? commandId;
  @override
  final String? commandCode;
  @override
  final int? merchant;
  @override
  @JsonKey()
  final double? commandAmount;
  @override
  @JsonKey()
  final double? amount;
  @override
  @JsonKey()
  final double? retainedAmount;
  @override
  @JsonKey()
  final double? transactionFees;
  @override
  @JsonKey()
  final double? deliveryFees;
  @override
  @JsonKey()
  final double? dueAmount;
  @override
  final bool? paid;
  @override
  final String? paymentDate;
  @override
  final String? date;
  @override
  final String? time;

  @override
  String toString() {
    return 'CommissionModel(idCommission: $idCommission, code: $code, commandId: $commandId, commandCode: $commandCode, merchant: $merchant, commandAmount: $commandAmount, amount: $amount, retainedAmount: $retainedAmount, transactionFees: $transactionFees, deliveryFees: $deliveryFees, dueAmount: $dueAmount, paid: $paid, paymentDate: $paymentDate, date: $date, time: $time)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CommissionModelImpl &&
            (identical(other.idCommission, idCommission) ||
                other.idCommission == idCommission) &&
            (identical(other.code, code) || other.code == code) &&
            (identical(other.commandId, commandId) ||
                other.commandId == commandId) &&
            (identical(other.commandCode, commandCode) ||
                other.commandCode == commandCode) &&
            (identical(other.merchant, merchant) ||
                other.merchant == merchant) &&
            (identical(other.commandAmount, commandAmount) ||
                other.commandAmount == commandAmount) &&
            (identical(other.amount, amount) || other.amount == amount) &&
            (identical(other.retainedAmount, retainedAmount) ||
                other.retainedAmount == retainedAmount) &&
            (identical(other.transactionFees, transactionFees) ||
                other.transactionFees == transactionFees) &&
            (identical(other.deliveryFees, deliveryFees) ||
                other.deliveryFees == deliveryFees) &&
            (identical(other.dueAmount, dueAmount) ||
                other.dueAmount == dueAmount) &&
            (identical(other.paid, paid) || other.paid == paid) &&
            (identical(other.paymentDate, paymentDate) ||
                other.paymentDate == paymentDate) &&
            (identical(other.date, date) || other.date == date) &&
            (identical(other.time, time) || other.time == time));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      idCommission,
      code,
      commandId,
      commandCode,
      merchant,
      commandAmount,
      amount,
      retainedAmount,
      transactionFees,
      deliveryFees,
      dueAmount,
      paid,
      paymentDate,
      date,
      time);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CommissionModelImplCopyWith<_$CommissionModelImpl> get copyWith =>
      __$$CommissionModelImplCopyWithImpl<_$CommissionModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CommissionModelImplToJson(
      this,
    );
  }
}

abstract class _CommissionModel extends CommissionModel {
  const factory _CommissionModel(
      {final int? idCommission,
      final String? code,
      final int? commandId,
      final String? commandCode,
      final int? merchant,
      final double? commandAmount,
      final double? amount,
      final double? retainedAmount,
      final double? transactionFees,
      final double? deliveryFees,
      final double? dueAmount,
      final bool? paid,
      final String? paymentDate,
      final String? date,
      final String? time}) = _$CommissionModelImpl;
  const _CommissionModel._() : super._();

  factory _CommissionModel.fromJson(Map<String, dynamic> json) =
      _$CommissionModelImpl.fromJson;

  @override
  int? get idCommission;
  @override
  String? get code;
  @override
  int? get commandId;
  @override
  String? get commandCode;
  @override
  int? get merchant;
  @override
  double? get commandAmount;
  @override
  double? get amount;
  @override
  double? get retainedAmount;
  @override
  double? get transactionFees;
  @override
  double? get deliveryFees;
  @override
  double? get dueAmount;
  @override
  bool? get paid;
  @override
  String? get paymentDate;
  @override
  String? get date;
  @override
  String? get time;
  @override
  @JsonKey(ignore: true)
  _$$CommissionModelImplCopyWith<_$CommissionModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

Pageable _$PageableFromJson(Map<String, dynamic> json) {
  return _Pageable.fromJson(json);
}

/// @nodoc
mixin _$Pageable {
  int? get pageNumber => throw _privateConstructorUsedError;
  int? get pageSize => throw _privateConstructorUsedError;
  List<Object>? get sort => throw _privateConstructorUsedError;
  int? get offset => throw _privateConstructorUsedError;
  bool? get paged => throw _privateConstructorUsedError;
  bool? get unpaged => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PageableCopyWith<Pageable> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PageableCopyWith<$Res> {
  factory $PageableCopyWith(Pageable value, $Res Function(Pageable) then) =
      _$PageableCopyWithImpl<$Res, Pageable>;
  @useResult
  $Res call(
      {int? pageNumber,
      int? pageSize,
      List<Object>? sort,
      int? offset,
      bool? paged,
      bool? unpaged});
}

/// @nodoc
class _$PageableCopyWithImpl<$Res, $Val extends Pageable>
    implements $PageableCopyWith<$Res> {
  _$PageableCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? pageNumber = freezed,
    Object? pageSize = freezed,
    Object? sort = freezed,
    Object? offset = freezed,
    Object? paged = freezed,
    Object? unpaged = freezed,
  }) {
    return _then(_value.copyWith(
      pageNumber: freezed == pageNumber
          ? _value.pageNumber
          : pageNumber // ignore: cast_nullable_to_non_nullable
              as int?,
      pageSize: freezed == pageSize
          ? _value.pageSize
          : pageSize // ignore: cast_nullable_to_non_nullable
              as int?,
      sort: freezed == sort
          ? _value.sort
          : sort // ignore: cast_nullable_to_non_nullable
              as List<Object>?,
      offset: freezed == offset
          ? _value.offset
          : offset // ignore: cast_nullable_to_non_nullable
              as int?,
      paged: freezed == paged
          ? _value.paged
          : paged // ignore: cast_nullable_to_non_nullable
              as bool?,
      unpaged: freezed == unpaged
          ? _value.unpaged
          : unpaged // ignore: cast_nullable_to_non_nullable
              as bool?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PageableImplCopyWith<$Res>
    implements $PageableCopyWith<$Res> {
  factory _$$PageableImplCopyWith(
          _$PageableImpl value, $Res Function(_$PageableImpl) then) =
      __$$PageableImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int? pageNumber,
      int? pageSize,
      List<Object>? sort,
      int? offset,
      bool? paged,
      bool? unpaged});
}

/// @nodoc
class __$$PageableImplCopyWithImpl<$Res>
    extends _$PageableCopyWithImpl<$Res, _$PageableImpl>
    implements _$$PageableImplCopyWith<$Res> {
  __$$PageableImplCopyWithImpl(
      _$PageableImpl _value, $Res Function(_$PageableImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? pageNumber = freezed,
    Object? pageSize = freezed,
    Object? sort = freezed,
    Object? offset = freezed,
    Object? paged = freezed,
    Object? unpaged = freezed,
  }) {
    return _then(_$PageableImpl(
      pageNumber: freezed == pageNumber
          ? _value.pageNumber
          : pageNumber // ignore: cast_nullable_to_non_nullable
              as int?,
      pageSize: freezed == pageSize
          ? _value.pageSize
          : pageSize // ignore: cast_nullable_to_non_nullable
              as int?,
      sort: freezed == sort
          ? _value._sort
          : sort // ignore: cast_nullable_to_non_nullable
              as List<Object>?,
      offset: freezed == offset
          ? _value.offset
          : offset // ignore: cast_nullable_to_non_nullable
              as int?,
      paged: freezed == paged
          ? _value.paged
          : paged // ignore: cast_nullable_to_non_nullable
              as bool?,
      unpaged: freezed == unpaged
          ? _value.unpaged
          : unpaged // ignore: cast_nullable_to_non_nullable
              as bool?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PageableImpl extends _Pageable {
  const _$PageableImpl(
      {this.pageNumber,
      this.pageSize,
      final List<Object>? sort,
      this.offset,
      this.paged,
      this.unpaged})
      : _sort = sort,
        super._();

  factory _$PageableImpl.fromJson(Map<String, dynamic> json) =>
      _$$PageableImplFromJson(json);

  @override
  final int? pageNumber;
  @override
  final int? pageSize;
  final List<Object>? _sort;
  @override
  List<Object>? get sort {
    final value = _sort;
    if (value == null) return null;
    if (_sort is EqualUnmodifiableListView) return _sort;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  final int? offset;
  @override
  final bool? paged;
  @override
  final bool? unpaged;

  @override
  String toString() {
    return 'Pageable(pageNumber: $pageNumber, pageSize: $pageSize, sort: $sort, offset: $offset, paged: $paged, unpaged: $unpaged)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PageableImpl &&
            (identical(other.pageNumber, pageNumber) ||
                other.pageNumber == pageNumber) &&
            (identical(other.pageSize, pageSize) ||
                other.pageSize == pageSize) &&
            const DeepCollectionEquality().equals(other._sort, _sort) &&
            (identical(other.offset, offset) || other.offset == offset) &&
            (identical(other.paged, paged) || other.paged == paged) &&
            (identical(other.unpaged, unpaged) || other.unpaged == unpaged));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, pageNumber, pageSize,
      const DeepCollectionEquality().hash(_sort), offset, paged, unpaged);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$PageableImplCopyWith<_$PageableImpl> get copyWith =>
      __$$PageableImplCopyWithImpl<_$PageableImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PageableImplToJson(
      this,
    );
  }
}

abstract class _Pageable extends Pageable {
  const factory _Pageable(
      {final int? pageNumber,
      final int? pageSize,
      final List<Object>? sort,
      final int? offset,
      final bool? paged,
      final bool? unpaged}) = _$PageableImpl;
  const _Pageable._() : super._();

  factory _Pageable.fromJson(Map<String, dynamic> json) =
      _$PageableImpl.fromJson;

  @override
  int? get pageNumber;
  @override
  int? get pageSize;
  @override
  List<Object>? get sort;
  @override
  int? get offset;
  @override
  bool? get paged;
  @override
  bool? get unpaged;
  @override
  @JsonKey(ignore: true)
  _$$PageableImplCopyWith<_$PageableImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
