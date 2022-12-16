
import 'package:flutter/material.dart';

import 'menu_item.dart';

class MenuItems {
  static const  dashboard = MenuItem("Dashboard", Icons.dashboard_customize_rounded);
  static const  payment = MenuItem("Payment", Icons.payment_rounded);
  static const notification = MenuItem("Notification", Icons.notifications_active);
  static const history = MenuItem("History", Icons.account_tree_outlined);
  static const  promotion = MenuItem("Promotion", Icons.production_quantity_limits_rounded);
  static const help = MenuItem("Help", Icons.live_help);
  static const rateUs = MenuItem("Rate Us", Icons.star_rate_sharp);
  static const aboutUs = MenuItem("About Us", Icons.question_answer_rounded);
  static const logOut = MenuItem("Log Out", Icons.logout_rounded);

  static const all = <MenuItem> [dashboard,payment,notification,history,promotion,help,rateUs,aboutUs,logOut];
}