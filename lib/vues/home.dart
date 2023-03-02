import 'package:flutter/material.dart';
import 'item.dart';
import 'profile.dart';

class Home extends StatefulWidget {
  static String tag = 'home-page';
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    int selectedIndex = 0;
    final pages = [const Item(), const Item(), const Profile()];

    void onItemTapped(int index) {
      setState(() {
        selectedIndex = index;
        print(selectedIndex);
        print(pages[selectedIndex]);
      });
    }

    final body = Container(child: pages[selectedIndex]);

    return Scaffold(
      appBar: AppBar(
        title: const Text('MIAGED'),
      ),
      body: body,
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Accueil',
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
        selectedItemColor: Colors.amber[800],
        onTap: onItemTapped,
      ),
    );
  }
}
