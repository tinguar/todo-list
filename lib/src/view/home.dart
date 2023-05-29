import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:to_do_list/src/style/style.dart';

import '../provider/provider.dart';
import 'layout/home/todo.dart';

class Home extends StatelessWidget {
  final List<Widget> screens = const [
    Todo(
      title: 'pantalla uno',
    ),
    Todo(
      title: 'pantalla dos',
    ),
    Todo(
      title: 'pantalla tres',
    ),
    Todo(
      title: 'pantalla cuatro',
    ),
    Todo(
      title: 'pantalla cinco',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    final appStateManager = Provider.of<NavigatorBar>(context);

    return Scaffold(
      backgroundColor: ColorS.background,
      body: screens[appStateManager.selectedIndex],
      bottomNavigationBar: BottomAppBar(
        color: ColorS.backgroundB,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            IconButton(
              icon: Icon(Icons.home),
              onPressed: () => appStateManager.setTabIndex(0),
              color: appStateManager.selectedIndex == 0
                  ? ColorS.select
                  : ColorS.selectN,
            ),
            IconButton(
              icon: Icon(Icons.favorite),
              onPressed: () => appStateManager.setTabIndex(1),
              color: appStateManager.selectedIndex == 1
                  ? ColorS.select
                  : ColorS.selectN,
            ),
            IconButton(
              icon: FaIcon(
                FontAwesomeIcons.circlePlus,
              ),
              onPressed: () => appStateManager.setTabIndex(2),
              color: appStateManager.selectedIndex == 2
                  ? ColorS.select
                  : ColorS.selectN,
            ),
            IconButton(
              icon: Icon(Icons.shopping_cart),
              onPressed: () => appStateManager.setTabIndex(3),
              color: appStateManager.selectedIndex == 3
                  ? ColorS.select
                  : ColorS.selectN,
            ),
            IconButton(
              icon: Icon(Icons.person),
              onPressed: () => appStateManager.setTabIndex(4),
              color: appStateManager.selectedIndex == 4
                  ? ColorS.select
                  : ColorS.selectN,
            ),
          ],
        ),
      ),

      // bottomNavigationBar: BottomNavigationBar(
      //   type: BottomNavigationBarType.fixed,
      //   elevation: 0,
      //   backgroundColor: ColorS.backgroundB,
      //   selectedItemColor: ColorS.select,
      //   unselectedItemColor: ColorS.selectN,
      //   currentIndex: appStateManager.selectedIndex,
      //   onTap: (index) => appStateManager.setTabIndex(index),
      //   items: const [
      //     BottomNavigationBarItem(
      //       icon: Icon(Icons.home),
      //       label: '',
      //     ),
      //     BottomNavigationBarItem(
      //       icon: Icon(Icons.favorite),
      //       label: '',
      //     ),
      //     BottomNavigationBarItem(
      //       icon: FaIcon(
      //         FontAwesomeIcons.circlePlus,
      //       ),
      //       label: '',
      //     ),
      //     BottomNavigationBarItem(
      //       icon: Icon(Icons.shopping_cart),
      //       label: '',
      //     ),
      //     BottomNavigationBarItem(
      //       icon: Icon(Icons.person),
      //       label: '',
      //     ),
      //   ],
      // ),
    );
  }
}
