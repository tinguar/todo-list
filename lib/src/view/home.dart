import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
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
      Global(),
      Init(),
      Add(user: user),
      Person(),
    ];

    return SafeArea(
      child: WillPopScope(
        onWillPop: () async {
          return false;
        },
        child: Scaffold(
          backgroundColor: ColorS.background,
          body: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Text(
                          getFormattedName(user?.displayName ?? "N/A"),
                          style: TextS.title,
                        ),
                        const SizedBox(
                          width: 5.0,
                        ),
                        Container(
                          width: 10,
                          height: 10,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: ColorS.circle,
                          ),
                        )
                      ],
                    ),
                    CircleAvatar(
                      backgroundImage: NetworkImage(user?.photoURL ?? ''),
                      radius: 25,
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
          bottomNavigationBar: Theme(
            data: Theme.of(context).copyWith(
              canvasColor: ColorS.backgroundB,
            ),
            child: BottomNavigationBar(
              fixedColor: ColorS.select,
              unselectedItemColor: ColorS.selectN,
              currentIndex:
                  Provider.of<NavigationProvider>(context).currentIndex,
              onTap: (int index) {
                Provider.of<NavigationProvider>(context, listen: false)
                    .changePage(index);
              },
              items: const <BottomNavigationBarItem>[
                BottomNavigationBarItem(
                  icon: FaIcon(FontAwesomeIcons.globe),
                  label: 'Global',
                ),
                BottomNavigationBarItem(
                  icon: FaIcon(FontAwesomeIcons.house),
                  label: 'Inicio',
                ),
                BottomNavigationBarItem(
                  icon: FaIcon(FontAwesomeIcons.circlePlus),
                  label: 'Agregar',
                ),
                BottomNavigationBarItem(
                  icon: FaIcon(FontAwesomeIcons.userPen),
                  label: 'Usuario',
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
