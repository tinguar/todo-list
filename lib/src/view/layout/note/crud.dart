import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:to_do_list/src/model/model.dart';

import '../../../constant/constant.dart';
import '../../../firebase/firebase.dart';
import '../../../style/style.dart';
import '../../../widget/widget.dart';

class Crud extends StatefulWidget {
  final String noteId;
  final Note note;

  Crud({
    Key? key,
    required this.note,
    required this.noteId,
  }) : super(key: key);

  @override
  State<Crud> createState() => _CrudState();
}

class _CrudState extends State<Crud> {
  final _formKey = GlobalKey<FormState>();
  bool _isPublic = false;
  bool _isLoading = false;
  bool _isIncognito = false;
  TextEditingController _titleController = TextEditingController();
  TextEditingController _descriptionController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _titleController.text = widget.note.title;
    _descriptionController.text = widget.note.description;
    _isPublic = widget.note.isPublic;
    _isIncognito = widget.note.isIncognito;
  }

  @override
  Widget build(BuildContext context) {
    final sizeW = Responsive.isResponsiveWidth(context, 1);

    String buttonTitle = '';

    if (!_isPublic && !_isIncognito) {
      buttonTitle = 'Nota personal'.toUpperCase();
    } else if (_isPublic && !_isIncognito) {
      buttonTitle = 'Nota global'.toUpperCase();
    } else if (_isPublic && _isIncognito) {
      buttonTitle = 'Nota global privada'.toUpperCase();
    }
    return Scaffold(
      backgroundColor: ColorS.background,
      appBar: AppBar(
        backgroundColor: ColorS.background,
        title: Text('Editar Nota'),
      ),
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: TextFormField(
                  style: TextS.title,
                  controller: _titleController,
                  maxLines: 2,
                  decoration: FormTextC.loginInputDecoration(
                    hint: 'Titulo',
                    label: 'Titulo',
                    icon: Icons.title,
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Por favor, ingresa el título';
                    }
                    return null;
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                  left: 15,
                  right: 15,
                  top: 5,
                  bottom: 10,
                ),
                child: TextFormField(
                  style: TextS.title,
                  controller: _descriptionController,
                  maxLines: 13,
                  decoration: FormTextC.loginInputDecoration(
                    hint: 'Descripción',
                    label: 'Descripción',
                    icon: Icons.description,
                  ),
                ),
              ),
              const SizedBox(height: 20.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IgnorePointer(
                    ignoring: _isPublic == true ? false : true,
                    child: Checkout(
                      value: _isIncognito,
                      size: sizeW * 0.49,
                      onChanged: (bool? value) {
                        setState(() {
                          _isIncognito = value ?? false;
                        });
                      },
                      style: TextS.titleW,
                      text: 'incognito',
                    ),
                  ),
                  const SizedBox(width: 10.0),
                  IgnorePointer(
                    ignoring: _isIncognito == true ? true : false,
                    child: Checkout(
                      value: _isPublic,
                      size: sizeW * 0.4,
                      onChanged: (bool? value) {
                        setState(() {
                          _isPublic = value ?? false;
                        });
                      },
                      style: TextS.titleW,
                      text: 'Global',
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 10.0,
              ),
              SizedBox(
                width: sizeW,
                child: ButtonIconOnpress(
                  color: ColorS.button,
                  icon: const FaIcon(
                    FontAwesomeIcons.noteSticky,
                    color: Colors.white,
                  ),
                  text: buttonTitle,
                  textS: TextS.title,
                  onTap: null,
                ),
              ),
              const SizedBox(height: 20.0),

              _isLoading
                  ? SizedBox(
                      width: sizeW - 10.0,
                      child: const Padding(
                        padding: EdgeInsets.only(right: 30.0),
                        child: CircularProgressIndicator(
                          color: Colors.white,
                        ),
                      ),
                    )
                  : ButtonIconOnpress(
                      color: ColorS.buttonW,
                      icon: const FaIcon(
                        FontAwesomeIcons.arrowsRotate,
                        color: Colors.black,
                      ),
                      text: 'actualizar nota'.toUpperCase(),
                      textS: TextS.titleW,
                      onTap: () async {
                        if (_formKey.currentState!.validate()) {
                          setState(() {
                            _isLoading = true;
                          });

                          DateTime now = DateTime.now();

                          Note updatedNote = Note(
                            title: _titleController.text,
                            description: _descriptionController.text,
                            isPublic: _isPublic,
                            isIncognito: _isIncognito,
                            createdAt: widget.note.createdAt,
                            updatedAt: now,
                            userId: widget.note.userId,
                            nameN: widget.note.nameN,
                            photoN: widget.note.photoN,
                          );

                          await FirebaseFirestoreHelper.instance()
                              .updateNote(widget.noteId, {
                            'title': updatedNote.title,
                            'description': updatedNote.description,
                            'isPublic': updatedNote.isPublic,
                            'isIncognito': updatedNote.isIncognito,
                            'updatedAt': updatedNote.updatedAt,
                          });

                          setState(() {
                            _isLoading = false;
                            _titleController.clear();
                            _descriptionController.clear();
                            _isPublic = false;
                            _isIncognito = false;
                          });

                          Future.delayed(
                              Duration.zero, () => Navigator.pop(context));
                        }
                      },
                    ),
              const SizedBox(height: 10.0),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _titleController.dispose();
    _descriptionController.dispose();
    super.dispose();
  }
}
