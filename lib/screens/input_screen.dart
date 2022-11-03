import 'package:contact/providers/db_provider.dart';
import 'package:contact/widgets/alert.dart';
import 'package:contact/widgets/widgets.dart';
import 'package:contact/models/menu.dart';
import 'package:flutter/material.dart';

class InputScreen extends StatefulWidget {

  const InputScreen({Key? key}) : super(key: key);

  @override
  State<InputScreen> createState() => _InputScreenState();
}

class _InputScreenState extends State<InputScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final codeController = TextEditingController();

  final nameController = TextEditingController();

  final priceController = TextEditingController();

  final familyController = TextEditingController();

  String? selectedValue;

  @override
  Widget build(BuildContext context) {

    String codeTable;
    String nameTable;
    double priceTable;
    String familyTable;
    



    final List<String> familyList = [
      'Desayuno',
      'Almuerzo',
      'Cena',
      'Extras',
      'Bebida',
    ];

    return Scaffold(
      appBar: AppBar(

        title: const Text('Registrar nuevo plato'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                CustomField(nameController: codeController,   labelText: 'Código', hintText: 'Código del plato: AAA123',  icon: Icons.copy_rounded),
                const SizedBox(height: 30),
                CustomField(nameController: nameController, labelText: 'Nombre', hintText: 'Nombre del plato: Huevos revueltos', icon: Icons.food_bank),
                const SizedBox(height: 30),
                CustomField(nameController: priceController, labelText: 'Precio', hintText: 'Precio del plato en quetzales: 150.00', keyboardType: TextInputType.number, icon: Icons.price_change),
                const SizedBox(height: 30),

                DropdownButtonFormField<String>(
                  items: familyList.map((value) => DropdownMenuItem(
                    child: Text(value),
                    value: value)).toList(),
                  validator: (value) {
                    if(value == null)
                    {
                      return'Este campo es requerdido';
                    }
                  },
                  onChanged: (value) {
                    setState(() {
                  selectedValue = value!;
                  });        
              },
              value: selectedValue,
              
              
      decoration: const InputDecoration(
        icon: Icon(Icons.dining_rounded)
      ),
    ),
    const SizedBox(height: 30),

                ElevatedButton(
                    style: ButtonStyle(padding: MaterialStateProperty.all(const EdgeInsets.all(12))),
                    child: const SizedBox(
                      
                      width: 100,
                      child: Center(child: Text('Guardar'))
                      ),
                    onPressed: () {

                      if(_formKey.currentState!.validate()){
                       codeTable = codeController.text;
                       nameTable = nameController.text;
                       priceTable = double.parse(priceController.text);
                       familyTable = selectedValue!;
        
                         Alert.alert.displayDialogIOS(context, '¿Desea guardar los datos?', 'Está a punto de guardar los datos de un platillo...', 
                         DBProvider.db.insert(Menu(codigo: codeTable, nombre: nameTable, precio: priceTable, familia: familyTable)),
                         );
                      }
                    },
                ),
              ],
            ),
          ),
        ),
      )
      );
  }
}