
class Verify{
  bool IsNameValid(String value){
    String patteren = r'^[a-zA-Z ]*$';
    RegExp regExp = new RegExp(patteren);
    if (value.length == 0) {
      return false;
    } else if (!regExp.hasMatch(value)) {
      return false;
    } else {
      return true;
    }
    return true;
  }
  bool IsEmailValid(String value){
    String patteren = r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regExp = new RegExp(patteren);
    if (value.length == 0) {
      return false;
    } else if (!regExp.hasMatch(value)) {
      return false;
    } else {
      return true;
    }
    return true;
  }
  bool IsValidPhoneNumber(String value){
    String patteren = r'^\+?[0-9]*$';
    RegExp regExp = new RegExp(patteren);
    if (value.length == 0) {
      print("is zero");

      return false;
    } else if (!regExp.hasMatch(value)) {
      print("expression");

      return false;
    } else {
      return true;
    }
  }
}
