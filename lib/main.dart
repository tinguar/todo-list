// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:to_do_list/src/firebase/firebase.dart';
import 'package:to_do_list/src/provider/provider.dart';
import 'package:to_do_list/src/style/color.dart';
import 'package:to_do_list/src/view/layout/auth/auth.dart';
import 'package:provider/provider.dart';
import 'package:to_do_list/src/view/layout/home/home.dart';

import 'src/view/home.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  // await Firebase.initializeApp();
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
        ChangeNotifierProvider(
          create: (context) => NavigatorBar(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'TO DO',
        home: Home(),
        // theme: ThemeData(
        //   bottomNavigationBarTheme: BottomNavigationBarThemeData(
        //     elevation: 0,
        //     backgroundColor: ColorS.backgroundB, // Cambiar el color de fondo
        //     selectedItemColor: ColorS.select, // Cambiar el color de los íconos seleccionados
        //     unselectedItemColor: ColorS.selectN, // Cambiar el color de los íconos no seleccionados
        //   ),
        // ),
      ),
    );

    //   MultiProvider(
    //   providers: [
    //     Proveedor de FirebaseAuth
    //     Provider<FirebaseAuth>(
    //       create: (_) => FirebaseAuth.instance,
    //     ),
    //     Proveedor de FirebaseAuthUser
    //     Provider<FirebaseAuthUser>(
    //       create: (_) => FirebaseAuthUser.instance(),
    //     ),
    //   ],
    //   child: const MaterialApp(
    //     title: 'TO DO',
    //     home: SignIn(),
    //   ),
    // );
  }
}
