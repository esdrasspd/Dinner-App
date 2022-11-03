import 'package:contact/models/menu.dart';
import 'package:contact/providers/db_provider.dart';
import 'package:contact/widgets/widgets.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
   
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
  
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    DBProvider.db.database;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Carta del Restaurante'),
      ),
      body: const Center(
        
         child: ListMenu() 
         
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          Navigator.pushNamed(context, 'input_screen');
        }, 
        label: const Text('Nuevo'),
        icon: const Icon(Icons.add),
        ),
    );
  }
}

