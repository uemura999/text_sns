// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'public_user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PublicUserImpl _$$PublicUserImplFromJson(Map<String, dynamic> json) =>
    _$PublicUserImpl(
      followerCount: json['followerCount'] as int,
      followingCount: json['followingCount'] as int,
      uid: json['uid'] as String,
    );

Map<String, dynamic> _$$PublicUserImplToJson(_$PublicUserImpl instance) =>
    <String, dynamic>{
      'followerCount': instance.followerCount,
      'followingCount': instance.followingCount,
      'uid': instance.uid,
    };
