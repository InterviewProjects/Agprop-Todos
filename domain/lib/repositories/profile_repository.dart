import 'package:domain_package/entities/profile/profile_item.dart';

abstract class ProfileRepository {
  Future<void> insertProfileItem({required ProfileItem profileItem, required String userId});

  Future<ProfileItem> fetchProfileItem({required String userId});
}