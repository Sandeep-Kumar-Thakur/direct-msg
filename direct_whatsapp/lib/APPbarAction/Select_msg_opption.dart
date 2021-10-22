import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Mymessage extends StatefulWidget {
  String search;
   Mymessage({Key? key,required this.search}) : super(key: key);

  @override
  _MymessageState createState() => _MymessageState(search: search);
}

class _MymessageState extends State<Mymessage> {
  late String search;
  _MymessageState({required this.search});

  late List<String> messages;
  ScrollController controller = new ScrollController();
  String newmsg="";
  Future _getList()async{
    SharedPreferences preferences = await SharedPreferences.getInstance();
    List<String>? temp = preferences.getStringList("message");
    if(temp==null){
      print("null");
      List <String>already = [
        "HII",
        "Hello",
        "Good morning"
      ];
      setState(() {
        messages = already;
        preferences.setStringList("message", messages);

      });
    }else{
      print("Not null");
      setState(() {
        messages = (preferences.getStringList("message"))!;
      });
    }
  }

  Future _updatemessage()async{
    SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.setStringList("message", messages);
  }

  onItemChanged(String value)async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    List<String>? mainDataList = preferences.getStringList("message");
    setState(() {
      messages = mainDataList!
      // .where((value) => value.toLowerCase().contains(value.toLowerCase()))
      // .toList();
          .where((v) => v.toLowerCase().contains(value.toLowerCase()))
          .toList();
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    if(search=="null"){
      _getList();

    }else{
      onItemChanged(search);
    }
  }
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Colors.grey,
      appBar: AppBar(
        title: Text("Canned Messages"),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: (){
          showDialog(context: context, builder: (context)=>AlertDialog(
            title: Text("Add Custom Message"),
            actions: [
              TextField(
                autofocus: true,
                maxLines: 2,
                onChanged: (value){
                  setState(() {
                    newmsg = value;
                  });
                },
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextButton(onPressed: (){
                    Navigator.pop(context);
                  }, child: Text("Cancel",style: TextStyle(
                    color: Colors.red,
                    fontSize: 18,
                  ),)),

                  TextButton(onPressed: (){
                    if(newmsg==""){
                      showDialog(context: context, builder: (context)=>AlertDialog(
                        title: Text("Message is Empty!!"),
                        actions: [
                          TextButton(onPressed: (){
                            Navigator.pop(context);
                          }, child: Text("Okay"))
                        ],
                      ));
                    }else{
                      setState(() {
                        messages.add(newmsg);
                        _updatemessage();
                        newmsg="";
                        controller.jumpTo(controller.position.maxScrollExtent);
                      });
                      Navigator.pop(context);
                    }


                  }, child: Text("Save",style: TextStyle(

          fontSize: 18,
          ),)),

                ],
              ),
            ],
          ));

        },
      ),

      body: Container(


        //color: Colors.yellow,
        child: ListView.builder(
          controller: controller,

          itemCount: messages.length,
            itemBuilder: (context,i){
          return InkWell(
            onTap: (){
              Navigator.pop(context,messages[i]);
            },
            child: Container(

              margin: EdgeInsets.only(top: 2),
                decoration: BoxDecoration(
                  color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                          color: Colors.grey.shade200,
                          blurRadius: 2,
                          offset: Offset(2,2)
                      )
                    ]
                ),
                padding: EdgeInsets.only(left: 20,top: 15,bottom: 15),
                //height: 70,
                child: Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(

                        width: MediaQuery.of(context).size.width*0.7,
                        child: Text(messages[i],style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w500
                        ),),
                      ),
                      Visibility(
                        visible: true,
                        child: IconButton(onPressed: (){
                          setState(() {
                            messages.removeAt(i);
                            _updatemessage();

                          });
                        }, icon: Icon(Icons.delete_outline_outlined,color: Colors.red,size: 30,)),
                      )
                    ],
                  ),
                )),
          );

            }),
      )
    );
  }
}
