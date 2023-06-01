import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../model/model.dart';
import '../widget/widget.dart';

class FirebaseAuthUser {
  static final FirebaseAuthUser _instance = FirebaseAuthUser._();
  factory FirebaseAuthUser.instance() => _instance;

  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  final GoogleSignIn _googleSignIn = GoogleSignIn();

  User? get user => _firebaseAuth.currentUser;

  ProgressDialog? _progressDialog;

  Future<void> saveNoteWithUser(Note note) async {
    try {
      final CollectionReference usersCollection =
          FirebaseFirestore.instance.collection('users');

      final User? currentUser = _firebaseAuth.currentUser;

      if (currentUser != null) {
        final CollectionReference notesCollection =
            usersCollection.doc(currentUser.uid).collection('notes');

        await notesCollection.add(note.toMap());
      }
    } catch (e) {
      print('Error al guardar la nota del usuario en Firestore: $e');
    }
  }








  Future<List<Note>> getNotes() async {
    try {
      final CollectionReference usersCollection =
      FirebaseFirestore.instance.collection('users');

      final User? currentUser = _firebaseAuth.currentUser;

      if (currentUser != null) {
        final CollectionReference notesCollection =
        usersCollection.doc(currentUser.uid).collection('notes');

        final QuerySnapshot querySnapshot = await notesCollection.get();
        final List<Note> notes = querySnapshot.docs
            .map((doc) => Note.fromSnapshot(doc))
            .toList();

        return notes;
      } else {
        return []; // No hay usuario autenticado
      }
    } catch (e) {
      print('Error al obtener las notas del usuario: $e');
      return [];
    }
  }











  Future<void> saveUserDataToFirestore(
      User user, String name, String email) async {
    try {
      final CollectionReference usersCollection =
          FirebaseFirestore.instance.collection('users');

      final Users userData = Users(
        uid: user.uid,
        name: name,
        email: email,
        lastLogin: DateTime.now(),
      );
      await usersCollection.doc(user.uid).set(userData.toMap());
    } catch (e) {
      print('Error al guardar los datos del usuario en Firestore: $e');
    }
  }

  Future<void> updateLastLogin(String uid) async {
    try {
      final CollectionReference usersCollection =
          FirebaseFirestore.instance.collection('users');
      await usersCollection.doc(uid).update({
        'lastLogin': DateTime.now(),
      });
    } catch (e) {
      print('Error al actualizar el campo lastLogin en Firestore: $e');
    }
  }

  Future<User?> google(BuildContext context) async {
    _progressDialog = ProgressDialog(context);
    try {
      _progressDialog!.show();
      final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();
      if (googleUser == null) {
        _dismissProgressDialog();
        return null; // Usuario canceló el inicio de sesión
      }

      final GoogleSignInAuthentication authentication =
          await googleUser.authentication;

      final OAuthCredential credential = GoogleAuthProvider.credential(
        idToken: authentication.idToken,
        accessToken: authentication.accessToken,
      );

      final UserCredential userCredential =
          await _firebaseAuth.signInWithCredential(credential);

      final User? user = userCredential.user;

      if (kDebugMode) {
        print("username: ${user?.displayName}");
      }

      // Guardar los datos del usuario en Firestore
      if (user != null) {
        String name = user.displayName ?? '';
        String email = user.email ?? '';

        await saveUserDataToFirestore(user, name, email);
        await updateLastLogin(
            user.uid); // Actualizar el campo lastLogin en Firestore
        print('Datos del usuario guardados en Firestore');
      }

      _dismissProgressDialog();
      return user;
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
      _dismissProgressDialog();
      return null;
    }
  }

  Future<void> signOut() async {
    try {
      await _firebaseAuth.signOut(); // Cerrar sesión en Firebase Auth
      await _googleSignIn.signOut(); // Cerrar sesión en Google Sign-In
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
    }
  }

  void _dismissProgressDialog() {
    _progressDialog?.dismiss();
    _progressDialog = null;
  }

  FirebaseAuthUser._();
}
