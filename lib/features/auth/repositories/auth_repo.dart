import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthRepo {
  final FirebaseAuth auth = FirebaseAuth.instance;

  // Function to register a new user with email and password
  Future<void> registration(
      {required String email, required String password}) async {
    try {
      await auth.createUserWithEmailAndPassword(
          email: email, password: password);
    } on FirebaseAuthException catch (e) {
      throw Exception(_determineError(e));
    }
  }

  // Function to log in an existing user with email and password
  Future<void> logIn({required String email, required String password}) async {
    try {
      await auth.signInWithEmailAndPassword(email: email, password: password);
    } on FirebaseAuthException catch (e) {
      throw Exception(_determineError(e));
    }
  }

  // Function to sign in with Google using OAuth 2.0 authentication
  Future<UserCredential> signInWithGoogle() async {
    try {
      // Begin interactive sign in process
      final GoogleSignInAccount? gUser = await GoogleSignIn().signIn();

      // Obtain auth details from request
      final GoogleSignInAuthentication gAuth = await gUser!.authentication;

      // Create a new credential for user
      final credential = GoogleAuthProvider.credential(
          accessToken: gAuth.accessToken, idToken: gAuth.idToken);

      // Finally, let's sign in
      return await FirebaseAuth.instance.signInWithCredential(credential);
    } on FirebaseAuthException catch (e) {
      throw Exception(_determineError(e));
    }
  }

  // Function to sign in with Facebook using OAuth 2.0 authentication
  Future<void> signInWithFacebook() async {
    try {
      final LoginResult loginResult = await FacebookAuth.instance.login();
      final OAuthCredential facebookAuthCredential =
          FacebookAuthProvider.credential(loginResult.accessToken?.token ?? '');
      await auth.signInWithCredential(facebookAuthCredential);
    } on FirebaseAuthException catch (e) {
      throw Exception(_determineError(e));
    }
  }

  // Function to log out the current user
  Future<void> logOut() async {
    try {
      await auth.signOut();
    } on FirebaseAuthException catch (e) {
      throw Exception(_determineError(e));
    }
  }
}

Object _determineError(FirebaseAuthException e) {
  switch (e.code) {
    case 'invalid-email':
      return 'The email address is badly formatted.';
    case 'user-disabled':
      return 'The user account has been disabled by an administrator.';
    case 'user-not-found':
      return 'There is no user record corresponding to this identifier.';
    case 'wrong-password':
      return 'The password is invalid.';
    case 'email-already-in-use':
      return 'The email address is already in use by another account.';
    case 'account-exists-with-different-credential':
      return '''An account already exists with the same email address but different sign-in credentials. Sign in using a provider associated with this email address''';
    case 'invalid-credential':
      return '''An account already exists with the same email address but different sign-in credentials.''';
    case 'operation-not-allowed':
      return '''The given sign-in provider is disabled for this Firebase project. Enable it in the Firebase console, under the sign-in method tab of the Auth section.''';
    case 'weak-password':
      return 'The password provided is too weak.';
    case 'ERROR_MISSING_GOOGLE_AUTH_TOKEN':
      return 'Missing Google Auth Token';
    case 'sign_in_canceled':
      return 'The sign-in process has been canceled.';
    case 'network-request-failed':
      return '''A network error (such as timeout, interrupted connection or unreachable host) has occurred.''';
    default:
      return 'An unknown error';
  }
}
