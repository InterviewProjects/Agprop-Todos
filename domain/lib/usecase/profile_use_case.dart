import 'package:domain_package/entities/profile/profile_item.dart';
import 'package:domain_package/repositories/local_storage_repository.dart';
import 'package:domain_package/repositories/profile_repository.dart';

class ProfileUseCase {
  final ProfileRepository _repository;
  final LocalStorageRepository _localStorageRepository;

  ProfileUseCase(this._repository, this._localStorageRepository);

  Future<void> insertProfileItem({required ProfileItem profileItem}) =>
      _repository.insertProfileItem(profileItem: profileItem, userId: _localStorageRepository.getUserId());

  Future<ProfileItem> fetchProfileItem() =>
      _repository.fetchProfileItem(userId: _localStorageRepository.getUserId());

  Future<bool> clear() => _localStorageRepository.clear();
}