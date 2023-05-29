import 'package:flutter/material.dart';
import 'package:to_do_list/src/style/color.dart';
import 'package:to_do_list/src/style/style.dart';



class Pruebaa extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Ejemplo de Dialogs',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Ejemplo de Diálogos'),
        ),
        body: Center(
          child: ElevatedButton(
            onPressed: () {
              Dialogs.alert(
                context,
                title: 'Alerta',
                description: 'Este es un mensaje de alerta.',
              );
            },
            child: Text('Mostrar Alerta'),
          ),
        ),
      ),
    );
  }
}

class Dialogs {
  static void alert(BuildContext context,
      {required String title, required String description}) {
    showDialog(
   barrierColor: Colors.transparent,
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: ColorS.background,
        contentPadding: EdgeInsets.zero,
        content: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisSize: MainAxisSize.min,
          children: [
            ClipRect(
              child: Align(
                alignment: Alignment.topCenter,
                heightFactor: 0.5,
                child: Container(
                  color: Colors.white,
                  child: Center(
                    child: Text(
                      'TO DO',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 75.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: 16),
            title != null ? Text(title, style: TextS.title) : SizedBox(),
            SizedBox(height: 16),
            description != null ? Text(description, style: TextS.title) : SizedBox(),
            SizedBox(height: 16),
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
