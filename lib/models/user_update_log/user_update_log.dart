import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:text_sns/models/moderated_image/moderated_image.dart';
import 'package:text_sns/typedefs/firestore_typedef.dart';

part 'user_update_log.freezed.dart';
part 'user_update_log.g.dart';

@freezed
abstract class UserUpdateLog implements _$UserUpdateLog {
  const UserUpdateLog._();
  const factory UserUpdateLog({
    required SDMap image,
    required String name,
    required String uid,
  }) = _UserUpdateLog;

  factory UserUpdateLog.fromJson(Map<String, dynamic> json) =>
      _$UserUpdateLogFromJson(json);
  ModeratedImage get typedImage => ModeratedImage.fromJson(image);
}
