import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:to_do_list/src/style/style.dart';

import '../../../constant/constant.dart';
import '../../../firebase/auth.dart';
import '../../../widget/widget.dart';
import '../auth/auth.dart';

class Person extends StatelessWidget {
  final User? user;

  const Person({Key? key, required this.user}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final firebaseAuthUser = Provider.of<FirebaseAuthHelper>(context);
    final sizeW = Responsive.isResponsiveWidth(context, 1);
    final sizeH = Responsive.isResponsiveHeight(context, 1);

    return Column(
      children: [
        Container(
          height: sizeH * 0.3,
        ),
        ButtonIconOnpress(
          color: ColorS.button,
          icon: const FaIcon(
            FontAwesomeIcons.google,
            color: Colors.white,
          ),
          text: 'cerrar seccion',
          textS: TextS.title,
          onTap: () {
            firebaseAuthUser.signOut();
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => const SignIn()),
            );
            if (kDebugMode) {
              print('CERRAR SECCION RAPIDO');
            }
          },
        ),
      ],
    );
  }
}
