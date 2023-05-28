// // import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/foundation.dart';
// import 'package:flutter/material.dart';
// import 'package:google_sign_in/google_sign_in.dart';
//
// import '../widget/widget.dart';
//
// class FirebaseAuthUser {
//   static final FirebaseAuthUser _instance = FirebaseAuthUser._();
//   factory FirebaseAuthUser.instance() => _instance;
//
//   // final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
//   final GoogleSignIn _googleSignIn = GoogleSignIn();
//
//   User? get user => _firebaseAuth.currentUser;
//
//   ProgressDialog? _progressDialog;
//
//   Future<User?> google(BuildContext context) async {
//     _progressDialog = ProgressDialog(context);
//     try {
//       _progressDialog!.show();
//       final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();
//       if (googleUser == null) {
//         _dismissProgressDialog();
//         return null; // Usuario canceló el inicio de sesión
//       }
//
//       final GoogleSignInAuthentication authentication =
//           await googleUser.authentication;
//
//       final OAuthCredential credential = GoogleAuthProvider.credential(
//         idToken: authentication.idToken,
//         accessToken: authentication.accessToken,
//       );
//
//       final UserCredential userCredential =
//           await _firebaseAuth.signInWithCredential(credential);
//
//       final User? user = userCredential.user;
//
//       if (kDebugMode) {
//         print("username: ${user?.displayName} ");
//       }
//       _dismissProgressDialog();
//       return user;
//     } catch (e) {
//       if (kDebugMode) {
//         print(e);
//       }
//       _dismissProgressDialog();
//       return null;
//     }
//   }
//
//   Future<void> signOut() async {
//     try {
//       await _googleSignIn.signOut();
//       if (_firebaseAuth.currentUser != null) {
//         await _firebaseAuth.signOut();
//       }
//     } catch (e) {
//       if (kDebugMode) {
//         print(e);
//       }
//     }
//   }
//
//   void _dismissProgressDialog() {
//     _progressDialog?.dismiss();
//     _progressDialog = null;
//   }
//
//   FirebaseAuthUser._();
// }
