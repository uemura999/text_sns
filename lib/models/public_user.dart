class PublicUser {
  PublicUser({
    required this.followerCount,
    required this.followingCount,
    required this.uid,
  });
  final int followingCount;
  final int followerCount;
  final String uid;

  factory PublicUser.fromJson(Map<String, dynamic> json) => PublicUser(
      followerCount: json["followerCount"],
      followingCount: json["followingCount"],
      uid: json["uid"]);

  Map<String, dynamic> toJson() => {
        "followingCount": followingCount,
        "followerCount": followerCount,
        "uid": uid,
      };
}
