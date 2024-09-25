import 'package:flutter/material.dart';
import 'package:newproject/screens/gallery.dart';
import 'package:newproject/utilities/constants/hive_box.dart';
import 'package:newproject/utilities/custom_textformfield/custom_text_form_field.dart';

class LogInPage extends StatefulWidget {
  const LogInPage({super.key});

  @override
  State<LogInPage> createState() => _LogInPageState();
}

class _LogInPageState extends State<LogInPage> {
  TextEditingController email=TextEditingController();
  TextEditingController password=TextEditingController();
  final bool _isShow=true;
  final _formKey=GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Form(key: _formKey,
          child: SingleChildScrollView(
            child: Column(crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 20,),
                Center(
                  child: Text(
                    " Log In ",
                    style: TextStyle(
                      color: Colors.brown.shade800,
                      fontWeight: FontWeight.bold,
                      fontSize: 34),)),
            
                const SizedBox(height: 20,),
            
                Text("Email",style: TextStyle(color: Colors.green.shade700,fontWeight: FontWeight.w400),),
            
                CustomLoginTextFormField(ctrl: email,hintText: "email",),
            
                const SizedBox(height: 10,),
            
                Text("Password",style: TextStyle(color: Colors.green.shade700,fontWeight: FontWeight.w400),),
            
                CustomObscureTextFormField(ctrl: password, obscureText: _isShow,hintText: "password",),
            
                const SizedBox(height: 10,),
            
                Align(alignment: Alignment.centerRight,
                  child: Text("Forget Password?",style: TextStyle(color: Colors.red.shade700,fontWeight: FontWeight.bold),)),
                const SizedBox(height: 30,),
            
                Align(child: ElevatedButton(onPressed: (){
                  if (_formKey.currentState!.validate()) {
                        if (HiveBoxs.getUsers().containsKey(email.text)) {
                          if(HiveBoxs.getUsers().get(email.text)!.password==password.text){
                            Navigator.push(context, MaterialPageRoute(builder: (context) =>  GalleryPage(userName: email.text,)));
                          }else{
                            ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: const Text("Wrong Password"),
                              behavior: SnackBarBehavior.floating,
                              backgroundColor: Colors.red,
                              shape:RoundedRectangleBorder(borderRadius:BorderRadius.circular(15)),
                              )
                          );
                          }
                        }else{
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: const Text("Account Doesn't exiest"),
                              behavior: SnackBarBehavior.floating,
                              backgroundColor: Colors.red,
                              shape:RoundedRectangleBorder(borderRadius:BorderRadius.circular(15)),
                              )
                          );
                        }
                      }
                },
                style: ElevatedButton.styleFrom(
                  elevation: 3,shadowColor: Colors.blue,
                  shape: const BeveledRectangleBorder(
                    borderRadius: BorderRadius.only(
                      bottomRight: Radius.circular(15),
                      topLeft: Radius.circular(15))),
                  backgroundColor: const Color.fromARGB(255, 158, 158, 158)),
                child: const Text("Log In",style: TextStyle(color: Colors.deepOrange),))),
            
                const SizedBox(height: 15,),
            
                Align(
                  child: TextButton(onPressed: (){
                    Navigator.pop(context);
                  }, child: const Text("Don't have an account?",style: TextStyle(color: Colors.grey),)),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}



