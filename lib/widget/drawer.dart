import 'package:flutter/material.dart';

class MainDrawer extends StatelessWidget {

  Widget buildListTile(
      context, String title, IconData icon, VoidCallback tapHandler) {
    return ListTile(
      onTap: tapHandler,
      leading: Icon(icon, size: 30, color: Colors.grey[600]),
      title: Text(
        title,
        style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 25,
            color: Colors.black,
            fontFamily: 'LibreBaskerville-Bold'),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          Container(
            color: Theme.of(context).primaryColor,
            height: 100,
            width: double.infinity,
            padding: const EdgeInsets.all(8),
            alignment: Alignment.bottomCenter,
            child: const Text(
              'Settings',
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 30,
                  color: Colors.white,
                  fontFamily: 'LibreBaskerville-Bold'),
            ),
          ),
          const SizedBox(height: 10),
          buildListTile(context, 'Meals', Icons.restaurant, () {
            Navigator.of(context).pushReplacementNamed('/');
          }),
          const SizedBox(height: 6),
          buildListTile(context, 'Filter', Icons.filter_alt_outlined, () {
            Navigator.of(context).pushReplacementNamed('/FilterScreen');
          })
        ],
      ),
    );
  }
}
