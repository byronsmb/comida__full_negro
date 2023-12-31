import 'package:flutter/material.dart';

class MyBottomNavigationBar extends StatefulWidget {
  MyBottomNavigationBar({
    super.key,
    required this.currentIndexBottom,
  });

  int currentIndexBottom;
  @override
  State<MyBottomNavigationBar> createState() => _MyBottomNavigationBarState();
}

class _MyBottomNavigationBarState extends State<MyBottomNavigationBar> {
  @override
  Widget build(BuildContext context) {
    return Container(
      //height: 58,
      //height: screenHeight * 0.068,
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(16.0),
          topRight: Radius.circular(16.0),
        ),
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Color.fromARGB(255, 70, 72, 90),
            Color.fromARGB(255, 58, 60, 75),
            Color.fromARGB(255, 33, 36, 45),
          ],
        ),
      ),
      child: ClipRRect(
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(16.0),
          topRight: Radius.circular(16.0),
        ),
        child: BottomNavigationBar(
          backgroundColor: Colors.transparent, //fromARGB(255, 58, 60, 75),
          currentIndex: widget.currentIndexBottom,
          onTap: (index) {
            setState(() {
              widget.currentIndexBottom = index;
            });
          },
          selectedItemColor: Color.fromARGB(255, 223, 191, 94),
          unselectedItemColor: Colors.white,
          //type: BottomNavigationBarType.fixed,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(
                Icons.home,
                //size: screenHeight * 0.029,
              ),
              label: "Home",
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.shopping_cart_outlined,
                //size: screenHeight * 0.029,
              ),
              label: "Carrito",
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.settings,
                //size: screenHeight * 0.029,
              ),
              label: "Settings",
            ),
          ],
        ),
      ),
    );
  }
}
