// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

User _$UserFromJson(Map<String, dynamic> json) => User(
      id: json['_id'] as String?,
      fullName: json['fullName'] as String?,
      mobileNumber: json['mobileNumber'] as String,
      password: json['password'] as String,
      email: json['email'] as String,
      isAdminstritiveUser: json['isAdminstritiveUser'] as bool,
    );

Map<String, dynamic> _$UserToJson(User instance) => <String, dynamic>{
      '_id': instance.id,
      'fullName': instance.fullName,
      'mobileNumber': instance.mobileNumber,
      'password': instance.password,
      'email': instance.email,
      'isAdminstritiveUser': instance.isAdminstritiveUser,
    };
