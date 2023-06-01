import 'package:flutter/material.dart';
import 'package:to_do_list/src/model/model.dart';
import '../firebase/firebase.dart';

class NotesProvider extends ChangeNotifier {
  List<Note> userNotes = []; // Lista de notas

  Future<void> fetchNotes() async {
    try {
      final List<Note> notes = await FirebaseAuthUser.instance().getNotes();
      userNotes = notes;
      notifyListeners();
    } catch (e) {
      print('Error al obtener las notas del usuario: $e');
    }
  }

// Resto de métodos para añadir, editar o eliminar notas
}
