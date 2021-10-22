import 'package:flutter_sms/flutter_sms.dart';
import 'package:url_launcher/url_launcher.dart';

class Message_direct{

  void SendSMS(String message, List<String> recipents) async {
    String _result = await sendSMS(message: message, recipients: recipents)
        .catchError((onError) {
      print(onError);
    });
    print(_result);
  }

  void openmessage(String msg,String number)async{
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
  }

}