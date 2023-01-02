import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bluetooth_serial/flutter_bluetooth_serial.dart';
import 'package:sizer/sizer.dart';

class BluetoothScanner extends StatefulWidget {
  const BluetoothScanner({Key? key}) : super(key: key);

  @override
  State<BluetoothScanner> createState() => _BluetoothScannerState();
}

class _BluetoothScannerState extends State<BluetoothScanner> {

@override
  void initState() {
  // Initialize the Bluetooth connection
  // FlutterBluetoothSerial.instance.init()
  super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Bluetooth Chat'),
      ),
      body: Column(
        children: <Widget>[
          // Other widgets go here
          // RaisedButton(
          //   child: Text('Scan for devices'),
          //   onPressed: () async {
          //     // Show a dialog to select a device
          //     List<BluetoothDevice> devices = await FlutterBluetoothSerial.instance.getBondedDevices();
          //     BluetoothDevice selectedDevice = await showDialog(
          //       context: context,
          //       // builder: (context) => DevicePicker(
          //         devices: devices,
          //       ),
          //     );

              // Connect to the selected device
              // FlutterBluetoothSerial.instance.connect(selectedDevice.address);
            // },
          // ),
        ],
      ),
    );
  }

}
