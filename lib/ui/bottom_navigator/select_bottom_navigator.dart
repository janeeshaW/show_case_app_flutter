import 'package:flutter/material.dart';
import 'package:flutter_showcase_app/ui/bottom_navigator/scroll_bottom_navigator.dart';

import '../../models/grid_services.dart';
import '../../resources/string_values.dart';
import '../../widgets/custom_grid_view.dart';
import 'animated_bottom_navigator.dart';
import 'fancy_bottom_navigator.dart';

class BottomNavigatorSelector extends StatefulWidget {
  const BottomNavigatorSelector({Key? key}) : super(key: key);

  @override
  State<BottomNavigatorSelector> createState() => _BottomNavigatorSelectorState();
}

class _BottomNavigatorSelectorState extends State<BottomNavigatorSelector> {
  List<Services> bottomNavigatorServices = [];

  @override
  void initState() {
    bottomNavigatorServices = fetchServices();
    setState(() {
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('BOTTOM NAVIGATORS'),
      ),
      body: SingleChildScrollView(
        child: CustomGridView(
          servicesList: bottomNavigatorServices,
          onItemTapped: (value) {
            performAction(value);
          },
        ),
      ),
    );
  }
  List<Services> fetchServices(){
    return <Services>[
      Services(StringValues.lblAnimatedBottomNavigation, '01'),
      Services(StringValues.lblScrollBottomNavigation, '02'),
      Services(StringValues.lblFancyBottomNavigation, '03'),
    ];

  }
  Future<void> performAction(String action) async {
    switch (action) {
      case StringValues.lblAnimatedBottomNavigation:
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const AnimatedBottomNavigator()),
        );
        break;
      case StringValues.lblScrollBottomNavigation:
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const ScrollBottomNavigator()),
        );
        break;
      case StringValues.lblFancyBottomNavigation:
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const FancyBottomNavigator()),
        );
        break;
    }

  }
}
