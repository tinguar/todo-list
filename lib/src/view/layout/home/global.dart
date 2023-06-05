import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/date_symbol_data_local.dart';

import 'package:intl/intl.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '../../../model/model.dart';
import '../../../style/style.dart';
import '../../../widget/widget.dart';

class Global extends StatefulWidget {
  @override
  _GlobalState createState() => _GlobalState();
}

class _GlobalState extends State<Global> {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  List<Note> userNotes = [];

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: _firestore
          .collection('notes')
          .where('isPublic', isEqualTo: true)
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

              return ButtonIconOnpressGlobal(
                color: ColorS.button,
                text: note.title,
                onTap: () {},
                textS: TextS.titleG,
                dataI: formattedDay,
                dataM: formattedMonth,
                formattedYear: formattedYear,
                formattedTime: formattedTime,
                colorC: ColorS.button,
                colorI: ColorS.buttonW,
                icon: FontAwesomeIcons.eye,
                colorE: ColorS.textEs,
                textE: note.isPublic,
                textI: note.isIncognito,
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
