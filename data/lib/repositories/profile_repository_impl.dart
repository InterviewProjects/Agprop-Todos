import 'dart:async';

import 'package:domain_package/entities/profile/profile_item.dart';
import 'package:domain_package/repositories/profile_repository.dart';
import 'package:firebase_database/firebase_database.dart';

class ProfileRepositoryImpl extends ProfileRepository {
  final FirebaseDatabase _database;

  ProfileRepositoryImpl(this._database,);

  @override
  Future<void> insertProfileItem({required ProfileItem profileItem, required String userId}) async {
    final ref = _database.ref('profiles/$userId/');
    await ref.set(profileItem.toJson());
    return Future.value();
  }

  @override
  Future<ProfileItem> fetchProfileItem({required String userId}) async {
    final ref = _database.ref('profiles/$userId');
    DataSnapshot snapshot = await ref.get();
    final profileMap = snapshot.value as Map<dynamic, dynamic>;
    final profileItem = ProfileItem.fromJson(profileMap);
    return Future.value(profileItem);
  }
}