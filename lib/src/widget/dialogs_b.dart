import 'package:flutter/material.dart';
import 'package:to_do_list/src/style/style.dart';

class DialogsB {
  static void alert(
    BuildContext context, {
    required String title,
    required String description,
    required VoidCallback ok,
    required VoidCallback edit,
    required VoidCallback destroye,
  }) {
    showDialog(
      useSafeArea: false,
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: ColorS.background,
        contentPadding: EdgeInsets.zero,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(10.0)),
        ),
        content: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisSize: MainAxisSize.min,
          children: [
            ClipRRect(
              borderRadius: const BorderRadius.vertical(top: Radius.circular(10.0)),
              child: Align(
                alignment: Alignment.topCenter,
                heightFactor: 0.8,
                child: Container(
                  color: ColorS.background,
                  child: Center(
                    child: Text(
                      'acción'.toUpperCase(),
                      style: const TextStyle(
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
                ? PaddingTextB(
                    text: title,
                  )
                : const SizedBox(),
            const SizedBox(height: 16),
            description != null
                ? PaddingTextB(
                    text: description,
                  )
                : const SizedBox(),
            const SizedBox(height: 16),
            Center(
              child: Row(
                children: [
                  TextButton(
                    onPressed: ok,
                    child: Text("ver".toUpperCase(), style: TextS.title),
                  ),
                  TextButton(
                    onPressed: edit,
                    child: Text("editar".toUpperCase(), style: TextS.title),
                  ),
                  TextButton(
                    onPressed: destroye,
                    child: Text("eliminar".toUpperCase(), style: TextS.title),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class PaddingTextB extends StatelessWidget {
  final String text;
  const PaddingTextB({Key? key, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0),
      child: Text(text, style: TextS.title),
    );
  }
}

class ProgressDialogB {
  final BuildContext context;
  ProgressDialogB(this.context);

  void show() {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => Container(
        width: double.infinity,
        height: double.infinity,
        color: Colors.white.withOpacity(0.7),
        child: const Center(
          child: CircularProgressIndicator(),
        ),
      ),
    );
  }


}
