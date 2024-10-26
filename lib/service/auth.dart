import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import '../model/user_model.dart';

class AuthorizationService extends GetxController {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  var activeUserId = ''.obs;

  UserModel? _createUser(User? user) {
    return user == null ? null : UserModel.tofirebase(user);
  }

  Future<UserModel?> createUser(String email, String password) async {
    var userCredentials = await _firebaseAuth.createUserWithEmailAndPassword(
        email: email, password: password);
    return _createUser(userCredentials.user);
  }

  Stream<UserModel?> get authStatus {
    return _firebaseAuth.authStateChanges().map(_createUser);
  }

  Future<UserModel?> signIn(String email, String password) async {
    try {
      var userCredentials = await _firebaseAuth.signInWithEmailAndPassword(
          email: email, password: password);
      activeUserId.value = userCredentials.user!.uid;
      return _createUser(userCredentials.user);
    } catch (e) {
      print(e);
      return null;
    }
  }

  Future<void> signOut() {
    return _firebaseAuth.signOut();
  }

  Future<void> passwordReset(String email) async {
    await _firebaseAuth.sendPasswordResetEmail(email: email);
  }
}
