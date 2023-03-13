import 'package:flutter/material.dart';
import 'item.dart';
import 'profile.dart';
import 'shopping_cart.dart';

class Home extends StatefulWidget {
  static String tag = 'home-page';
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    
    final pages = [const Item(), const ShoppingCart(), const Profile()];

    void onItemTapped(int index) {
      setState(() {
        selectedIndex = index;
      });
    }

    final body = Container(child: pages[selectedIndex]);

    return Scaffold(
      appBar: AppBar(
        title: const Text('MIAGED'),
        automaticallyImplyLeading: false,
      ),
      body: body,
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Acheter',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart),
            label: 'Panier',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profil',
          ),
        ],
        currentIndex: selectedIndex,
        selectedItemColor: const Color.fromARGB(255, 0, 157, 255),
        onTap: onItemTapped,
      ),
    );
  }
}
