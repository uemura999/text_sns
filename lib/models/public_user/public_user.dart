import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:text_sns/typedefs/firestore_typedef.dart';

part 'public_user.freezed.dart';
part 'public_user.g.dart';

@freezed
abstract class PublicUser implements _$PublicUser {
  const PublicUser._();
  const factory PublicUser({
    @Default(0) int followerCount,
    @Default(0) int followingCount,
    required SDMap image,
    @Default("") String name,
    required String uid,
  }) = _PublicUser;

  factory PublicUser.fromJson(Map<String, dynamic> json) =>
      _$PublicUserFromJson(json);
}
