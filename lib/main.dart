import 'package:contact/screens/home_screen.dart';
import 'package:contact/screens/input_screen.dart';
import 'package:flutter/material.dart';
import 'package:contact/themes/app_theme.dart';

void main() 
{
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Contactos',
      initialRoute: 'home_screen',
      routes: {
        'home_screen': ( _ ) => const HomeScreen(),
        'input_screen':(context) => const InputScreen(),
      },
      theme: AppTheme.lightTheme,
    );
  }
}