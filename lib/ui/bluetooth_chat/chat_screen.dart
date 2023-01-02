import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bluetooth_serial/flutter_bluetooth_serial.dart';

class ChatScreen extends StatefulWidget {
  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  // A list to store the chat messages
  List<String> _messages = [];

  // A text controller to manage the text field
  TextEditingController _textController = TextEditingController();

  @override
  void initState() {
    super.initState();
    // FlutterBluetoothSerial.instance.onRead()?.listen((message);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        // A scrolling view to display the chat messages
        Expanded(
          child: ListView.builder(
            itemCount: _messages.length,
            itemBuilder: (context, index) => Text(_messages[index]),
          ),
        ),
        // A text field to enter new messages
        TextField(
          controller: _textController,
          onSubmitted: (text) {
            // Send the message over Bluetooth
            FlutterBluetoothSerial.instance.write(text);

            // Add the message to the chat
            setState(() {
              _messages.add(text);
            });

            // Clear the text field
            _textController.clear();
          },
        ),
      ],
    );
  }
}
