import 'package:flutter/material.dart';

import 'package:meals/utils/app_route.dart';

class MainDrawer extends StatelessWidget {
  _createItem(IconData icon, String label, Function() onTap) {
    return ListTile(
      leading: Icon(
        icon,
        size: 26,
      ),
      title: Text(label, style: TextStyle(fontSize: 20)),
      onTap: onTap,
    );
  }

  @override
  
  Widget build(BuildContext context) {
    return Drawer(
        child: Column(
      children: <Widget>[
        Container(
            alignment: Alignment.bottomRight,
            child: Text('Options',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 30,
                    fontWeight: FontWeight.bold)),
            height: 120,
            color: Theme.of(context).accentColor,
            width: double.infinity,
            padding: EdgeInsets.all(20)),
        _createItem(
          Icons.restaurant,
          'Restaurants',
          () => Navigator.of(context).pushReplacementNamed(AppRoute.HOME)
        ),
        _createItem(
          Icons.settings,
          'Settings',
          () => Navigator.of(context).pushNamed(AppRoute.SETTINGS)
        )
      ],
    ));
  }
}
