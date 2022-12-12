import 'package:flutter/material.dart';

import '../resources/string_values.dart';

class CustomPainterNew extends StatefulWidget {
  const CustomPainterNew({Key? key}) : super(key: key);

  @override
  State<CustomPainterNew> createState() => _CustomPainterNewState();
}

class _CustomPainterNewState extends State<CustomPainterNew> {
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
