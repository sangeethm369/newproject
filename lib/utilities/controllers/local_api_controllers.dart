import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:newproject/utilities/constants/post_register_api_url.dart';

class LocalApiController extends ChangeNotifier{
  TextEditingController name=TextEditingController();
  TextEditingController email=TextEditingController();
  TextEditingController phone=TextEditingController();
  apiPost()async{
    var uri=Uri.parse("$url/registration");
    var body={
      "name":name.text,
      "email":email.text,
      "phone":phone.text
    };
    try {
      http.Response res=await http.post(uri,body: body);
      print("res:$res");
    } catch (e) {
      print("Register:$e");
    }
  }
  apiPostLogin()async{
    var uri2=Uri.parse("$url/user_login");
    var body={"email":email.text,"password":phone.text};
    try {
      http.Response res=await http.post(uri2,body: body);
      print("res:${res.statusCode}");
    } catch (e) {
      print("login:$e");
    }
  }
}