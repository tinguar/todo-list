import 'package:flutter/material.dart';
import 'package:to_do_list/src/style/style.dart';

class FormTextC {
  static InputDecoration loginInputDecoration({
    required String hint,
    required String label,
    required IconData icon,
  }) {
    return InputDecoration(
      fillColor: Colors.white,
      hoverColor: Colors.white,
      helperStyle: TextS.title,
      errorStyle: TextS.titleER,
      suffixStyle: TextS.title,
      counterStyle: TextS.title,
      labelStyle: TextS.title,
      hintStyle: TextS.title,
      prefixStyle: TextS.title,
      hintText: hint,
      labelText: label,
      prefixIcon: Icon(icon, color: Colors.white),
      border:
          const OutlineInputBorder(borderSide: BorderSide(color: Colors.white)),
      enabledBorder:
          const OutlineInputBorder(borderSide: BorderSide(color: Colors.white)),
      disabledBorder:
          const OutlineInputBorder(borderSide: BorderSide(color: Colors.white)),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(25.0),
        borderSide: const BorderSide(color: Colors.white),
      ),
      enabled: true,
    );
  }
}
