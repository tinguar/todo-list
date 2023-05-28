import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:to_do_list/src/view/layout/auth/auth.dart';

import '../../../firebase/firebase.dart';

class Todo extends StatelessWidget {
  const Todo({super.key});

  @override
  Widget build(BuildContext context) {
    final firebaseAuthUser = Provider.of<FirebaseAuthUser>(context);

    return Container(
      color: Colors.amber,
      child: Column(
        children: [
          const Text(
            'BIENVENIDO',
            style: TextStyle(
              color: Colors.black,
              fontSize: 40.0,
            ),
          ),
          ElevatedButton(
            onPressed: () {
              firebaseAuthUser.signOut();
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => const SignIn()),
              );
            },
            child: const Text('Cerrar sesión'),
          )
        ],
      ),
    );
  }
}
