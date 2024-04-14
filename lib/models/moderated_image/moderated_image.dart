import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:text_sns/typedefs/firestore_typedef.dart';

part 'moderated_image.freezed.dart';
part 'moderated_image.g.dart';

@freezed
abstract class ModeratedImage implements _$ModeratedImage {
  const ModeratedImage._();
  const factory ModeratedImage({
    required String bucketName,
    @Default([]) List<SDMap> moderationLabels, //不適切な画像の複数の理由
    @Default("") moderationModelVersion, //検証を行ったモデルの名前
    @Default("") fileName,
  }) = _ModeratedImage;

  factory ModeratedImage.fromJson(Map<String, dynamic> json) =>
      _$ModeratedImageFromJson(json);
}
