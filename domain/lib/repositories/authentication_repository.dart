abstract class AuthenticationRepository {
  Future<String?> signInWithEmailAndPassword({required String email, required String password});
  Future<String?> createUserWithEmailAndPassword({required String email, required String password});
  Future<bool> sendPasswordResetEmail({required String email});
}