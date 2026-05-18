import 'package:flutter/material.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
            child: ListView(
              padding: EdgeInsets.zero,
              children: [
                DrawerHeader(decoration: BoxDecoration(color: Colors.lightBlue), child: Text('My beatiful drawer')),
                ListTile(title: Text('Lista 1'),),
                ListTile(title: Text('Lista 2'),),
                ListTile(title: Text('Lista 3'), onTap: (){Navigator.pop(context);},)
              ],
            ));
  
}}