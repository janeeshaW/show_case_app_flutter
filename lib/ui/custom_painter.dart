import 'package:flutter/material.dart';

import '../resources/string_values.dart';

class CustomPainter extends StatefulWidget {
  const CustomPainter({Key? key}) : super(key: key);

  @override
  State<CustomPainter> createState() => _CustomPainterState();
}

class _CustomPainterState extends State<CustomPainter> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(StringValues.lblTileCustomPainter),
      ),
      body: Container(),
    );
  }
}
