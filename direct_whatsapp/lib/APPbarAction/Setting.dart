
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:share/share.dart';

class Setting extends StatefulWidget {
  const Setting({Key? key}) : super(key: key);

  @override
  _SettingState createState() => _SettingState();
}

class _SettingState extends State<Setting> {


  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Settings"),
      ),
      body: Center(
        child: Container(
         margin: EdgeInsets.only(top: MediaQuery.of(context).size.height*0.08),
         width: MediaQuery.of(context).size.width*0.8,
          height: MediaQuery.of(context).size.height*0.8,
          child: Column(
            //mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                width: 70,
                  height: 70,
                  child: Image.asset("assets/logowp.png")),
              SizedBox(height: 30,),
              InkWell(
                onTap: (){
                        launch("https://google.com");
                },
                child: Container(
                  width: 200,
                  height: 50,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(color: Colors.blue),
                    borderRadius: BorderRadius.circular(25),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.blue,
                        spreadRadius: 1,
                        blurRadius: 4,
                        offset: Offset(1,1)
                      )
                    ]
                  ),
                  child: Center(child: Text("Terms of Use",style: TextStyle(
                    fontSize: 16
                  ),)),
                ),

              ),
              SizedBox(
                height: 40,
              ),
              InkWell(
                onTap: (){
                  launch("https://google.com");
                },
                child: Container(
                  width: 200,
                  height: 50,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(color: Colors.blue),
                      borderRadius: BorderRadius.circular(25),
                      boxShadow: [
                        BoxShadow(
                            color: Colors.blue,
                            spreadRadius: 1,
                            blurRadius: 4,
                            offset: Offset(1,1)
                        )
                      ]
                  ),
                  child: Center(child: Text("Privacy Policy",style:TextStyle(
                      fontSize: 16
                  ),)),

                ),

              ),
              SizedBox(
                height: 40,
              ),
              InkWell(
                onTap: (){
                Share.share("Hey check out my app at: https://play.google.com/store/apps/details?id=com.zero2unicorn.direct_message");
                },
                child: Container(
                  width: 200,
                  height: 50,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(color: Colors.blue),
                      borderRadius: BorderRadius.circular(25),
                      boxShadow: [
                        BoxShadow(
                            color: Colors.blue,
                            spreadRadius: 1,
                            blurRadius: 4,
                            offset: Offset(1,1)
                        )
                      ]
                  ),
                  child: Center(child: Text("Share App",style: TextStyle(
                      fontSize: 16
                  ),)),
                ),

              ),
              SizedBox(
                height: 40,
              ),
              InkWell(
                onTap: (){
                  launch("https://google.com");
                },
                child: Container(
                  width: 200,
                  height: 50,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(color: Colors.blue),
                      borderRadius: BorderRadius.circular(25),
                      boxShadow: [
                        BoxShadow(
                            color: Colors.blue,
                            spreadRadius: 1,
                            blurRadius: 4,
                            offset: Offset(1,1)
                        )
                      ]
                  ),
                  child: Center(child: Text("Rate App",style:TextStyle(
                      fontSize: 16
                  ),)),

                ),

              ),
            ],


          ),
        ),
      ),
    );
  }
}
