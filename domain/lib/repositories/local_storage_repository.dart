abstract class LocalStorageRepository {
  Future<bool> clear();
  Future<bool> saveUserId(String userId);
  String getUserId();
}