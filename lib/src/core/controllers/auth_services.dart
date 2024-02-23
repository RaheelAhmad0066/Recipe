import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  // Check if the user is already signed in
  Future<bool> isUserSignedIn() async {
    User? user = _auth.currentUser;
    return user != null;
  }

  // Sign in anonymously
  Future<UserCredential> signInAnonymously() async {
    return await _auth.signInAnonymously();
  }

  // Sign out
  Future<void> signOut() async {
    await _auth.signOut();
  }
}
