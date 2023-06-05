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

class Init extends StatefulWidget {
  @override
  _InitState createState() => _InitState();
}

class _InitState extends State<Init> {
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
                  onTap: () {},
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
