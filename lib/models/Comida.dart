import 'package:uuid/uuid.dart';

var uuid = const Uuid();

enum TipoComida { desayuno, almuerzo, merienda }

class Comida {
  Comida({
    required this.nombre,
    required this.imagenUrl,
    required this.precio,
    required this.descripcion,
    required this.tipoComida,
  }) : id = uuid.v4();

  final String id;
  final String nombre;
  final String imagenUrl;
  final double precio;
  final String descripcion;
  final TipoComida tipoComida;
}
