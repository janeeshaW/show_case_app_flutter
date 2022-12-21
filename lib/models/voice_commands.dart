import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class Commands {

  static const email = "write email";
  static const browser1 = "open";
  static const browser2 = "go to";

  static final all = [email, browser1, browser2];
}

class Utils {
  static void scanText(String rawText){
    final text = rawText.toLowerCase();

    if (text.contains(Commands.email)){
      final body = _getTextAfterCommand(text, Commands.email);
      openEmail(body: body);
    } else if (text.contains(Commands.browser1)){
      final url = _getTextAfterCommand(text, Commands.browser1);
      openLink(url);
    } else if (text.contains(Commands.browser2)){
      final url = _getTextAfterCommand(text, Commands.browser2);
      openLink(url);
    }

  }
  static String _getTextAfterCommand(String text, String command ){
     final indexCommand = text.indexOf(command);
     final indexAfter = indexCommand + command.length;

     if (indexCommand == -1){
       return "";
     } else {
       return text.substring(indexAfter).trim();
     }
  }

  static Future openEmail ({required String body}) async {
    final url = "mailto: ?body=${Uri.encodeFull(body)}";
    await _launchUrl (url);

}
  static Future _launchUrl (String url) async {
    if(await canLaunch(url)){
      await launch(url);
    }
  }

  static Future openLink (String url) async {
    if(url.trim().isEmpty){
      await _launchUrl("https://google.com");
    } else {
      await _launchUrl("https://$url");
    }
  }

}