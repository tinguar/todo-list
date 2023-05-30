import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../provider/provider.dart';
import '../style/style.dart';

class IconButtonNavigatorBar extends StatelessWidget {
  final NavigatorBar bar;
  final IconData icon;
  final int number;
  const IconButtonNavigatorBar({
    Key? key,
    required this.bar,
    required this.icon,
    required this.number,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: InkWell(
        onTap: () => bar.setTabIndex(number),
        splashColor: ColorS.backgroundB,
        highlightColor: ColorS.backgroundB,
        child: FaIcon(
          icon,
          color: bar.selectedIndex == number ? ColorS.select : ColorS.selectN,
        ),
      ),
    );
  }
}
