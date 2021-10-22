import 'package:direct_whatsapp/splash_screen/splash_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'Home/home.dart';

import 'utility/verification.dart';
import 'package:url_launcher/url_launcher.dart';
// import 'package:flutter_open_whatsapp/flutter_open_whatsapp.dart';

void main(){
  runApp(Myapp());
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);


}

class Myapp extends StatelessWidget {
  const Myapp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(


      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue

      ),
      darkTheme:ThemeData.light(),
      home: Splash_screnn(),
    );
  }
}


