import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:to_do_list/src/style/style.dart';
import 'package:to_do_list/src/view/layout/home/home.dart';

import '../constant/constant.dart';
import '../provider/provider.dart';

class Home extends StatelessWidget {
  final User? user;

  const Home({Key? key, required this.user}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final sizeW = Responsive.isResponsiveWidth(context, 1);

    final List<Widget> pages = [
      Init(),
      Init(),
      Add(user: user),
      Init(),
    ];

    return SafeArea(
      child: Scaffold(
        backgroundColor: ColorS.background,
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Welcome, ${user?.displayName}',
                    style: const TextStyle(fontSize: 24),
                  ),
                  const SizedBox(height: 16),
                  CircleAvatar(
                    backgroundImage: NetworkImage(user?.photoURL ?? ''),
                    radius: 40,
                  ),
                ],
              ),
            ),
            Expanded(
              child: SingleChildScrollView(
                child: SizedBox(

                  child: IndexedStack(
                    index:
                        Provider.of<NavigationProvider>(context).currentIndex,
                    children: pages,
                  ),
                ),
              ),
            ),
          ],
        ),
        bottomNavigationBar: BottomNavigationBar(
          fixedColor: Colors.blue,
          backgroundColor: Colors.blue,
          currentIndex: Provider.of<NavigationProvider>(context).currentIndex,
          onTap: (int index) {
            Provider.of<NavigationProvider>(context, listen: false)
                .changePage(index);
          },
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Global',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.explore),
              label: 'Inicio',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.notifications),
              label: 'Agregar',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: 'Usuario',
            ),
          ],
        ),
      ),
    );
  }
}
