import 'package:flutter/material.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../constant/constant.dart';
import '../../../firebase/firebase.dart';
import '../../../model/model.dart';
import '../../../style/style.dart';

class Global extends StatefulWidget {
  @override
  _GlobalState createState() => _GlobalState();
}

class _GlobalState extends State<Global> {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  List<Note> userNotes = [];

  @override
  Widget build(BuildContext context) {
    final yourProvider = Provider.of<FirebaseAuthUser>(context);

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
                  color: ColorS.buttonW,
                  text: note.title,
                  onTap: () {},
                  textS: TextS.titleG,
                  dataI: formattedDay,
                  dataM: formattedMonth,
                  formattedYear: formattedYear,
                  formattedTime: formattedTime);
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

class ButtonIconOnpressGlobal extends StatelessWidget {
  final Color color;
  final String text;
  final String dataI;
  final String dataM;
  final String formattedYear;
  final String formattedTime;
  final TextStyle textS;
  final Function() onTap;

  const ButtonIconOnpressGlobal({
    Key? key,
    required this.color,
    required this.text,
    required this.onTap,
    required this.textS,
    required this.dataI,
    required this.dataM,
    required this.formattedYear,
    required this.formattedTime,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final sizeW = Responsive.isResponsiveWidth(context, 1);
    final sizeH = Responsive.isResponsiveHeight(context, 1);

    return SizedBox(
      height: 75,
      child: Padding(
        padding: const EdgeInsets.only(
          left: 15.0,
          right: 15.0,
          top: 10.0,
        ),
        child: GestureDetector(
          onTap: onTap,
          child: Container(
            decoration: BoxDecoration(
              color: color,
              borderRadius: BorderRadius.circular(5.0),
            ),
            child: Padding(
              padding: const EdgeInsets.only(left: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        text,
                        textAlign: TextAlign.center,
                        style: textS,
                      ),
                      const SizedBox(height: 5.0),
                      Text(
                        '$dataM $dataI, $formattedYear $formattedTime',
                        style: TextStyle(
                          color: ColorS.textBW,
                          fontWeight: FontWeight.bold,
                          fontSize: 15.0,
                        ),
                      ),
                    ],
                  ),
                  Container(
                    height: sizeW,
                    width: sizeW * 0.3,
                    decoration: BoxDecoration(
                      color: ColorS.button,
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(10),
                        bottomLeft: Radius.circular(10),
                      ),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Leer todo'.toUpperCase(),
                          style: TextS.titleGL,
                        ),
                       const SizedBox(height: 5.0,),
                        FaIcon(
                          FontAwesomeIcons.eye,
                          color: ColorS.buttonW,
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
