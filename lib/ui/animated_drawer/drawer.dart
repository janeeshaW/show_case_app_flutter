import 'package:flutter/material.dart';
import 'package:flutter_showcase_app/models/final_menu_items.dart';
import 'package:flutter_showcase_app/models/menu_item.dart';
import 'package:flutter_showcase_app/ui/animated_drawer/payment_page.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';

import 'drawer_menu.dart';
import 'notification_page.dart';

class DrawerMain extends StatefulWidget {
  const DrawerMain({Key? key}) : super(key: key);

  @override
  State<DrawerMain> createState() => _DrawerMainState();
}

class _DrawerMainState extends State<DrawerMain> {

  MenuItem currentMenu = MenuItems.payment;

  @override
  Widget build(BuildContext context) {
    return ZoomDrawer(
        menuScreen:  Builder(
          builder: (context) {
            return DrawerMenu(
              onSelectedItem: (MenuItem item) {
                setState(() {
                  currentMenu = item;
                  ZoomDrawer.of(context)!.close();
                });
              },
              currentMenu: currentMenu,);
          }
        ),
        mainScreen: getScreen());
  }
  Widget getScreen (){
    switch (currentMenu) {
      case MenuItems.payment:
        return const PaymentPage();
      case MenuItems.notification:
      default:
        return const NotificationPage();

    }
  }
}
