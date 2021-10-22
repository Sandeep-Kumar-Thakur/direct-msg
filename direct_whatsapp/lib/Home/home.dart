import 'package:direct_whatsapp/APPbarAction/About_section.dart';
import 'package:direct_whatsapp/APPbarAction/Select_msg_opption.dart';
import 'package:direct_whatsapp/APPbarAction/Setting.dart';
import 'package:direct_whatsapp/Messages/Message_direct.dart';
import 'package:direct_whatsapp/utility/verification.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:url_launcher/url_launcher.dart';




class Myhomepage extends StatefulWidget {
  const Myhomepage({Key? key}) : super(key: key);

  @override
  _MyhomepageState createState() => _MyhomepageState();
}

class _MyhomepageState extends State<Myhomepage> with WidgetsBindingObserver{

  String number="";
  String msg="";
  String countrycode="+91";
  bool codeRequired = true;

  // void _sendSMS(String message, List<String> recipents) async {
  //   String _result = await sendSMS(message: message, recipients: recipents)
  //       .catchError((onError) {
  //     print(onError);
  //   });
  //   print(_result);
  // }

  _openwhats()async{
       if(number.length==10){
         number = countrycode+number;
       }
          try{
            if(msg!="") {
              print("if");
              var temp= await launch(
                  "whatsapp://send?phone=" + number + "&text=" + msg);
              print(temp);
            }
            else {
              print("else");

              await launch(
                  "whatsapp://send?phone=" + number);
            }
          }catch(e){
            List<String> recipients = [number];
            Message_direct().SendSMS(msg, recipients);
          }

  }

  Widget NumberButton(String no){
    _getdatafromclip();
late Color buttoncolour;
setState(() {
  no!="C" && no!="+"?buttoncolour=Colors.white:buttoncolour=Colors.white;

});

    return Expanded(

        child: Container(
          margin: EdgeInsets.all(4),
          decoration: BoxDecoration(
              color: buttoncolour,

             // border: Border.all(color: Colors.grey)
          ),
          child: MaterialButton(
              splashColor: Colors.transparent,
            onLongPress: (){
              if(no=="C"){
                setState(() {
                  number="";
                });
              }
            },

      onPressed: ()async{

          setState(() {
            if(no=="C"){
              number = number.substring(0,number.length-1);
              //tmp = tmp/10.toInt();

            }else if(number.length<=16){
              number = number+no;

            }

            if(no=="+"){
              codeRequired = false;
            }

            if(number.length==0){
              codeRequired = true;

            }

          });
      },
      child:no=="C"?Icon(Icons.backspace_outlined) :Text(no,style: TextStyle(
          color: Colors.black,
              fontSize: MediaQuery.of(context).size.height*0.04
      ),),

    ),
        ));
  }
  String clipNumber ="null";

  Future _getdatafromclip()async{
   clipNumber="null";
    ClipboardData? data = await Clipboard.getData('text/plain');
    String temp = data!.text.toString();
    temp = temp.replaceAll(" ", "");
    if(Verify().IsValidPhoneNumber(temp)==true){
      //print("Number : " + temp);
     // print("here");
      setState(() {
        clipNumber = temp;
      });
    }else{
     // print(temp);
    }
  }

  Future getMessage()async{

    String temp =  await
    Navigator.push(context, MaterialPageRoute(builder: (context)=>Mymessage(search: "null",)));
   // print("print : "+msg);

    setState(() {
      msg = temp;
    });

  }



  @override
  void initState() {
    // TODO: implement initState
    super.initState();


    WidgetsBinding.instance!.addObserver(this);



  }

