import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:to_do_list/src/firebase/firebase.dart';
import 'package:to_do_list/src/style/style.dart';
import 'package:to_do_list/src/view/layout/home/home.dart';

import '../provider/provider.dart';
import '../widget/widget.dart';
import 'layout/home/todo.dart';

class Home extends StatelessWidget {
  final User? user;

  const Home({super.key, required this.user});
  @override
  Widget build(BuildContext context) {
    final appStateManager = Provider.of<NavigatorBar>(context);

    final List<Widget> screens = [
      Todo(user: user),
      Like(),
      Add(),
      Alert(),
      Person()
    ];
    return Scaffold(
      backgroundColor: ColorS.background,
      body: screens[appStateManager.selectedIndex],
      bottomNavigationBar: BottomAppBar(
        color: ColorS.backgroundB,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            IconButtonNavigatorBar(
              icon: FontAwesomeIcons.house,
              bar: appStateManager,
              number: 0,
            ),
            IconButtonNavigatorBar(
              icon: FontAwesomeIcons.heartCircleCheck,
              bar: appStateManager,
              number: 1,
            ),
            IconButtonNavigatorBar(
              icon: FontAwesomeIcons.circlePlus,
              bar: appStateManager,
              number: 2,
            ),
            IconButtonNavigatorBar(
              icon: FontAwesomeIcons.solidBell,
              bar: appStateManager,
              number: 3,
            ),
            IconButtonNavigatorBar(
              icon: FontAwesomeIcons.userPen,
              bar: appStateManager,
              number: 4,
            ),
          ],
        ),
      ),
    );
  }
}
