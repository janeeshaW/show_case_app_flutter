import 'package:flutter/material.dart';

import '../models/grid_services.dart';
import '../widgets/custom_grid_view.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  List<Services> gridServices = [];


  @override
  void initState() {
    gridServices = fetchServices();
    setState(() {
    });
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Showcase App'),
      ),
      body: SingleChildScrollView(
        child: CustomGridView(
          servicesList: gridServices,
          onItemTapped: (value) {
            //performAction(value);
          },
        ),
      ),
    );
  }
  List<Services> fetchServices(){
    return <Services>[
      Services('IMAGE SLIDER', '01'),
      Services('CUSTOM PAINTER', '02'),
      Services('IMAGE PICKER', '03'),
      Services('ANIMATION', '04'),
      Services('BIOMETRICS', '05'),
      Services('IMAGE SLIDER', '01'),
      Services('CUSTOM PAINTER', '02'),
      Services('IMAGE PICKER', '03'),
      Services('ANIMATION', '04'),
      Services('BIOMETRICS', '05'),

    ];

  }
}
