import 'package:contact/providers/db_provider.dart';
import 'package:flutter/material.dart';
import 'alert.dart';
import '../models/models.dart';

class ListMenu extends StatelessWidget {
  const ListMenu({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Menu>> (
     future: DBProvider.db.getMenu(),
     builder: (BuildContext context, AsyncSnapshot<List<Menu>> snapshot){
       if(!snapshot.hasData){
         return const Center(child: Text('Cargando datos...'),);
       }
       return snapshot.data!.isEmpty
           ? const Center(child: Text('No hay ningún platillo en la lista...'))
       
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
                       Alert.alert.displayDialogIOS(context, '¿Desea borrar el platillo?', 'Está a punto de borrar el platillo seleccionado', DBProvider.db.delete(menu.id!));
                     }
                   ),
                 ],
             );
           }).toList(),
           
       );
     }
     );
  }
}