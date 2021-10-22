import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class About_section extends StatefulWidget {
  const About_section({Key? key}) : super(key: key);

  @override
  _About_sectionState createState() => _About_sectionState();
}

class _About_sectionState extends State<About_section> {


  lunchlink(String links)async{
    await launch(links);
  }

  Widget header(String head){
    return Container(
      margin: EdgeInsets.only(top: 30,),
      child: Row(
        children: [
          Text(head,style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w900,
          ),),
        ],
      ),
    );
  }
  
  Widget discription(String dis){
    return Container(
      margin: EdgeInsets.only(top: 7),
      child: Text(
        dis
        ,style: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w300
      ),),
    );
  }

  Widget link(String links){
    return Row(
      children: [
        InkWell(
          onTap: (){
            lunchlink(links);
          },
            child: Text(links,style:TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w300,

                color: Colors.blue
            ), )),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("About Us"),
      ),
       body: SafeArea(
         child: SingleChildScrollView(
           child: Center(
           child: Center(
             child: Container(

               width: MediaQuery.of(context).size.width*0.9,
               margin: EdgeInsets.symmetric(horizontal:MediaQuery.of(context).size.width*0.05,vertical: 10) ,
               child: Column(
                 children: [
                   Container(
                     margin: EdgeInsets.only(top: 30),
                     width: 70,
                       height: 70,
                       child: Image.asset("assets/logowp.png")),
                  SizedBox(height: 15,),
                  header("About Company :"),
                   discription( "Zero2unicorn's team take the time to get to know you and your market to createan all-encompassing software marketing presence. This is hoe we have become one of Best Software Company in the World"),
                   discription("As greate things in business are never done by one person. They're done by team of people son motive of our company is team work and custome satisfation."),
                   header("About App :"),
                   discription("Let's use this app and save and efforts for messaging. This will help you in enhancing your conservations without saving numbers")
                   ,
                   link("https://zero2unicorn.com"),
                   header("Developed By : "),
                   SizedBox(
                     height: 7,
                   ),
                   Row(
                     children: [
                       Text("Sandeep kumar(Mobile developer)",style: TextStyle(

                           fontSize: 16,
                           fontWeight: FontWeight.w300
                       ),),
                     ],
                   ),
                   Row(
                     children: [
                       Text("Zero2unicorn Labs Private Limited",style: TextStyle(

                       fontSize: 16,
                       fontWeight: FontWeight.w300
                   ),),
                     ],
                   ),
                   Row(
                     children: [
                       Text("Email : ",style: TextStyle(

                           fontSize: 16,
                           fontWeight: FontWeight.w300
                       ),),
                       InkWell(
                         onTap: (){
                           launch("mailto:sandeep.zero2unicorn@gmail.com");
                         },
                         child: Text("sandeep.zero2unicorn@gmail.com",style: TextStyle(
                           color: Colors.blue,
                             fontSize: 16,
                             fontWeight: FontWeight.w300
                         ),),)
                     ],
                   ),
                   header("Key Features :"),
                   Container(
                     margin: EdgeInsets.only(top: 10),
                     child: Column(
                       children: [
                         Row(
                           children: [
                             Text("- Start conversation without saving number",style: TextStyle(
                                 fontSize: 16,
                                 fontWeight: FontWeight.w300
                             ),),
                           ],
                         ),
                         Text("- Can predefine or custom message by click on app bar button and choose Select message",style: TextStyle(
                             fontSize: 16,
                             fontWeight: FontWeight.w300
                         ),),


                       ],
                     ),
                   ),


                 ],
               ),
             ),
           ),
         ),
       ),
    ));
  }
}
