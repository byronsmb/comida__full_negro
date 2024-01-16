import 'package:carousel_slider/carousel_slider.dart';

import 'package:comida__full_negro/models/Comida.dart';
import 'package:comida__full_negro/screens/detalle_comida.dart';
import 'package:flutter/material.dart';

class ComidaWidget extends StatefulWidget {
  ComidaWidget({
    super.key,
    required this.comidaFiltrada,
    required this.initialPage,
    required this.carouselController,
  });
  final List<Comida> comidaFiltrada;
  final int initialPage;
  final CarouselController carouselController;

  @override
  State<ComidaWidget> createState() => _ComidaWidgetState();
}

class _ComidaWidgetState extends State<ComidaWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      //height: 350,
      height: MediaQuery.of(context).size.height * 0.395,
      //color: Colors.amber,
      child: CarouselSlider.builder(
        carouselController: widget.carouselController,
        itemCount: widget.comidaFiltrada.length,
        itemBuilder: (context, index, realIndex) {
          return Padding(
            padding: const EdgeInsets.all(10.0),
            child: InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => DetalleComida(
                        comidaActual: widget.comidaFiltrada[index]),
                  ),
                );
              },
              child: Container(
                decoration: BoxDecoration(
                  gradient: const LinearGradient(
                    begin: Alignment.bottomLeft,
                    end: Alignment.topRight,
                    colors: [
                      Color.fromARGB(255, 33, 36, 45),
                      Color.fromARGB(255, 58, 60, 75),
                    ],
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.8),
                      spreadRadius: 4,
                      blurRadius: 12,
                      offset: const Offset(4, 4),
                    ),
                    BoxShadow(
                      color: Colors.white.withOpacity(0.3),
                      spreadRadius: 2,
                      blurRadius: 12,
                      offset: const Offset(-4, -4),
                    ),
                  ],
                  //color: Colors.amber,
                  borderRadius: BorderRadius.circular(35),
                ),
                //width: 250,
                //child: Image.asset('assets/images/platoN1.png'),
                child: Stack(
                  //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Positioned(
                      top: 5,
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 20),
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            '\$ ${widget.comidaFiltrada[index].precio}',
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style:
                                Theme.of(context).textTheme.bodyLarge!.copyWith(
                                      color: Colors.white,
                                    ),
                          ),
                        ),
                      ),
                    ),
                    Center(
                      child: Stack(
                        children: [
                          Container(
                            //width: 180,
                            height: 160,
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
                            child: Image.asset(
                              'assets/images/platoN1.png',
                              //fit: BoxFit.cover,
                            ),
                          ),
                          Positioned(
                            top: 15,
                            left: 15,
                            child: Hero(
                              tag: widget.comidaFiltrada[index].id,
                              child: Image.asset(
                                widget.comidaFiltrada[index].imagenUrl,
                                width: 130,
                                // MediaQuery.of(context).size.width * 0.34,

                                height: 140,
                                //MediaQuery.of(context).size.height *0.16,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Positioned(
                      bottom: 2,
                      //left: 5,
                      //width: 185,
                      width: MediaQuery.of(context).size.width * 0.45,
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 5),
                        child: Align(
                          alignment: Alignment.center,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                widget.comidaFiltrada[index].nombre,
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyMedium!
                                    .copyWith(
                                      color: Colors.white,
                                    ),
                              ),
                              Icon(
                                Icons.add,
                                size: 18,
                              ),
                            ],
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          );
        },
        options: CarouselOptions(
          height: MediaQuery.of(context).size.height * 0.34, //300.0,
          initialPage: widget.initialPage,

          enlargeCenterPage: true,
          //aspectRatio: 16 / 5,
          autoPlayCurve: Curves.fastOutSlowIn,
          enableInfiniteScroll: false,
          autoPlayAnimationDuration: Duration(milliseconds: 800),
          viewportFraction: 0.5,
          // onPageChanged: (index, reason) {
          //   setState(() {
          //     widget.initialPage = index;
          //     print('PAGINA ACTUAL  ${widget.initialPage}');
          //   });
          // },
        ),
      ),
    );
  }
}
