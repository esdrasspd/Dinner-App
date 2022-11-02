import 'package:flutter/material.dart';

class AppTheme{

  static Color primary = Colors.cyan.shade600;
  static final ThemeData lightTheme = ThemeData.light().copyWith(
    primaryColor: primary,

    appBarTheme: const AppBarTheme(
      iconTheme: IconThemeData(color: Colors.black),
      color: Colors.transparent, 
      titleTextStyle: TextStyle(color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold),
      elevation: 0,
    ),

    textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
          textStyle: const TextStyle(color: Colors.black)
          ),
        ),

        //floating ActionButton
        floatingActionButtonTheme: FloatingActionButtonThemeData(
          backgroundColor: primary,
          elevation: 5,
          
        ),

        //ElevatedButton
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            primary: primary,
            shape: const StadiumBorder(),
            elevation: 0,
          ),
        ),

      //Formularios
        inputDecorationTheme: InputDecorationTheme(
          floatingLabelStyle:  TextStyle(color: primary),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide( color: primary ),
            borderRadius: const BorderRadius.only( bottomLeft:  Radius.circular(10), topRight: Radius.circular(10)),
          ),

          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide( color: primary ),
            borderRadius: const BorderRadius.only( bottomLeft:  Radius.circular(10), topRight: Radius.circular(10)),
          ),
          
          border: const OutlineInputBorder(
            borderRadius: BorderRadius.only( bottomLeft:  Radius.circular(10), topRight: Radius.circular(10)),
          ),

  )
  );
}