import 'package:data_package/local/local_storage.dart';
import 'package:data_package/utils/data_constants.dart';
import 'package:domain_package/repositories/local_storage_repository.dart';

class LocalStorageRepositoryImpl extends LocalStorageRepository {
  final LocalStorage _localStorage;
  LocalStorageRepositoryImpl(this._localStorage);

  @override
  Future<bool> clear() => _localStorage.clear();

  @override
  getUserId() => _localStorage.getString(DataConstants.USER_ID_KEY);

  @override
  Future<bool> saveUserId(String userId) => _localStorage.setString(DataConstants.USER_ID_KEY, userId);
}