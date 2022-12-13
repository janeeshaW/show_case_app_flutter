
import 'package:flutter/material.dart';

import 'menu_item.dart';

class MenuItems {
  static const  payment = MenuItem("Payment", Icons.payment_rounded);
  static const notification = MenuItem("Notification", Icons.notifications_active);
  static const all = <MenuItem> [payment,notification];
}