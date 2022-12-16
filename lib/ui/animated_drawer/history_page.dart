import 'package:flutter/material.dart';

import '../../resources/string_values.dart';
import '../../widgets/menu_widget.dart';

class HistoryPage extends StatefulWidget {
  const HistoryPage({Key? key}) : super(key: key);

  @override
  State<HistoryPage> createState() => _HistoryPageState();
}

class _HistoryPageState extends State<HistoryPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.deepOrangeAccent,
        title: const Text(StringValues.titleHistoryPage),
        leading: const MenuWidget(),
      ),
    );
  }
}
