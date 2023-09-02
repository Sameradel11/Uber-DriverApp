import 'package:firebase_auth/firebase_auth.dart';

class AuthUsingFirebase {
  signup(String email, String password) async {
    final FirebaseAuth fAuth = FirebaseAuth.instance;
    final firebaseuser = (await fAuth.createUserWithEmailAndPassword(
        email: email, password: password));
  }
}
