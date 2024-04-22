// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_update_log.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

UserUpdateLog _$UserUpdateLogFromJson(Map<String, dynamic> json) {
  return _UserUpdateLog.fromJson(json);
}

/// @nodoc
mixin _$UserUpdateLog {
  Map<String, dynamic> get image => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get uid => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UserUpdateLogCopyWith<UserUpdateLog> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserUpdateLogCopyWith<$Res> {
  factory $UserUpdateLogCopyWith(
          UserUpdateLog value, $Res Function(UserUpdateLog) then) =
      _$UserUpdateLogCopyWithImpl<$Res, UserUpdateLog>;
  @useResult
  $Res call({Map<String, dynamic> image, String name, String uid});
}

/// @nodoc
class _$UserUpdateLogCopyWithImpl<$Res, $Val extends UserUpdateLog>
    implements $UserUpdateLogCopyWith<$Res> {
  _$UserUpdateLogCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? image = null,
    Object? name = null,
    Object? uid = null,
  }) {
    return _then(_value.copyWith(
      image: null == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      uid: null == uid
          ? _value.uid
          : uid // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$UserUpdateLogImplCopyWith<$Res>
    implements $UserUpdateLogCopyWith<$Res> {
  factory _$$UserUpdateLogImplCopyWith(
          _$UserUpdateLogImpl value, $Res Function(_$UserUpdateLogImpl) then) =
      __$$UserUpdateLogImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({Map<String, dynamic> image, String name, String uid});
}

/// @nodoc
class __$$UserUpdateLogImplCopyWithImpl<$Res>
    extends _$UserUpdateLogCopyWithImpl<$Res, _$UserUpdateLogImpl>
    implements _$$UserUpdateLogImplCopyWith<$Res> {
  __$$UserUpdateLogImplCopyWithImpl(
      _$UserUpdateLogImpl _value, $Res Function(_$UserUpdateLogImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? image = null,
    Object? name = null,
    Object? uid = null,
  }) {
    return _then(_$UserUpdateLogImpl(
      image: null == image
          ? _value._image
          : image // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      uid: null == uid
          ? _value.uid
          : uid // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$UserUpdateLogImpl extends _UserUpdateLog {
  const _$UserUpdateLogImpl(
      {required final Map<String, dynamic> image,
      required this.name,
      required this.uid})
      : _image = image,
        super._();

  factory _$UserUpdateLogImpl.fromJson(Map<String, dynamic> json) =>
      _$$UserUpdateLogImplFromJson(json);

  final Map<String, dynamic> _image;
  @override
  Map<String, dynamic> get image {
    if (_image is EqualUnmodifiableMapView) return _image;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_image);
  }

  @override
  final String name;
  @override
  final String uid;

  @override
  String toString() {
    return 'UserUpdateLog(image: $image, name: $name, uid: $uid)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UserUpdateLogImpl &&
            const DeepCollectionEquality().equals(other._image, _image) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.uid, uid) || other.uid == uid));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(_image), name, uid);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$UserUpdateLogImplCopyWith<_$UserUpdateLogImpl> get copyWith =>
      __$$UserUpdateLogImplCopyWithImpl<_$UserUpdateLogImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$UserUpdateLogImplToJson(
      this,
    );
  }
}

abstract class _UserUpdateLog extends UserUpdateLog {
  const factory _UserUpdateLog(
      {required final Map<String, dynamic> image,
      required final String name,
      required final String uid}) = _$UserUpdateLogImpl;
  const _UserUpdateLog._() : super._();

  factory _UserUpdateLog.fromJson(Map<String, dynamic> json) =
      _$UserUpdateLogImpl.fromJson;

  @override
  Map<String, dynamic> get image;
  @override
  String get name;
  @override
  String get uid;
  @override
  @JsonKey(ignore: true)
  _$$UserUpdateLogImplCopyWith<_$UserUpdateLogImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
