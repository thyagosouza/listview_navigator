class UserModel {
  final String username;
  final String email;
  final String urlAvatar;
  final int pageGo1;

  const UserModel({
    required this.username,
    required this.email,
    required this.urlAvatar,
    required this.pageGo1,
  });

  static UserModel fromJson(json) => UserModel(
        username: json['username'] as String,
        email: json['email'] as String,
        urlAvatar: json['urlAvatar'] as String,
        pageGo1: json['pageGo1'] as int,
      );
}
