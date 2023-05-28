import 'package:flutter/material.dart';

class Dialogs {
  static void alert(BuildContext context,
      {required String title, required String description}) {
    showDialog(
      builder: (context) => AlertDialog(
        // ignore: unnecessary_null_comparison
        title: title != null ? Text(title) : null,
        // ignore: unnecessary_null_comparison
        content: description != null ? Text(description) : null,
        actions: <Widget>[
          TextButton(
            child: const Text("OK"),
            onPressed: () => Navigator.pop(context),
          ),
        ],
      ),
      context: context,
    );
  }
}

class ProgressDialog {
  final BuildContext context;
  ProgressDialog(this.context);

  void show() {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => Container(
        width: double.infinity,
        height: double.infinity,
        color: Colors.white.withOpacity(0.7),
        child: Center(
          child: CircularProgressIndicator(),
        ),
      ),
    );
  }

  void dismiss() {
    Navigator.pop(context);
  }
}
