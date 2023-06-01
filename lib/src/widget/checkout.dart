import 'package:flutter/material.dart';

class Checkout extends StatelessWidget {
  final bool value;
  final double size;
  final ValueChanged<bool?>? onChanged;
  final TextStyle style;
  final String text;

  Checkout({
    Key? key,
    required this.value,
    required this.size,
    required this.onChanged,
    required this.style,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: size,
      child: Container(
        height: 40.0,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(5.0),
        ),
        child: Row(
          children: [
            Checkbox(
              value: value,
              activeColor: const Color(0xFF1c1f30),
              checkColor: const Color(0xFF1c1f30),
              focusColor: const Color(0xFF1c1f30),
              hoverColor: const Color(0xFF1c1f30),
              onChanged: onChanged,
            ),
            Text(text.toUpperCase(), style: style),
          ],
        ),
      ),
    );
  }
}
