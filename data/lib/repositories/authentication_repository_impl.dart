import 'package:domain_package/repositories/authentication_repository.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthenticationRepositoryImpl extends AuthenticationRepository {
  @override
  Future<String?> signInWithEmailAndPassword({required String email, required String password}) async {
    String? returnValue;
    try {
      final response = await FirebaseAuth.instance.signInWithEmailAndPassword(email: email, password: password);
      returnValue = response.user?.uid;
    } catch(e) {
      returnValue = null;
    }

    return returnValue;
  }

  @override
  Future<String?> createUserWithEmailAndPassword({required String email, required String password}) async {
    String? returnValue;
    try {
      final response = await FirebaseAuth.instance.createUserWithEmailAndPassword(email: email, password: password);
      returnValue = response.user?.uid;
    } catch(e) {
      returnValue = null;
    }

    return returnValue;
  }

  @override
  Future<bool> sendPasswordResetEmail({required String email}) async {
    bool returnValue;
    try {
      await FirebaseAuth.instance.sendPasswordResetEmail(email: email);
      returnValue = true;
    } catch(e) {
      returnValue = false;
    }

    return returnValue;
  }

}