class PublicUser {
  PublicUser({
    required this.followerCount,
    required this.followingCount,
    required this.uid,
  });
  final int followingCount;
  final int followerCount;
  final String uid;

  Map<String, dynamic> toJson() => {
        "followingCount": followingCount,
        "followerCount": followerCount,
        "uid": uid,
      };
}
