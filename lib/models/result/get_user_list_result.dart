import '../some_object.dart';

class GetUserListResult {
  int? id;
  String? email;
  String? first_name;
  String? last_name;
  String? avatar;

  GetUserListResult({
    this.id,
    this.email,
    this.first_name,
    this.last_name,
    this.avatar,
  });

  factory GetUserListResult.fromJson(Map<String, dynamic> json) =>
      GetUserListResult(
        id: json['id'] as int?,
        email: json['email'] as String?,
        first_name: json['first_name'] as String?,
        last_name: json['last_name'] as String?,
        avatar: json['avatar'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'email': email,
        'first_name': first_name,
        'last_name': last_name,
        'avatar': avatar,
      };
}
