import 'package:freezed_annotation/freezed_annotation.dart';

part 'public_user.freezed.dart';
part 'public_user.g.dart';

@freezed
abstract class PublicUser implements _$PublicUser {
  const PublicUser._();
  const factory PublicUser({
    required int followerCount,
    required int followingCount,
    required String uid,
  }) = _PublicUser;

  factory PublicUser.fromJson(Map<String, dynamic> json) =>
      _$PublicUserFromJson(json);
}
