import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../firebase/firebase.dart';
import '../../../model/model.dart';

class Init extends StatefulWidget {
  @override
  _InitState createState() => _InitState();
}

class _InitState extends State<Init> {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  List<Note> userNotes = []; // Estado local para almacenar las notas

  @override
  void initState() {
    super.initState();
    final yourProvider = Provider.of<FirebaseAuthUser>(context, listen: false);
    getNotes(yourProvider);
  }

  Future<void> getNotes(FirebaseAuthUser provider) async {
    try {
      final List<Note> notes = await provider.getNotes();
      setState(() {
        userNotes = notes; // Actualiza el estado local con las notas obtenidas
      });
    } catch (e) {
      print('Error al obtener las notas del usuario: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Utiliza el estado local para mostrar las notas en la interfaz de usuario
        ListView.builder(
          physics: NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemCount: userNotes.length,
          itemBuilder: (context, index) {
            Note note = userNotes[index];
            return ListTile(
              title: Text(note.title),
              subtitle: Text(note.description),
            );
          },
        ),
      ],
    );
  }
}
