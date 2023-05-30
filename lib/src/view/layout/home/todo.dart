import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:to_do_list/src/provider/provider.dart';
import 'package:to_do_list/src/view/layout/auth/auth.dart';
import 'package:to_do_list/src/view/layout/home/add.dart';

import '../../../constant/constant.dart';
import '../../../firebase/firebase.dart';
import '../../../style/style.dart';
import '../../../widget/widget.dart';

class Todo extends StatelessWidget {
  final User? user;

  const Todo({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    final sizeW = Responsive.isResponsiveWidth(context, 1);
    final sizeH = Responsive.isResponsiveHeight(context, 1);
    final appStateManager = Provider.of<NavigatorBar>(context);

    return Scaffold(
      backgroundColor: ColorS.background,
      body: SafeArea(
        child: Column(
          children: [
            Container(
              color: ColorS.button,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(
                      top: 10.0,
                    ),
                    child: Center(
                      child: Container(
                        height: 50.0,
                        width: sizeW * 0.6,
                        decoration: BoxDecoration(
                          color: ColorS.background,
                          borderRadius: const BorderRadius.only(
                            topRight: Radius.circular(10.0),
                          ),
                          border: Border.all(
                            color: ColorS.background,
                          ), // Borde general
                        ),
                        child: Row(
                          children: [
                            const SizedBox(
                              width: 10.0,
                            ),
                            if (appStateManager.selectedIndex == 0)
                              Text('Inicio', style: TextS.title),
                            if (appStateManager.selectedIndex == 1)
                              Text('Notas', style: TextS.title),
                            if (appStateManager.selectedIndex == 2)
                              Text('Agregar', style: TextS.title),
                            if (appStateManager.selectedIndex == 3)
                              Text(getFormattedName(user?.displayName ?? "N/A"),
                                  style: TextS.title),
                            const SizedBox(
                              width: 5.0,
                            ),
                            Container(
                              width: 10.0,
                              height: 10.0,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: ColorS.circle,
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 10.0, right: 10.0),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(30),
                      child: Image.network(
                        user?.photoURL ??
                            'https://images.unsplash.com/photo-1466921583968-f07aa80c526e?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1470&q=80',
                        width: 45,
                        height: 45,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ],
              ),
            ),

            if (appStateManager.selectedIndex == 0)
              SizedBox(
                  width: sizeW * 1,
                  height: sizeH * 0.78,
                  child: Text('Inicio', style: TextS.title)),
            if (appStateManager.selectedIndex == 1)
              SizedBox(
                  width: sizeW * 1,
                  height: sizeH * 0.78,
                  child: Text('Notas', style: TextS.title)),
            if (appStateManager.selectedIndex == 2)
              SizedBox(
                  width: sizeW * 1,
                  height: sizeH * 0.78,
                  child: Add(
                    user: user,
                  )),
            if (appStateManager.selectedIndex == 3)
              SizedBox(

                width: sizeW ,
                height: sizeH * 0.78 ,
                child: Text('dadsdsd'),
              ),

            // ButtonIconOnpress(
            //   color: ColorS.buttonW,
            //   icon: FaIcon(
            //     FontAwesomeIcons.notesMedical,
            //     color: ColorS.button,
            //   ),
            //   text: 'Mirar todas las notas',
            //   textS: TextS.titleW,
            //   onTap: () {
            //     print('TODAS LAS NOTAS');
            //   },
            // ),
          ],
        ),
      ),
    );
  }
}

// Padding(
//   padding: const EdgeInsets.only(
//     top: 10.0,
//   ),
//   child: GestureDetector(
//     onTap: () {
//       firebaseAuthUser.signOut();
//       Navigator.pushReplacement(
//         context,
//         MaterialPageRoute(builder: (context) => const SignIn()),
//       );
//       if (kDebugMode) {
//         print('CERRAR SECCION RAPIDO');
//       }
//     },
//     child: Container(
//       width: sizeW * 0.4,
//       color: ColorS.button,
//       child: const Row(
//         mainAxisAlignment: MainAxisAlignment.end,
//         children: [
//           Icon(
//             Icons.power_settings_new_outlined,
//             color: Colors.white,
//             size: 30.0,
//           ),
//           SizedBox(
//             width: 10.0,
//           )
//         ],
//       ),
//     ),
//   ),
// )
