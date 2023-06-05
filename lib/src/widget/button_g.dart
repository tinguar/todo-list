import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../constant/constant.dart';
import '../style/color.dart';
import '../style/style.dart';

class ButtonIconOnpressGlobal extends StatelessWidget {
  final Color color;
  final IconData icon;
  final Color colorC;
  final Color colorI;
  final Color colorE;
  final String text;
  final bool? textE;
  final bool? textI;
  final String dataI;
  final String dataM;
  final String formattedYear;
  final String formattedTime;
  final TextStyle textS;
  final Function() onTap;

  const ButtonIconOnpressGlobal({
    Key? key,
    required this.color,
    required this.text,
    required this.onTap,
    required this.textS,
    required this.dataI,
    required this.dataM,
    required this.formattedYear,
    required this.formattedTime,
    required this.colorC,
    required this.colorI,
    required this.icon,
    this.textE,
    required this.colorE, this.textI,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final sizeW = Responsive.isResponsiveWidth(context, 1);

    return Stack(
      fit: StackFit.passthrough,
      children: [
        SizedBox(
          height: 75,
          child: Padding(
            padding: const EdgeInsets.only(
              left: 15.0,
              right: 15.0,
              top: 10.0,
            ),
            child: GestureDetector(
              onTap: onTap,
              child: Container(
                decoration: BoxDecoration(
                  color: color,
                  borderRadius: BorderRadius.circular(5.0),
                ),
                child: Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            limitText(text),
                            textAlign: TextAlign.center,
                            style: textS,
                          ),
                          const SizedBox(height: 15.0),
                          Text(
                            '$dataM $dataI, $formattedYear $formattedTime',
                            style: textS,
                          ),
                        ],
                      ),
                      Container(
                        height: sizeW,
                        width: sizeW * 0.2,
                        decoration: BoxDecoration(
                          color: colorC,
                          borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(10),
                            bottomLeft: Radius.circular(10),
                          ),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            FaIcon(
                              icon,
                              color: colorI,
                            ),
                            // const SizedBox(
                            //   height: 5.0,
                            // ),
                            // Text(
                            //   'Leer todo'.toUpperCase(),
                            //   style: TextS.titleGL,
                            // ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
        VisibilityG(
          colorE: colorE,
          textV: 'Global',
          right: 35,
          width: 50,
          textE: textE == true,
        ),
        VisibilityG(
          colorE: colorE,
          textV: 'Incognito',
          right: 100,
          width: 65,
          textE: textI == true,
        ),
      ],
    );
  }
}

class VisibilityG extends StatelessWidget {
  final Color colorE;
  final bool textE;
  final String textV;
  final double right;
  final double width;

  const VisibilityG({
    Key? key,
    required this.colorE,
    required this.textE,
    required this.textV,
    required this.right, required this.width,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: textE ,
      child: Positioned(
        top: 1,
        bottom: 55,
        right: right,
        child: Container(
          decoration: BoxDecoration(
            color: colorE,
            borderRadius: const BorderRadius.all(Radius.circular(5.0)),
            border: Border.all(
              color: colorE,
              width: 1.0,
            ),
          ),
          width: width,
          height: 50,
          child: Text(
            textV,
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}
