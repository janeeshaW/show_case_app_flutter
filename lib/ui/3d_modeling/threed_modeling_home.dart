import 'package:flutter/material.dart';
import 'package:babylonjs_viewer/babylonjs_viewer.dart';

class ThreeDModelingHome extends StatefulWidget {
  const ThreeDModelingHome({Key? key}) : super(key: key);

  @override
  State<ThreeDModelingHome> createState() => _ThreeDModelingHomeState();
}

class _ThreeDModelingHomeState extends State<ThreeDModelingHome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BabylonJSViewer(src: 'assets/images/v2.glb',),
    );
  }
}
