import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:to_do_list/src/style/style.dart';
import 'package:to_do_list/src/view/layout/home/home.dart';
import 'package:intl/intl.dart';

import '../../../constant/constant.dart';
import '../../../model/model.dart';

class ViewNote extends StatefulWidget {
  final Note note;
  const ViewNote({Key? key, required this.note}) : super(key: key);

  @override
  State<ViewNote> createState() => _ViewNoteState();
}

class _ViewNoteState extends State<ViewNote> {
  @override
  Widget build(BuildContext context) {
    final sizeW = Responsive.isResponsiveWidth(context, 1);
    final sizeH = Responsive.isResponsiveHeight(context, 1);

    final n = widget.note.createdAt.toString();

    DateTime parsedDate = DateFormat('yyyy-MM-dd').parse(n);
    DateTime parsedDate2 = DateTime.parse(n);
    String formattedTime = DateFormat.jm().format(parsedDate2);

    String formattedDay = DateFormat.d().format(parsedDate);
    String formattedMonth = DateFormat('MMMM', 'es').format(parsedDate);
    String formattedYear = DateFormat.y().format(parsedDate);

    return Scaffold(
      backgroundColor: ColorS.background,
      appBar: AppBar(
        toolbarHeight: 60,
        backgroundColor: ColorS.background,
        title: widget.note.isIncognito
            ? Text('incognito'.toUpperCase())
            : Row(
                children: [
                  Text(
                    getFormattedName(widget.note.nameN),
                    style: TextS.title,
                  ),
                  const SizedBox(
                    width: 5.0,
                  ),
                  Container(
                    width: 10,
                    height: 10,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: ColorS.circle,
                    ),
                  )
                ],
              ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 20),
            child: CircleAvatar(
              backgroundImage: NetworkImage(widget.note.photoN),
              radius: 25,
            ),
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.only(
          top: 10.0,
        ),
        child: Container(
          width: sizeW,
          height: sizeH,
          decoration: BoxDecoration(
            color: ColorS.button,
            borderRadius: BorderRadius.circular(5.0),
          ),
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Titulo:', style: TextS.titleWV),
                  const SizedBox(height: 10.0),
                  Text(
                    widget.note.title,
                    style: TextS.titleG,
                    textAlign: TextAlign.start,
                  ),
                  const SizedBox(height: 10.0),
                  Text('Mensaje:', style: TextS.titleWV),
                  Text(
                    widget.note.description,
                    style: TextS.titleG,
                    textAlign: TextAlign.start,
                  ),
                  const SizedBox(height: 10.0),
                ],
              ),
            ),
          ),
        ),
      ),
      bottomNavigationBar: Container(
        height: sizeH * 0.06,
        color: ColorS.background,
        child: Padding(
          padding: const EdgeInsets.only(
            left: 15.0,
            right: 15.0,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                '$formattedMonth $formattedDay, $formattedYear $formattedTime',
                style: TextS.titleG,
              ),
              const FaIcon(
                FontAwesomeIcons.heart,
                color: Colors.white,
              ),
              const FaIcon(
                FontAwesomeIcons.comment,
                color: Colors.white,
              )
            ],
          ),
        ),
      ),
    );
  }
}
