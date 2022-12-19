import 'package:flutter/material.dart';
import 'package:flutter_showcase_app/ui/custom_painter.dart';
import 'package:flutter_showcase_app/ui/image_slider.dart';
import 'package:flutter_showcase_app/ui/speech_to_text/speech_to_text_home.dart';
import '../models/grid_services.dart';
import '../resources/string_values.dart';
import '../widgets/custom_grid_view.dart';
import 'animated_drawer/drawer.dart';
import 'bottom_navigator/select_bottom_navigator.dart';

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
            performAction(value);
          },
        ),
      ),
    );
  }
  Future<void> performAction(String action) async {
    switch (action) {
      case StringValues.lblTileCustomPainter:
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const FlutterPainterExample()),
        );
        break;
      case StringValues.lblTileImageSlider:
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const ImageSlider()),
        );
        break;
      case StringValues.lblTileDrawer:
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const DrawerMain()),
        );
        break;
      case StringValues.lblBottomNavigation:
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const BottomNavigatorSelector()),
        );
        break;
      case StringValues.lblVoiceIntegration:
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const SpeechToTextHome()),
        );
        break;




    }

  }
  List<Services> fetchServices(){
    return <Services>[
      Services(StringValues.lblTileImageSlider, '01'),
      Services(StringValues.lblTileCustomPainter, '02'),
      Services(StringValues.lblTileDrawer, '03'),
      Services('ANIMATION', '04'),
      Services('BIOMETRICS', '05'),
      Services(StringValues.lblBottomNavigation, '06'),
      Services(StringValues.lblVoiceIntegration, '07'),
      Services('IMAGE PICKER', '03'),
      Services('ANIMATION', '04'),
      Services('BIOMETRICS', '05'),

    ];

  }
}
