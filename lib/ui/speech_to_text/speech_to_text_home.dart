import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../api/speech_api.dart';
import '../../models/voice_commands.dart';
import '../../resources/app_colors.dart';
import '../../resources/styles.dart';
import 'package:avatar_glow/avatar_glow.dart';
import 'package:clipboard/clipboard.dart';

class SpeechToTextHome extends StatefulWidget {
  const SpeechToTextHome({Key? key}) : super(key: key);

  @override
  State<SpeechToTextHome> createState() => _SpeechToTextHomeState();
}

class _SpeechToTextHomeState extends State<SpeechToTextHome> {

  String text = "Press the button and start speaking";
  bool isListening = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          Builder(
            builder: (context) {
              return IconButton(onPressed: () async{
                FlutterClipboard.copy(text);
                Scaffold.of(context).showSnackBar(const SnackBar(content: Text("Copied to clipboard")));
              },
                  icon: const Icon(Icons.content_copy_rounded));
            }
          )
        ],
        centerTitle: true,
        backgroundColor: Colors.indigo,
        title: const Text("Speech To Text"),
      ),
      body: SingleChildScrollView(
        reverse: true,
          child: Center(child:
          Padding(
            padding: EdgeInsets.only(left: 2.h,right: 2.h,top: 5.h,bottom: 150),
            child: Text(text,
              textAlign: TextAlign.center,
              style: Styles.normalTextStyle(20.sp, AppColors.primaryColor),),
          ))),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: AvatarGlow(
        animate: isListening,
        glowColor: Theme.of(context).primaryColor,
        endRadius: 75,
        child: FloatingActionButton(
          onPressed: () {
            toggleRecording();
          },
        child: Icon(isListening?Icons.mic :Icons.mic_none_rounded, size: 35,),),
      ),
    );
  }
  Future toggleRecording() => SpeechApi.toggleRecording(
      onResult: (text) => setState(()=>this.text = text),
      onListening: (bool isListening) {
        setState(() {
          this.isListening = isListening;
        });
        if(!isListening){
          Future.delayed(const Duration(milliseconds: 1000), () {
            Utils.scanText(text);
          });

        }
      });
}
