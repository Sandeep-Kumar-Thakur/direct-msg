import 'dart:async';


import 'package:direct_whatsapp/Home/home.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Splash_screnn extends StatefulWidget {
  const Splash_screnn({Key? key}) : super(key: key);

  @override
  _Splash_scrennState createState() => _Splash_scrennState();
}

class _Splash_scrennState extends State<Splash_screnn> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer(Duration(
      seconds: 3
    ), ()=>Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>Myhomepage())));
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding: EdgeInsets.all(5),
              width: 105,
                height: 105,

                child:
                    Image.asset("assets/logowp.png",fit: BoxFit.cover,),


                ),
            Text("Direct Messages",style: TextStyle(
              color: Colors.blue,
              fontSize: 30
            ),)
          ],
        ),
      ),
    );
  }
}
