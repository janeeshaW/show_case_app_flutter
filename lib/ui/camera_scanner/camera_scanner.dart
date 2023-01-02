import 'package:flutter/material.dart';
import 'package:flutter_showcase_app/resources/string_values.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:sizer/sizer.dart';
import 'dart:async';
import 'dart:io';
import 'package:google_ml_kit/google_ml_kit.dart';

import '../../resources/styles.dart';

class CameraScanner extends StatefulWidget {
  const CameraScanner({Key? key}) : super(key: key);

  @override
  State<CameraScanner> createState() => _CameraScannerState();
}

class _CameraScannerState extends State<CameraScanner> {
  String _imagePath = "";
  final ImagePicker _picker = ImagePicker();
  late final TextDetector _textDetector;
  String printText = "";

  @override
  void initState() {
    // Initializing the text detector
    _textDetector = GoogleMlKit.vision.textDetector();
    _recognizeTexts();
    super.initState();
  }

  void _recognizeTexts() async {
    // Creating an InputImage object using the image path
    final XFile? image = await _picker.pickImage(source: ImageSource.gallery);
    _imagePath = image!.path;
    final inputImage = InputImage.fromFilePath(_imagePath);
    // Retrieving the RecognisedText from the InputImage
    final text = await _textDetector.processImage(inputImage);
    // Finding text String(s)
    for (TextBlock block in text.blocks) {
      for (TextLine line in block.lines) {
        print('text: ${line.text}');
        setState(() {
          printText = printText + line.text;
        });
      }
    }
  }

  /// Display photo album for picking.
  Future<void> _onAlbumLabelTap(BuildContext c) async {
    // _pickedFile = await ImagePicker().getImage(source: ImageSource.gallery);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(StringValues.lblCameraScanner),
      ),
      body: Column(
        children: [
          Center(
              child: Container(
            margin: EdgeInsets.only(bottom: 4.h, top: 15.h),
            child: Text(
              printText,
              textAlign: TextAlign.center,
              style: Styles.normalTextStyle(18.sp, Colors.black),
            ),
          )),
          Center(
              child: Container(
                margin: EdgeInsets.only(bottom: 4.h, top: 15.h),
                child: TextButton(
                    autofocus: false,
                    onPressed: () {
                      _recognizeTexts();
                    },
                    child: Text(
                      StringValues.lblScanImage,
                      style: GoogleFonts.montserrat(
                          textStyle: TextStyle(fontSize: 15, color: Color(0xFF007AFF))),
                      textScaleFactor: 1,
                    )),
              )
          )
        ],
      ),
    );
  }
}
