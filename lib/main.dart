import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:to_do_list/src/firebase/firebase.dart';
import 'package:to_do_list/src/view/layout/auth/auth.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  SystemChrome.setPreferredOrientations(
    [
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ],
  ).then(
        (_) {
      runApp(const MyApp());
    },
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        // Proveedor de FirebaseAuth
        Provider<FirebaseAuth>(
          create: (_) => FirebaseAuth.instance,
        ),
        // Proveedor de FirebaseAuthUser
        Provider<FirebaseAuthUser>(
          create: (_) => FirebaseAuthUser.instance(),
        ),
      ],
      child: const MaterialApp(
        title: 'TO DO',
        home: SignIn(),
      ),
    );
  }
}