  @override
  void dispose() {
    WidgetsBinding.instance!.removeObserver(this);
    super.dispose();
  }
 late AppLifecycleState _notification;

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    // TODO: implement didChangeAppLifecycleState
    super.didChangeAppLifecycleState(state);
    setState(() {
      if (state == AppLifecycleState.paused) {
        print("paused");
        // Your Code goes here
      } else if (state == AppLifecycleState.inactive) {
        print("inactive");

        // Your Code goes here
      } else if(state==AppLifecycleState.resumed){
        print("resumed");
        _getdatafromclip();


        // Your Code goes here
      }else{
        print("dont now");
      }
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text("Direct Messages"),
        actions: [
          PopupMenuButton(
            icon: Icon(Icons.menu),  //don't specify icon if you want 3 dot menu
            color: Colors.white,
            itemBuilder: (context) => [
              PopupMenuItem<int>(
                value: 0,
                child: Text("Select Message",style: TextStyle(color: Colors.black),),
              ),
              PopupMenuItem<int>(
                value: 1,
                child: Text("Settings",style: TextStyle(color: Colors.black),),
              ),
              PopupMenuItem<int>(
                value: 2,
                child: Text("About Us",style: TextStyle(color: Colors.black),),
              ),
            ],
            onSelected: (item) => {
              if(item==0){
                getMessage()
              },
              if(item==1){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>Setting()))

              },
              if(item==2){
               Navigator.push(context, MaterialPageRoute(builder: (context)=>About_section()))
              }
            },
          ),
        ],
      ),
      body: Center(

        child: SafeArea(
          child: Container(
            margin: EdgeInsets.only(top: 16),

            // color: Colors.red,
            height: MediaQuery.of(context).size.height,

            child: Stack(
              //mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                    margin: EdgeInsets.only(top: 30,left: MediaQuery.of(context).size.width*0.40,),
                    width: 70,
                    height: 70,
                    child: Image.asset("assets/logowp.png")),
                //-------textfields
                Container(
                  //     color: Colors.blue,
                  margin: EdgeInsets.only(left:MediaQuery.of(context).size.width*0.1 ,top: MediaQuery.of(context).size.height*0.2) ,
                  height: MediaQuery.of(context).size.height*0.1,
                  child: Row(
                    children: [

                      Container(

                          margin: EdgeInsets.only(left:0),
                          width: MediaQuery.of(context).size.width*0.8,
                          height: 100,
                          child:number!=""? Center(child: Text(number,style: TextStyle(fontSize: MediaQuery.of(context).size.width*0.07),)):Center(
                            child: Text("Enter or Copy/Paste the number",style: TextStyle(fontSize: MediaQuery.of(context).size.width*0.05,color: Colors.grey),
                            ),
                          ),
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.black12)
                        ),
                      ),
                    ],
                  ),
                ),
                //-----------message container------
                Visibility(

                  child: Container(


                    height: 50,
                    margin: EdgeInsets.only(top: MediaQuery.of(context).size.height*0.33),

                    //width: 200,

                    child:
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          margin: EdgeInsets.only(left: 10),
                            child: Text("Message : ",style: TextStyle(
                              color: Colors.blue,
                              fontSize: 18
                            ),)),
                        TextButton(

                          onPressed: (){
                            Navigator.push(context, MaterialPageRoute(builder: (context)=>Mymessage(search: msg)));
                          },
                          child: Container(

                            width: 200,
                            height: 23,

                            child: Text(msg,
                              maxLines: 1,
                              softWrap: false,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                fontSize: 18,

                            ),),
                          ),
                        ),
                        IconButton(onPressed: (){
                          setState(() {
                            msg="";
                          });
                        },icon: Icon(Icons.cancel_outlined,color: Colors.red,),)
                      ],
                    ),

                  ),
                  visible: msg==""?false:true,
                ),
                Container(

                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        color: Colors.grey.shade300,
                        height: 50,
                        width: MediaQuery.of(context).size.width*0.9 ,
                        child: MaterialButton(
                          minWidth: MediaQuery.of(context).size.width*0.9,
                          color: Colors.blue,
                          onPressed: clipNumber =="null"&&number==""?null:(){

                            if(number==""){
                              setState(() {
                                print(clipNumber);
                                number = clipNumber;
                              });
                            }
                            else{
                              _openwhats();

                            }


                          },
                          child: number==""?Text("Paste",style: TextStyle(
                            fontSize: 18,
                            color: Colors.white,
                            fontWeight: FontWeight.w400,
                          ),):Text("Send",style: TextStyle(
                            fontSize: 18,
                            color: Colors.white,
                            fontWeight: FontWeight.w400,
                          ),),
                        ),
                      ),
                    ],
                  ),
                  color: Colors.white,
                  width: MediaQuery.of(context).size.width,
                  margin: EdgeInsets.only(top: MediaQuery.of(context).size.height*0.41),
                  height: 62,
                ),

//-------buttons
                Container(
                  
                  //color: Colors.grey,
                  margin:EdgeInsets.only(top:MediaQuery.of(context).size.height*0.51 ) ,
                  height: MediaQuery.of(context).size.height*0.46,
                  //color: Colors.blue,
                  child: Column(
                    children: [



                      Row(
                        children: [
                         NumberButton("1"),
                          NumberButton("2"),
                          NumberButton("3"),
                        ],
                      ),
                      Row(
                        children: [
                          NumberButton("4"),
                          NumberButton("5"),
                          NumberButton("6"),
                        ],
                      ),
                      Row(
                        children: [
                          NumberButton("7"),
                          NumberButton("8"),
                          NumberButton("9"),
                        ],
                      ),
                      Row(
                        children: [
                          NumberButton("+"),
                          NumberButton("0"),
                          NumberButton("C"),
                        ],
                      ),
                    ],
                  ),
                )//button

              ],
            ),
          ),
        ),
        // child: MaterialButton(
        //   onPressed: ()async{
        //    // FlutterOpenWhatsapp.sendSingleMessage("919855897673", "Hello");
        //      await launch(
        //         "https://wa.me/${919855897673}");
        //   },
        //   child: Text("press"),
        // ),
      ),
    );
  }
}

