import 'package:comida__full_negro/models/Comida.dart';
import 'package:flutter/material.dart';

class DetalleComida extends StatefulWidget {
  const DetalleComida({super.key, required this.comidaActual});
  final Comida comidaActual;
  @override
  State<DetalleComida> createState() => _DetalleComidaState();
}

class _DetalleComidaState extends State<DetalleComida> {
  int cantidadPlatos = 1;
  double precio = 0;
  @override
  void initState() {
    super.initState();
    precio = widget.comidaActual.precio;
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.bottomLeft,
            end: Alignment.topRight,
            colors: [
              Color.fromARGB(255, 33, 36, 45),
              Color.fromARGB(255, 58, 60, 75),
            ],
          ),
        ),
        child: SafeArea(
          child: Column(
            children: [
              SizedBox(height: 10),
              InkWell(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Row(
                  children: [
                    const SizedBox(width: 10),
                    Icon(Icons.arrow_circle_left_outlined),
                    SizedBox(width: 10),
                    Text(
                      'Regresar',
                      style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                            color: Colors.white,
                          ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: screenHeight * 0.05),
              Stack(
                children: [
                  Container(
                    width: 300,
                    //height: MediaQuery.of(context).size.height * 0.8,
                    //MediaQuery.of(context).size.width * 0.46,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.3),
                          spreadRadius: 5,
                          blurRadius: 5,
                          offset: const Offset(3, 3),
                        ),
                      ],
                    ),
                    child: Transform.scale(
                      scale: 1.35,
                      child: Image.asset(
                        'assets/images/platoN1.png',
                        //height: MediaQuery.of(context).size.height * 0.8,
                        //fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Positioned(
                    top: 25,
                    left: 25,
                    child: Hero(
                      tag: widget.comidaActual.id,
                      child: Image.asset(
                        widget.comidaActual.imagenUrl,
                        height: 250,
                        width: 250,
                        // MediaQuery.of(context).size.width * 0.34,

                        //height: 140,
                        //MediaQuery.of(context).size.height *0.16,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: screenHeight * 0.04),
              Text(
                widget.comidaActual.nombre,
                style: Theme.of(context).textTheme.displaySmall!.copyWith(
                      color: const Color.fromARGB(255, 223, 191, 94),
                      fontWeight: FontWeight.bold,
                    ),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
              SizedBox(height: screenHeight * 0.008),
              Text(
                'Descripción',
                style: Theme.of(context).textTheme.headlineLarge!.copyWith(
                      color: Colors.white,
                    ),
              ),
              SizedBox(height: screenHeight * 0.02),
              Container(
                //color: Colors.red,
                width: screenWidth * 0.8,
                height: MediaQuery.of(context).size.height * 0.16,
                child: Text(
                  textAlign: TextAlign.center,
                  widget.comidaActual.descripcion,
                  style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                        color: Theme.of(context).colorScheme.onPrimaryContainer,
                      ),
                  maxLines: 6,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              //SizedBox(height: screenHeight * 0.1),
              Expanded(
                child: Row(
                  //mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,

                  children: [
                    Container(
                      child: Row(
                        children: [
                          IconButton(
                            onPressed: () {
                              setState(() {
                                if (cantidadPlatos > 0) {
                                  cantidadPlatos--;
                                  precio = widget.comidaActual.precio *
                                      cantidadPlatos;
                                }
                              });
                            },
                            style: ButtonStyle(
                              backgroundColor: MaterialStatePropertyAll(
                                Color.fromARGB(255, 223, 191, 94),
                              ),
                            ),
                            icon: Icon(
                              Icons.remove,
                              color: Colors.black,
                            ),
                          ),
                          SizedBox(width: 10),
                          Text(
                            '$cantidadPlatos',
                            style: Theme.of(context)
                                .textTheme
                                .bodyMedium!
                                .copyWith(
                                  color: Colors.white,
                                  fontSize: 20,
                                ),
                          ),
                          SizedBox(width: 10),
                          IconButton(
                            onPressed: () {
                              setState(() {
                                cantidadPlatos++;
                                precio =
                                    widget.comidaActual.precio * cantidadPlatos;
                              });
                            },
                            style: IconButton.styleFrom(
                              backgroundColor:
                                  const Color.fromARGB(255, 223, 191, 94),
                            ),
                            icon: Icon(
                              Icons.add,
                              color: Colors.black,
                            ),
                          ),
                        ],
                      ),
                    ),

                    //Expanded(child: Text('')),
                    ElevatedButton(
                      onPressed: () {
                        if (precio == 0) {
                          null;
                        } else {
                          ScaffoldMessenger.of(context).clearSnackBars();
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text(
                                'Ordenado',
                                style: TextStyle(
                                  color: Colors.white,
                                ),
                              ),
                              backgroundColor: Colors.amber.withOpacity(0.3),
                            ),
                          );
                        }
                      },
                      style: IconButton.styleFrom(
                        backgroundColor: precio == 0
                            ? Color.fromARGB(41, 223, 191, 94)
                            : const Color.fromARGB(255, 223, 191, 94),
                      ),
                      child: Text(
                        'ORDENAR POR \$$precio',
                        style: TextStyle(
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
