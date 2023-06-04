import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:to_do_list/src/style/style.dart';

import '../../../firebase/auth.dart';
import '../auth/auth.dart';

class Person extends StatelessWidget {
  const Person({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final firebaseAuthUser = Provider.of<FirebaseAuthUser>(context);

    return Column(
      children: [
        Center(
          child: IconButton(
              onPressed: () {
                firebaseAuthUser.signOut();
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => const SignIn()),
                );
                if (kDebugMode) {
                  print('CERRAR SECCION RAPIDO');
                }
              },
              icon: const Icon(
                Icons.sign_language,
                color: Colors.white,
              )),
        )
      ],
    );
  }
}
