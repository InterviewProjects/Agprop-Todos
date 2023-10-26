import 'package:domain_package/entities/profile/profile_item.dart';
import 'package:domain_package/extensions/string_extension.dart';
import 'package:domain_package/repositories/authentication_repository.dart';
import 'package:domain_package/repositories/local_storage_repository.dart';
import 'package:domain_package/repositories/profile_repository.dart';

class AuthenticationUseCase {
  final AuthenticationRepository _repository;
  final LocalStorageRepository _localStorageRepository;
  final ProfileRepository _profileRepository;
  AuthenticationUseCase(this._repository, this._localStorageRepository, this._profileRepository);

  String getUserId() => _localStorageRepository.getUserId();

  Future<bool> saveUserId(String userId) => _localStorageRepository.saveUserId(userId);

  Future<bool> signInWithEmailAndPassword({required String email, required String password}) async {
    final userId = await _repository.signInWithEmailAndPassword(email: email, password: password);
    final isSuccessfulSignIn = userId.isNullEmptyOrWhitespace == false;
    if (isSuccessfulSignIn) {
      await _localStorageRepository.saveUserId(userId!);
    }
    return isSuccessfulSignIn;
  }

  Future<bool> createUserWithEmailAndPassword({required String email, required String password}) async {
    final userId = await _repository.createUserWithEmailAndPassword(email: email, password: password);
    final isSuccessfulSignUp = userId.isNullEmptyOrWhitespace == false;
    if (isSuccessfulSignUp) {
      await _localStorageRepository.saveUserId(userId!);
      await _profileRepository.insertProfileItem(profileItem: ProfileItem(userId: userId, emailId: email), userId: userId);
    }
    return isSuccessfulSignUp;
  }


  Future<bool> sendPasswordResetEmail({required String email}) =>
      _repository.sendPasswordResetEmail(email: email);
}