import 'package:comida__full_negro/data/datos_ficticios.dart';
import 'package:comida__full_negro/models/Comida.dart';
import 'package:comida__full_negro/widgets/comida_hoy_listview.dart';
import 'package:comida__full_negro/widgets/comida_widget.dart';
import 'package:comida__full_negro/widgets/my_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int currentIndex = 1;
  int initialPage = 1;
  final int _currentIndexBottom = 0;
  final CarouselController _carouselController = CarouselController();
  List<Comida> comidasFiltradas = comidaDisponible
      .where((comida) => comida.tipoComida == TipoComida.desayuno)
      .toList();

  selectCategoria(TipoComida tipocomidaBoton) {
    setState(() {
      initialPage = 1;
      _carouselController.animateToPage(1);

      comidasFiltradas = comidaDisponible
          .where((comida) => comida.tipoComida == tipocomidaBoton)
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      //backgroundColor: Colors.grey,

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
          child: SingleChildScrollView(
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Image.asset(
                      'assets/icons/menu.png',
                      height: 25,
                      color: Colors.white,
                    ),
                    Text(
                      'Bienvenido',
                      style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                            //fontSize: 30,
                            fontSize: screenHeight * 0.035,
                            color: Theme.of(context)
                                .colorScheme
                                .onSecondaryContainer,
                          ),
                    ),
                    const Icon(Icons.notifications_none),
                  ],
                ),
                Text(
                  'Selecciona tu comida !',
                  style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                        color: Theme.of(context)
                            .colorScheme
                            .onPrimaryContainer
                            .withOpacity(0.5),
                      ),
                ),
                SizedBox(height: MediaQuery.of(context).size.height * 0.03),

                Container(
                  width: screenWidth * 0.88,
                  height: screenHeight * 0.07,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    gradient: const LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        Color.fromARGB(255, 33, 36, 45),
                        Color.fromARGB(255, 33, 36, 45),
                        Color.fromARGB(255, 77, 81, 94),
                      ],
                    ),
                  ),
                  child: const TextField(
                    style: TextStyle(color: Colors.white70),
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.search),
                      labelText: "Buscar",
                      //hintStyle: TextStyle(),
                      //filled: true,
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                        borderSide: BorderSide(
                          color: Colors.transparent,
                          width: 3,
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                        borderSide: BorderSide(
                          color: Colors.white30,
                          width: 3,
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: MediaQuery.of(context).size.height * 0.035),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    myButton(
                      titulo: 'Desayuno',
                      context: context,
                      index: 1,
                      tipoComida: TipoComida.desayuno,
                      isSelected: currentIndex == 1,
                    ),
                    myButton(
                      titulo: 'Almuerzo',
                      context: context,
                      index: 2,
                      tipoComida: TipoComida.almuerzo,
                      isSelected: currentIndex == 2,
                    ),
                    myButton(
                      titulo: 'Merienda',
                      context: context,
                      index: 3,
                      tipoComida: TipoComida.merienda,
                      isSelected: currentIndex == 3,
                    ),
                  ],
                ),
                SizedBox(height: MediaQuery.of(context).size.height * 0.005),
                ComidaWidget(
                  comidaFiltrada: comidasFiltradas,
                  initialPage: initialPage,
                  carouselController: _carouselController,
                ),
                //SizedBox(height: MediaQuery.of(context).size.height * 0.035),
                Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Especial de hoy',
                      style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                          color:
                              Theme.of(context).colorScheme.onPrimaryContainer),
                    ),
                  ),
                ),
                SizedBox(height: MediaQuery.of(context).size.height * 0.005),
                ComidaHoyListview(
                  screenHeight: screenHeight,
                  screenWidth: screenWidth,
                  comidaFiltrada: comidasdelDia,
                ),
              ],
            ),
          ),
        ),
      ),

      bottomNavigationBar: MyBottomNavigationBar(
        currentIndexBottom: _currentIndexBottom,
      ),
    );
  }

  Widget myButton(
      {required String titulo,
      required BuildContext context,
      required int index,
      required TipoComida tipoComida,
      required bool isSelected}) {
    return InkWell(
      onTap: () {
        setState(() {
          currentIndex = index;
        });
        selectCategoria(tipoComida);
      },
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(40),
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              isSelected
                  ? const Color.fromARGB(255, 223, 191, 94)
                  : const Color.fromARGB(255, 33, 36, 45),
              isSelected
                  ? const Color.fromARGB(255, 223, 191, 94)
                  : const Color.fromARGB(255, 58, 60, 75),
            ],
          ),
          //shape: BoxShape.circle,
          boxShadow: [
            BoxShadow(
              color: Colors.white.withOpacity(0.3),
              spreadRadius: 1,
              blurRadius: 1,
              offset: const Offset(2, 2),
            ),
          ],
        ),
        height: MediaQuery.of(context).size.height * 0.045,
        width: MediaQuery.of(context).size.width * 0.24,
        child: Center(
            child: Text(
          titulo,
          style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                color: isSelected
                    ? Colors.black
                    : Theme.of(context).colorScheme.secondary,
                fontWeight: FontWeight.bold,
              ),
        )),
      ),
    );
  }
}
