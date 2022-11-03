

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:contact/screens/home_screen.dart';


class Alert {

  static final Alert alert = Alert._();
  Alert._();

  void displayDialogIOS( BuildContext context, String title, String content, Future db){
    showCupertinoDialog(
      barrierDismissible: false,
      context: context, 
      builder: (context) {
        return CupertinoAlertDialog(
          title: Text(title),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(content),
            ],
          ),
          actions: [
            TextButton(
              onPressed: ()
              {
                Navigator.pop(context);
              },
            child: const Text('Cancelar', style: TextStyle(color: Colors.red)),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pushAndRemoveUntil(
                MaterialPageRoute(builder: (context) => const HomeScreen()), 
                (route) => false);
                db;
              },
            child: const Text('Ok'),
            ),
          ],
          
        );
       }
      );
  }
}