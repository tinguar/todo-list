import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:to_do_list/src/provider/provider.dart';
import 'package:to_do_list/src/view/layout/auth/auth.dart';

import '../../../constant/constant.dart';
import '../../../firebase/firebase.dart';
import '../../../style/style.dart';
import '../../../widget/widget.dart';

class Add extends StatelessWidget {
  final User? user;
  const Add({Key? key, required this.user}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final sizeW = Responsive.isResponsiveWidth(context, 1);
    final sizeH = Responsive.isResponsiveHeight(context, 1);
    final appStateManager = Provider.of<NavigatorBar>(context);
    return Column(
      children: [
        Text(getFormattedName(user?.displayName ?? "N/A"), style: TextS.title)
      ],
    );
  }
}
