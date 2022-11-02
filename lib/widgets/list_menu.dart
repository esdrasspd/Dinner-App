import 'package:contact/providers/db_provider.dart';
import 'package:flutter/material.dart';

import '../models/models.dart';

class ListMenu extends StatefulWidget {
  const ListMenu({
    Key? key,
  }) : super(key: key);

  @override
  State<ListMenu> createState() => _ListMenuState();
}

class _ListMenuState extends State<ListMenu> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Menu>> (
     future: DBProvider.db.getMenu(),
     builder: (BuildContext context, AsyncSnapshot<List<Menu>> snapshot){
       if(!snapshot.hasData){
         return const Center(child: Text('Cargando datos...'),);
       }
       return snapshot.data!.isEmpty
           ? const Center(child: Text('No hay ningún alimento en la lista...'))
       
       :ListView(
         children:
           snapshot.data!.map((menu) {
             return Column(
                 children: [
                   const SizedBox(height: 30),
                   ListTile(
                     title: Text('Nombre del platillo: '+menu.nombre),
                     subtitle: Text('Código: '+ menu.codigo +'\nPrecio: ${ menu.precio }'+'\nFamilia: '+ menu.familia!),
                     onLongPress: () {
                       setState(() {
                         
                         DBProvider.db.delete(menu.id!);
                       });
                     },
                     onTap: (() {
                      Navigator.pushNamed(context, 'input_screen', arguments: menu);
                     }),
                   ),
                 ],
             );
           }).toList(),
           
       );
     }
     );
  }
}