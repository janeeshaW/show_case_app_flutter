import 'package:flutter/material.dart';
import 'package:flutter_showcase_app/models/menu_item.dart';
import 'package:sizer/sizer.dart';

import '../../models/final_menu_items.dart';

class DrawerMenu extends StatefulWidget {
  final MenuItem currentMenu;
  final ValueChanged<MenuItem> onSelectedItem;
  const DrawerMenu({Key? key,required this.currentMenu, required this.onSelectedItem}) : super(key: key);

  @override
  State<DrawerMenu> createState() => _DrawerMenuState();
}

class _DrawerMenuState extends State<DrawerMenu> {
  @override
  Widget build(BuildContext context) {
    return Theme(
      data: ThemeData.dark(),
      child: Scaffold(
        backgroundColor: Colors.indigoAccent,
        body: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Spacer(),
            ...MenuItems.all.map(buildMenuItems).toList(),
            const Spacer(),
          ],
        ),),
      ),
    );
  }

  Widget buildMenuItems(MenuItem item) =>  ListTileTheme(
    selectedColor: Colors.white,
    child: ListTile(
      minLeadingWidth: 2.h,
      leading: Icon(item.icon),
      title: Text(item.name),
      onTap: ()=> widget.onSelectedItem(item),
      selected: widget.currentMenu == item,
      selectedTileColor: Colors.black26,
    ),
  );
}
