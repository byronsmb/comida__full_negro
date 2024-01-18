import 'package:comida__full_negro/data/datos_ficticios.dart';
import 'package:comida__full_negro/models/Comida.dart';
import 'package:comida__full_negro/screens/detalle_comida.dart';
import 'package:flutter/material.dart';

class ComidaHoyListview extends StatelessWidget {
  const ComidaHoyListview({
    super.key,
    required this.screenHeight,
    required this.screenWidth,
    required this.comidaFiltrada,
  });
  final double screenHeight;
  final double screenWidth;
  final List<Comida> comidaFiltrada;

  @override
  Widget build(BuildContext context) {
    return Container(
      //padding: EdgeInsets.symmetric(horizontal: 10),
      //color: Colors.amber,
      height: screenHeight / 5.8,
      width: screenWidth / 1.1,
      child: ListView.builder(
        itemCount: comidasdelDia.length,
        //shrinkWrap: 2,
        itemBuilder: (context, index) {
          return InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => DetalleComida(
                    comidaActual: comidaFiltrada[index],
                  ),
                ),
              );
            },
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 5.0),
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 10),

                height: screenHeight / 15,

                decoration: BoxDecoration(
                  //color: Colors.red,
                  borderRadius: BorderRadius.circular(30),
                  gradient: const LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Color.fromARGB(255, 77, 81, 94),
                      Color.fromARGB(255, 33, 36, 45),
                      Color.fromARGB(255, 33, 36, 45),
                    ],
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.white.withOpacity(0.1),
                      spreadRadius: 1,
                      blurRadius: 1,
                      offset: const Offset(2, 2),
                    ),
                  ],
                ),
                //shadowColor: Colors.white.withOpacity(0.3),
                //elevation: 3,
                child: Stack(
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Image.asset(
                          'assets/images/platoN1.png',
                          height: screenHeight / 15.8,
                        ),
                        const SizedBox(width: 10),
                        Container(
                          //color: Colors.amber,
                          width: screenWidth * 0.46,
                          child: Text(
                            comidasdelDia[index].nombre,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: Theme.of(context)
                                .textTheme
                                .bodyMedium!
                                .copyWith(
                                  color: Colors.white,
                                ),
                          ),
                        ),
                        SizedBox(width: screenWidth * 0.01),
                        Text(
                          '\$ ${comidasdelDia[index].precio}',
                          style:
                              Theme.of(context).textTheme.bodySmall!.copyWith(
                                    color: Colors.white,
                                  ),
                        ),
                        SizedBox(width: screenWidth * 0.03),
                        Icon(Icons.add_circle_outline_rounded),
                      ],
                    ),
                    Positioned(
                      top: 6,
                      left: 6,
                      child: Hero(
                        tag: comidasdelDia[index].id,
                        child: Image.asset(
                          comidasdelDia[index].imagenUrl,
                          height: MediaQuery.of(context).size.height / 20.5,
                          width: MediaQuery.of(context).size.height / 20.5,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
