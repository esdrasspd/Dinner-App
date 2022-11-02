import 'dart:convert';
import 'dart:ffi';

class Menu {
  int? id;
  String codigo;
  String nombre;
  double precio;
  String? familia;

  Menu({
    this.id,
    required this.codigo,
    required this.nombre,
    required this.precio,
    this.familia
  });

  factory Menu.fromJson(Map<String, dynamic> json) => Menu( //si se reciben un mapa lo tomará y creará una instancia de carta
    id: json["id"],
    codigo: json["codigo"], 
    nombre: json["nombre"], 
    precio: json["precio"], 
    familia: json["familia"]
    );

    Map<String, dynamic> toJson() => { //retorna un mapa, toma la instancia y lo pasa por mapa
      
      "id": id,
      "codigo": codigo,
      "nombre": nombre,
      "precio": precio,
      "familia": familia,
    };
  }


