import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:to_do_list/src/view/layout/auth/auth.dart';

import '../../../constant/constant.dart';
import '../../../firebase/firebase.dart';
import '../../../style/style.dart';

class Todo extends StatelessWidget {
  final User? user;
  const Todo({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    final firebaseAuthUser = Provider.of<FirebaseAuthUser>(context);

    return Scaffold(
      backgroundColor: const Color(0xFF32315b),
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Row(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(30),
                    child: Image.network(
                      user?.photoURL ??
                          'https://images.unsplash.com/photo-1466921583968-f07aa80c526e?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1470&q=80',
                      width: 50,
                      height: 50,
                      fit: BoxFit.cover,
                    ),
                  ),

                  const SizedBox(width: 5.0),
                  Text(
                    getFormattedName(user?.displayName ?? "N/A"),
                    style: TextS.title,
                  ),
                ],
              ),
            ),
            Container(
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
            ),
          ],
        ),
      ),
    );
  }
}
