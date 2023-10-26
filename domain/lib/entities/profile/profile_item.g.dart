// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'profile_item.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProfileItem _$ProfileItemFromJson(Map<String, dynamic> json) => ProfileItem(
      userId: json['userId'] as String?,
      emailId: json['emailId'] as String?,
      name: json['name'] as String?,
      gender: json['gender'] as String?,
      city: json['city'] as String?,
      pinCode: json['pinCode'] as String?,
      linkedin: json['linkedin'] as String?,
      facebook: json['facebook'] as String?,
      timeStamp: json['timeStamp'] as int?,
    );

Map<String, dynamic> _$ProfileItemToJson(ProfileItem instance) =>
    <String, dynamic>{
      'userId': instance.userId,
      'emailId': instance.emailId,
      'name': instance.name,
      'gender': instance.gender,
      'city': instance.city,
      'pinCode': instance.pinCode,
      'linkedin': instance.linkedin,
      'facebook': instance.facebook,
      'timeStamp': instance.timeStamp,
    };
