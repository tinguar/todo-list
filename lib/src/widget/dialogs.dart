import 'package:flutter/material.dart';
import 'package:to_do_list/src/style/style.dart';

class Dialogs {
  static void alert(BuildContext context,
      {required String title, required String description}) {
    showDialog(
      useSafeArea: false,
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: ColorS.background,
        contentPadding: EdgeInsets.zero,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(10.0)),
        ),
        content: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisSize: MainAxisSize.min,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.vertical(top: Radius.circular(10.0)),
              child: Align(
                alignment: Alignment.topCenter,
                heightFactor: 0.8,
                child: Container(
                  color: ColorS.background,
                  child: const Center(
                    child: Text(
                      'ERROR',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 75.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 16),
            title != null
                ? PaddingText(
              text: title,
            )
                : const SizedBox(),
            const SizedBox(height: 16),
            description != null
                ? PaddingText(
              text: description,
            )
                : const SizedBox(),
            const SizedBox(height: 16),
            Center(
              child: TextButton(
                child: Text("OK", style: TextS.title),
                onPressed: () => Navigator.pop(context),
              ),
            ),
          ],
        ),
      ),
    );
  }
}


class PaddingText extends StatelessWidget {
  final String text;
  const PaddingText({Key? key, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0),
      child: Text(text, style: TextS.title),
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
