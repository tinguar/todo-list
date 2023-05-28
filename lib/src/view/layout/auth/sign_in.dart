// import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:to_do_list/src/style/style.dart';
import 'package:to_do_list/src/view/layout/home/home.dart';

import '../../../constant/constant.dart';
import '../../../firebase/firebase.dart';
import '../../../widget/widget.dart';

class SignIn extends StatelessWidget {
  const SignIn({super.key});

  @override
  Widget build(BuildContext context) {
    final sizeW = Responsive.isResponsiveWidth(context, 1);
    final sizeH = Responsive.isResponsiveHeight(context, 1);

    // final firebaseAuthUser = Provider.of<FirebaseAuthUser>(context);

    return Scaffold(
      body: Responsive(
        mobile: Column(
          children: [
            Container(
              width: sizeW * 1,
              height: sizeH / 2,
              color: Colors.white,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'TO DO'.toUpperCase(),
                    style: const TextStyle(
                      color: Color(0xFF2d2f46),
                      fontSize: 100.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    'recuerda todo'.toUpperCase(),
                    style: const TextStyle(
                      letterSpacing: 3.0,
                      color: Color(
                        0xFFadb0b8,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              width: sizeW * 1,
              height: sizeH / 2,
              color: ColorS.background,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: GestureDetector(
                      onTap: () async {
                        // final User? user =
                        //     await firebaseAuthUser.google(context);
                        // if (user != null) {
                        //   Future.delayed(Duration.zero, () {
                        //     Navigator.of(context).push(
                        //       MaterialPageRoute(
                        //           builder: (_) => Todo(
                        //                 user: user,
                        //               )),
                        //     );
                        //   });
                        // } else {
                        //   // ignore: use_build_context_synchronously
                        //   Dialogs.alert(
                        //     context,
                        //     title: 'Error de inicio de sesión',
                        //     description:
                        //         'El inicio de sesión con Google ha fallado.',
                        //   );
                        // }
                        // if (kDebugMode) {
                        //   print('google');
                        // }
                      },
                      child: Container(
                        height: 40.0,
                        decoration: BoxDecoration(
                          color: ColorS.button,
                          borderRadius: BorderRadius.circular(5.0),
                        ),
                        child: const Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SizedBox(
                              width: 20.0,
                            ),
                            FaIcon(
                              FontAwesomeIcons.google,
                              color: Colors.white,
                            ),
                            Expanded(
                              child: Text(
                                'Inicia sesión con Google',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 15.0,
                  ),
                  const Text(
                    'Redes Sociales',
                    style: TextStyle(
                      color: Color.fromARGB(
                        255,
                        147,
                        148,
                        156,
                      ),
                    ),
                  ),
                  tootilIcons()
                ],
              ),
            ),
          ],
        ),
        desktop: const Center(
          child: Text(
            'SOLO PARA MOBILE y TABLET',
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}
