import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../firebase/firebase.dart';
import '../../../model/model.dart';
import '../../../style/style.dart';

class Init extends StatefulWidget {
  @override
  _InitState createState() => _InitState();
}

class _InitState extends State<Init> {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  List<Note> userNotes = [];

  @override
  Widget build(BuildContext context) {
    final yourProvider = Provider.of<FirebaseAuthUser>(context);

    return StreamBuilder<QuerySnapshot>(
      stream: _firestore
          .collection('notes')
          .where('userId', isEqualTo: yourProvider.user?.uid)
          .snapshots(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          final List<Note> notes = snapshot.data!.docs.map((doc) {
            return Note.fromMap(doc.data() as Map<String, dynamic>);
          }).toList();
          return ListView.builder(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: notes.length,
            itemBuilder: (context, index) {
              Note note = notes[index];
              return ListTile(
                title: Text(note.title, style: TextS.titleER),
                subtitle: Text(note.description),
              );
            },
          );
        } else if (snapshot.hasError) {
          return Text('Error al cargar las notas: ${snapshot.error}');
        } else {
          return const CircularProgressIndicator();
        }
      },
    );
  }
}
