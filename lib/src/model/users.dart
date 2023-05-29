
import 'package:cloud_firestore/cloud_firestore.dart';

class Users {
  final String uid;
  final String name;
  final String email;
  final DateTime lastLogin;

  Users({
    required this.uid,
    required this.name,
    required this.email,
    required this.lastLogin,
  });

  factory Users.fromSnapshot(DocumentSnapshot snapshot) {
    Map<String, dynamic> data = snapshot.data() as Map<String, dynamic>;
    return Users(
      uid: snapshot.id,
      name: data['name'] ?? '',
      email: data['email'] ?? '',
      lastLogin: data['lastLogin'].toDate() ?? DateTime(0),
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'uid': uid,
      'name': name,
      'email': email,
      'lastLogin': lastLogin,
    };
  }
}