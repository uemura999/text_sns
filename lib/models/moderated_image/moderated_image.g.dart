// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'moderated_image.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ModeratedImageImpl _$$ModeratedImageImplFromJson(Map<String, dynamic> json) =>
    _$ModeratedImageImpl(
      bucketName: json['bucketName'] as String,
      moderationLabels: (json['moderationLabels'] as List<dynamic>?)
              ?.map((e) => e as Map<String, dynamic>)
              .toList() ??
          const [],
      moderationModelVersion: json['moderationModelVersion'] ?? "",
      fileName: json['fileName'] ?? "",
    );

Map<String, dynamic> _$$ModeratedImageImplToJson(
        _$ModeratedImageImpl instance) =>
    <String, dynamic>{
      'bucketName': instance.bucketName,
      'moderationLabels': instance.moderationLabels,
      'moderationModelVersion': instance.moderationModelVersion,
      'fileName': instance.fileName,
    };
