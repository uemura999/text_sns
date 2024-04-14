// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'public_user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PublicUserImpl _$$PublicUserImplFromJson(Map<String, dynamic> json) =>
    _$PublicUserImpl(
      followerCount: json['followerCount'] as int? ?? 0,
      followingCount: json['followingCount'] as int? ?? 0,
      image: json['image'] as Map<String, dynamic>,
      name: json['name'] as String? ?? "",
      uid: json['uid'] as String,
    );

Map<String, dynamic> _$$PublicUserImplToJson(_$PublicUserImpl instance) =>
    <String, dynamic>{
      'followerCount': instance.followerCount,
      'followingCount': instance.followingCount,
      'image': instance.image,
      'name': instance.name,
      'uid': instance.uid,
    };
