import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/date_symbol_data_local.dart';

import 'package:intl/intl.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:provider/provider.dart';

import '../../../firebase/firebase.dart';
import '../../../model/model.dart';
import '../../../style/style.dart';
import '../../../widget/widget.dart';
import '../note/note.dart';

class Init extends StatefulWidget {
  final User? user;

  const Init({Key? key, this.user}) : super(key: key);

  @override
  _InitState createState() => _InitState();
}

class _InitState extends State<Init> {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  List<Note> userNotes = [];

  @override
  Widget build(BuildContext context) {
    final yourProvider = Provider.of<FirebaseAuthHelper>(context);

    return StreamBuilder<QuerySnapshot>(
      stream: _firestore
          .collection('notes')
          .where('userId', isEqualTo: yourProvider.user?.uid)
          .snapshots(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          final List<QueryDocumentSnapshot> documents = snapshot.data!.docs;
          final List<Note> notes = documents.map((doc) {
            final noteData = doc.data() as Map<String, dynamic>;
            return Note.fromMap(noteData);
          }).toList();
          return ListView.builder(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: notes.length,
            itemBuilder: (context, index) {
              Note note = notes[index];
              String noteId =
                  documents[index].id; // Obtener el ID del documento

              initializeDateFormatting('es');
              final n = note.createdAt.toString();

              DateTime parsedDate = DateFormat('yyyy-MM-dd').parse(n);
              DateTime parsedDate2 = DateTime.parse(n);
              String formattedTime = DateFormat.jm().format(parsedDate2);

              String formattedDay = DateFormat.d().format(parsedDate);
              String formattedMonth =
                  DateFormat('MMMM', 'es').format(parsedDate);
              String formattedYear = DateFormat.y().format(parsedDate);

              return Padding(
                padding: const EdgeInsets.only(top: 5.0, bottom: 5.0),
                child: ButtonIconOnpressGlobal(
                  color: ColorS.buttonW,
                  text: note.title,
                  onTap: () {
                    DialogsB.alert(
                      context,
                      title: 'Menú de opciones.',
                      description: '¿Cuál vas a elegir?',
                      ok: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => ViewNote(note: note, user: widget.user),
                          ),
                        ).then((value) {
                          Navigator.pop(context); // Cerrar el Dialog al volver
                        });
                      },
                      edit: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => Crud(note: note, noteId: noteId),
                          ),
                        ).then((value) {
                          Navigator.pop(context); // Cerrar el Dialog al volver
                        });
                      },
                      destroye: () async {
                        FirebaseFirestoreHelper firestoreHelper =
                            FirebaseFirestoreHelper.instance();
                        firestoreHelper.deleteNote(noteId);
                        if (kDebugMode) {
                          print(noteId);
                        }
                        Navigator.pop(context); // Cerrar el Dialog
                      },
                    );
                  },
                  textS: TextS.titleGLW,
                  dataI: formattedDay,
                  dataM: formattedMonth,
                  formattedYear: formattedYear,
                  formattedTime: formattedTime,
                  colorC: ColorS.buttonW,
                  colorI: ColorS.button,
                  icon: FontAwesomeIcons.penToSquare,
                  textE: note.isPublic,
                  textI: note.isIncognito,
                  colorE: ColorS.circle,
                ),
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
