// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'post.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Post _$PostFromJson(Map<String, dynamic> json) {
  return _Post.fromJson(json);
}

/// @nodoc
mixin _$Post {
  int get commentCount => throw _privateConstructorUsedError;
  String get content => throw _privateConstructorUsedError; //投稿の中身
  dynamic get createdAt => throw _privateConstructorUsedError;
  int get likeCount => throw _privateConstructorUsedError;
  dynamic get parentDocRef => throw _privateConstructorUsedError; //投稿者のDocRef
  String get uid => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PostCopyWith<Post> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PostCopyWith<$Res> {
  factory $PostCopyWith(Post value, $Res Function(Post) then) =
      _$PostCopyWithImpl<$Res, Post>;
  @useResult
  $Res call(
      {int commentCount,
      String content,
      dynamic createdAt,
      int likeCount,
      dynamic parentDocRef,
      String uid});
}

/// @nodoc
class _$PostCopyWithImpl<$Res, $Val extends Post>
    implements $PostCopyWith<$Res> {
  _$PostCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? commentCount = null,
    Object? content = null,
    Object? createdAt = freezed,
    Object? likeCount = null,
    Object? parentDocRef = freezed,
    Object? uid = null,
  }) {
    return _then(_value.copyWith(
      commentCount: null == commentCount
          ? _value.commentCount
          : commentCount // ignore: cast_nullable_to_non_nullable
              as int,
      content: null == content
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as dynamic,
      likeCount: null == likeCount
          ? _value.likeCount
          : likeCount // ignore: cast_nullable_to_non_nullable
              as int,
      parentDocRef: freezed == parentDocRef
          ? _value.parentDocRef
          : parentDocRef // ignore: cast_nullable_to_non_nullable
              as dynamic,
      uid: null == uid
          ? _value.uid
          : uid // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PostImplCopyWith<$Res> implements $PostCopyWith<$Res> {
  factory _$$PostImplCopyWith(
          _$PostImpl value, $Res Function(_$PostImpl) then) =
      __$$PostImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int commentCount,
      String content,
      dynamic createdAt,
      int likeCount,
      dynamic parentDocRef,
      String uid});
}

/// @nodoc
class __$$PostImplCopyWithImpl<$Res>
    extends _$PostCopyWithImpl<$Res, _$PostImpl>
    implements _$$PostImplCopyWith<$Res> {
  __$$PostImplCopyWithImpl(_$PostImpl _value, $Res Function(_$PostImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? commentCount = null,
    Object? content = null,
    Object? createdAt = freezed,
    Object? likeCount = null,
    Object? parentDocRef = freezed,
    Object? uid = null,
  }) {
    return _then(_$PostImpl(
      commentCount: null == commentCount
          ? _value.commentCount
          : commentCount // ignore: cast_nullable_to_non_nullable
              as int,
      content: null == content
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as dynamic,
      likeCount: null == likeCount
          ? _value.likeCount
          : likeCount // ignore: cast_nullable_to_non_nullable
              as int,
      parentDocRef: freezed == parentDocRef
          ? _value.parentDocRef
          : parentDocRef // ignore: cast_nullable_to_non_nullable
              as dynamic,
      uid: null == uid
          ? _value.uid
          : uid // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PostImpl extends _Post {
  const _$PostImpl(
      {this.commentCount = 0,
      required this.content,
      required this.createdAt,
      this.likeCount = 0,
      required this.parentDocRef,
      required this.uid})
      : super._();

  factory _$PostImpl.fromJson(Map<String, dynamic> json) =>
      _$$PostImplFromJson(json);

  @override
  @JsonKey()
  final int commentCount;
  @override
  final String content;
//投稿の中身
  @override
  final dynamic createdAt;
  @override
  @JsonKey()
  final int likeCount;
  @override
  final dynamic parentDocRef;
//投稿者のDocRef
  @override
  final String uid;

  @override
  String toString() {
    return 'Post(commentCount: $commentCount, content: $content, createdAt: $createdAt, likeCount: $likeCount, parentDocRef: $parentDocRef, uid: $uid)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PostImpl &&
            (identical(other.commentCount, commentCount) ||
                other.commentCount == commentCount) &&
            (identical(other.content, content) || other.content == content) &&
            const DeepCollectionEquality().equals(other.createdAt, createdAt) &&
            (identical(other.likeCount, likeCount) ||
                other.likeCount == likeCount) &&
            const DeepCollectionEquality()
                .equals(other.parentDocRef, parentDocRef) &&
            (identical(other.uid, uid) || other.uid == uid));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      commentCount,
      content,
      const DeepCollectionEquality().hash(createdAt),
      likeCount,
      const DeepCollectionEquality().hash(parentDocRef),
      uid);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$PostImplCopyWith<_$PostImpl> get copyWith =>
      __$$PostImplCopyWithImpl<_$PostImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PostImplToJson(
      this,
    );
  }
}

abstract class _Post extends Post {
  const factory _Post(
      {final int commentCount,
      required final String content,
      required final dynamic createdAt,
      final int likeCount,
      required final dynamic parentDocRef,
      required final String uid}) = _$PostImpl;
  const _Post._() : super._();

  factory _Post.fromJson(Map<String, dynamic> json) = _$PostImpl.fromJson;

  @override
  int get commentCount;
  @override
  String get content;
  @override //投稿の中身
  dynamic get createdAt;
  @override
  int get likeCount;
  @override
  dynamic get parentDocRef;
  @override //投稿者のDocRef
  String get uid;
  @override
  @JsonKey(ignore: true)
  _$$PostImplCopyWith<_$PostImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
