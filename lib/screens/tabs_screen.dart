import 'package:flutter/material.dart';
import 'package:meals/components/main_drawer.dart';
import 'package:meals/models/meals.dart';
import 'categories_screen.dart';
import 'favorite_screen.dart';

class TabsScreen extends StatefulWidget {
  final List<Meal> favoritesMeal;
  const TabsScreen(this.favoritesMeal);

  @override
  _TabsScreenState createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  int _selectedScreenIndex = 0;

  late List<Widget> _screens;

  @override
  void initState() {
    super.initState();
    _screens = [
      CategoriesScreen(),
      FavoriteScreen(widget.favoritesMeal),
    ];
  }

  final List<String> _title = [
    'All Categories',
    'My Favorites',
  ];

  _selectScreen(int index) {
    setState(() {
      _selectedScreenIndex = index;
      print(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          _title[_selectedScreenIndex],
        ),
      ),
      drawer: MainDrawer(),
      body: _screens[_selectedScreenIndex],
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Theme.of(context).accentColor,
        currentIndex: _selectedScreenIndex,
        unselectedItemColor: Colors.white,
        type: BottomNavigationBarType.shifting,
        onTap:
            _selectScreen, // ??? PORQUE NÃO TENHO QUE PASSAR O INT COMO PEDE NA FUNÇÃO ???
        items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.category),
              label: 'Categories',
              backgroundColor: Theme.of(context).primaryColor),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: 'Favorites',
            backgroundColor: Theme.of(context).primaryColor,
          ),
        ],
      ),
    );
    // METODO DE IMPLEMENTAÇÃO DE BARRA DE NAVEGAÇÃO NO APPBAR
    // DefaultTabController(
    //   length: 2,
    //   child: Scaffold(
    //     appBar: AppBar(
    //       centerTitle: true,
    //       title: Text("! Go Cook !",style: TextStyle(fontWeight: FontWeight.bold),),
    //       bottom: TabBar(

    //         tabs: [
    //           Tab(
    //             icon: Icon(Icons.category),
    //             text: 'Categories',
    //           ),
    //           Tab(
    //             icon: Icon(Icons.star),
    //             text: 'Favorities',
    //           ),
    //         ],
    //       ),
    //     ),
    //     body: TabBarView(

    //       children: [
    //         CategoriesScreen(),
    //         FavoriteScreen(),
    //       ],
    //     ),
    //   ),
    // );
    // SÓ DESCOMENTAR QUE JA ESTA IMPLEMENTADO
  }
}
