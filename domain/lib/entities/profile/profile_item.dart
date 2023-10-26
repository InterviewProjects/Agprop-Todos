import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:equatable/equatable.dart';

part 'profile_item.g.dart';

@CopyWith()
@JsonSerializable()
class ProfileItem extends Equatable {
  final String? userId;
  final String? emailId;
  final String? name;
  final String? gender;
  final String? city;
  final String? pinCode;
  final String? linkedin;
  final String? facebook;
  final int? timeStamp;

  const ProfileItem({
    this.userId,
    this.emailId,
    this.name,
    this.gender,
    this.city,
    this.pinCode,
    this.linkedin,
    this.facebook,
    this.timeStamp,
  });

  factory ProfileItem.fromJson(Map<dynamic, dynamic> json) => ProfileItem(
      userId: json['userId'] as String?,
      emailId: json['emailId'] as String?,
      name: json['name'] as String?,
      gender: json['gender'] as String?,
      city: json['city'] as String?,
      pinCode: json['pinCode'] as String?,
      linkedin: json['linkedin'] as String?,
      facebook: json['facebook'] as String?,
      timeStamp: json['timeStamp'] as int?
  );

  Map<String, dynamic> toJson() => _$ProfileItemToJson(this);

  @override
  List<Object?> get props => [userId, emailId, name, gender, city, pinCode, linkedin, facebook, timeStamp, timeStamp];
}

extension ProfileItemExtension on ProfileItem {
  ProfileItem copyWith({
    String? userId,
    String? emailId,
    String? name,
    String? gender,
    String? city,
    String? pinCode,
    String? linkedin,
    String? facebook,
    int? timeStamp,
  }) {
    return ProfileItem(
      userId: userId ?? this.userId,
      emailId: emailId ?? this.emailId,
      name: name ?? this.name,
      gender: gender ?? this.gender,
      city: city ?? this.city,
      pinCode: pinCode ?? this.pinCode,
      linkedin: linkedin ?? this.linkedin,
      facebook: facebook ?? this.facebook,
      timeStamp: timeStamp ?? this.timeStamp,
    );
  }
}