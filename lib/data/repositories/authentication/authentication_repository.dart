import 'package:e_commerce_app/features/authentication/screens/login/login.dart';
import 'package:e_commerce_app/features/authentication/screens/onboarding/onboarding.dart';
import 'package:e_commerce_app/features/authentication/screens/signup/verify_email.dart';
import 'package:e_commerce_app/navigation_menu.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthenticationRepository extends GetxController {
  static AuthenticationRepository get instance => Get.find();

  /// Variables
  final deviceStorage = GetStorage();
  final _auth = FirebaseAuth.instance;

  /// Called from main.dart on app launch
  @override
  void onReady() {
    // Remove the native splash screen
    FlutterNativeSplash.remove();
    // Redirect to the appropriate screen
    screenRedirect();
  }

  /// Function to Show Relevant Screen
  screenRedirect() async {
    final user = _auth.currentUser;
    if(user != null){
      if(user.emailVerified){
        Get.offAll(() => const NavigationMenu());
      } else{
        Get.offAll(() => VerifyEmailScreen(email: _auth.currentUser?.email));
      }
    } else{
      // Local Storage
      deviceStorage.writeIfNull('IsFirstTime', true);
      // Check if it's the first time launching the app
      deviceStorage.read('IsFirstTime') != true
          ? Get.offAll(() => const LoginScreen()) // Redirect to Login Screen if not the first time
          : Get.offAll(const OnBoardingScreen()); // Redirect to OnBoarding Screen if it's the first time
    }
  }

/* ----------------------------- Email & Password sign-in -----------------------------*/

  /// [EmailAuthentication] - LOGIN
  Future<UserCredential> loginWithEmailAndPassword(String email, String password) async {
    try {
      return await _auth.signInWithEmailAndPassword(email: email, password: password);
    } on FirebaseAuthException catch (e) {
      throw e.toString();
    } on FirebaseException catch (e) {
      throw e.toString();
    } on FormatException catch (e) {
      throw e.toString();
    } on PlatformException catch (e) {
      throw e.toString();
    } catch (e) {
      throw 'Something went wrong. Please try again';
    }
  }

  /// [EmailAuthentication] - REGISTER
  Future<UserCredential> registerWithEmailAndPassword(String email, String password) async {
    try {
      return await _auth.createUserWithEmailAndPassword(email: email, password: password);
    } on FirebaseAuthException catch (e) {
      throw e.toString();
    } on FirebaseException catch (e) {
      throw e.toString();
    } on FormatException catch (e) {
      throw e.toString();
    } on PlatformException catch (e) {
      throw e.toString();
    } catch (e) {
      throw 'Something went wrong. Please try again';
    }
  }

  /// [EmailVerification] - MAIL VERIFICATION
  Future<void> sendEmailVerification() async {
    try {
      await _auth.currentUser?.sendEmailVerification();
    } on FirebaseAuthException catch (e) {
      throw e.toString();
    } on FirebaseException catch (e) {
      throw e.toString();
    } on FormatException catch (e) {
      throw e.toString();
    } on PlatformException catch (e) {
      throw e.toString();
    } catch (e) {
      throw 'Something went wrong. Please try again';
    }
  }

/* ----------------------------- Federated identity & social sign-in -----------------------------*/
  /// [GoogleAuthentication] - MAIL VERIFICATION
  Future<UserCredential?> signInWithGoogle() async {
    try {
      // Trigger the authentication flow
      final GoogleSignInAccount? userAccount = await GoogleSignIn().signIn();

      // Obtain the auth details from the request
      final GoogleSignInAuthentication? googleAuth = await userAccount?.authentication;

      // Create a new credential
      final credentials = GoogleAuthProvider.credential(accessToken: googleAuth?.accessToken, idToken: googleAuth?.idToken);

      // Once signed in, return the UserCredential
      return await _auth.signInWithCredential(credentials);

    } on FirebaseAuthException catch (e) {
      throw e.toString();
    } on FirebaseException catch (e) {
      throw e.toString();
    } on FormatException catch (e) {
      throw e.toString();
    } on PlatformException catch (e) {
      throw e.toString();
    } catch (e) {
      if (kDebugMode) print('Something went wrong: $e');
      return null;
    }
  }

/* ----------------------------- ./end Federated identity & social sign-in -----------------------------*/

  /// [LogoutUser] - Valid for any authentication
  Future<void> logout() async {
    try {
      await GoogleSignIn().signOut();
      await FirebaseAuth.instance.signOut();
      Get.offAll(() => const LoginScreen());
    } on FirebaseAuthException catch (e) {
      throw e.toString();
    } on FirebaseException catch (e) {
      throw e.toString();
    } on FormatException catch (e) {
      throw e.toString();
    } on PlatformException catch (e) {
      throw e.toString();
    } catch (e) {
      throw 'Something went wrong. Please try again';
    }
  }

}
