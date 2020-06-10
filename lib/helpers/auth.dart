import 'package:firebase_auth/firebase_auth.dart';

class Auth {

  final FirebaseAuth auth = FirebaseAuth.instance;

  Future<FirebaseUser> handleSignInEmail(String email, String password) async {

    AuthResult result;

    try {

      result = await auth.signInWithEmailAndPassword(email: email, password: password);

      final FirebaseUser user = result.user;

      assert(user != null);
      assert(await user.getIdToken() != null);

      final FirebaseUser currentUser = await auth.currentUser();
      assert(user.uid == currentUser.uid);

      print('signInEmail succeeded: $user');

      return user;

    } catch (e) {

      print('Ops, error!!!!!!!!!');
    }
  }

  Future<FirebaseUser> handleSignUp(email, password) async {

    try {
      AuthResult result = await auth.createUserWithEmailAndPassword(email: email, password: password);
      final FirebaseUser user = result.user;

      assert (user != null);
      assert (await user.getIdToken() != null);

      return user;

    } catch (e) {
      print('Ops, signup error...');
    }
  }
}
