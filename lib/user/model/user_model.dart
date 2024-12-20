class UserModel {
  final int userId;
  final int id;
  final String title;
  final String body;

  UserModel({
    required this.userId,
    required this.id,
    required this.title,
    required this.body,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      userId: json['userId'] ?? 0,
      id: json['id'] ?? 0,
      title: json['title'] ?? '',
      body: json['body'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'userId': userId,
      'id': id,
      'title': title,
      'body': body,
    };
  }
}