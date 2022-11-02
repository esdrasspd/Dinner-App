

import 'dart:developer';

import 'package:flutter/material.dart';

class ListForm extends StatefulWidget {
  

  const ListForm({super.key});

  @override
  State<ListForm> createState() => _ListFormState();
  
}

class _ListFormState extends State<ListForm> {

  
  
  String _selectedValue = 'Desayuno';

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<String>(
      
      items: const [
        DropdownMenuItem(value: 'Desayuno', child: Text('Desayuno')),
        DropdownMenuItem(value: 'Almuerzo', child: Text('Almuerzo')),
        DropdownMenuItem(value: 'Cena', child: Text('Cena')),
        DropdownMenuItem(value: 'Extras', child: Text('Extras')),
        DropdownMenuItem(value: 'Bebida', child: Text('Bebida')),
      ],
      onChanged: (value) {
        setState(() {
          _selectedValue = value!;
          print(_selectedValue);
        });
        
      },
      decoration: const InputDecoration(
        icon: Icon(Icons.dining_rounded)
      ),
    );
  }
}