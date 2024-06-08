import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:ifiranz_client/firebase_options.dart';
import 'package:ifiranz_client/src/features/core/domain/api_failure.dart';
import 'package:logger/logger.dart';

typedef FailureOrCredential = Either<ApiFailure, UserCredential>;

class FirebaseAuthenticatorRepository {
  final FirebaseAuth _auth;
  static final _log = Logger();

  FirebaseAuthenticatorRepository(
    this._auth,
  );

  Future<FailureOrCredential> signUpWithGoogle() async {
    try {
      final GoogleSignInAccount? googleUser = await GoogleSignIn(
              clientId: DefaultFirebaseOptions.currentPlatform.iosClientId)
          .signIn();

      // Obtain the auth details from the request
      final GoogleSignInAuthentication? googleAuth =
          await googleUser?.authentication;

      // Create a new credential
      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth?.accessToken,
        idToken: googleAuth?.idToken,
      );

      // Once signed in, return the UserCredential
      UserCredential userCredentials =
          await _auth.signInWithCredential(credential);

      _log.i(userCredentials);
      return right(userCredentials);
    } on PlatformException catch (e) {
      debugPrint(e.message!);
      return left(
        ApiFailure.failure(e.message!),
      );
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        return left(
          const ApiFailure.failure('The password provided is too weak.'),
        );
      } else if (e.code == 'email-already-in-use') {
        return left(
          const ApiFailure.failure(
              'The account already exists for that email.'),
        );
      } else if (e.code == 'network-request-failed') {
        return left(
          const ApiFailure.failure('You do not have internet connexion'),
        );
      } else {
        return left(
          ApiFailure.failure('Failed with error code: ${e.code}'),
        );
      }
    }
  }

  Future<Either<ApiFailure, Unit>> signOut() async {
    try {
      await _auth.signOut();
      return right(unit);
    } on PlatformException catch (e) {
      return left(ApiFailure.failure(e.message!));
    }
  }
}
