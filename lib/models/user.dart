
import 'package:json_annotation/json_annotation.dart';

part 'user.g.dart';

@JsonSerializable()
class User{


  User({
    required this.id,
    required this.fullName,
    required this.mobileNumber,
    required this.password,
    required this.email,
    required this.isAdminstritiveUser,

  });

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

  Map<String, dynamic> toJson() => _$UserToJson(this);



  final String? id;

  final String? fullName;

  final String mobileNumber;

  final String password;

  final String email;

  final bool isAdminstritiveUser;

}