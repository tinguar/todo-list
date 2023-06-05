import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../style/style.dart';

class ButtonIconOnpress extends StatelessWidget {
  final Color color;
  final FaIcon icon;
  final String text;
  final TextStyle textS;
  final Function()? onTap;

  const ButtonIconOnpress({
    Key? key,
    required this.color,
    required this.icon,
    required this.text,
     this.onTap,
    required this.textS,
  }) : super(key: key);

  @override
  Widget build(
    BuildContext context,
  ) {
    return Padding(
      padding: const EdgeInsets.only(
        left: 15.0,
        right: 15.0,
        top: 10.0,
      ),
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          height: 40.0,
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(5.0),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(
                width: 20.0,
              ),
              icon,
              Expanded(
                child: Text(
                  text,
                  textAlign: TextAlign.center,
                  style: textS,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
