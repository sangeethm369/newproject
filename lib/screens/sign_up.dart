import 'package:flutter/material.dart';
import 'package:newproject/models/users.dart';
import 'package:newproject/screens/gallery.dart';
import 'package:newproject/screens/log_in.dart';
import 'package:newproject/utilities/constants/hive_box.dart';
import 'package:newproject/utilities/custom_textformfield/custom_text_form_field.dart';

class SignUpPage extends StatelessWidget {
  SignUpPage({super.key});

  final TextEditingController name=TextEditingController();

  final TextEditingController password=TextEditingController();

  final TextEditingController confirm=TextEditingController();

  final TextEditingController email=TextEditingController();

  final _formKey=GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Column(crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 20,),
                Align(
                  child: Text("Sign Up",style: TextStyle(
                        color: Colors.brown.shade800,
                        fontWeight: FontWeight.bold,
                        fontSize: 34),),
                ),
                const SizedBox(height: 20,),
                Text("Name",style: TextStyle(color: Colors.green.shade700,fontWeight: FontWeight.w400)),
                CustomTextFormField(controller: name, hint: "name", obscured: false),
                const SizedBox(height: 10,),
                Text("Email",style: TextStyle(color: Colors.green.shade700,fontWeight: FontWeight.w400)),
                CustomTextFormField(controller: email,hint: "email",obscured: false,),
                const SizedBox(height: 10,),
                Text("Password",style: TextStyle(color: Colors.green.shade700,fontWeight: FontWeight.w400)),
                CustomTextFormField(controller: password,hint: "password", obscured: true,),
                const SizedBox(height: 15,),
            
                Align(
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      elevation: 3,
                      shadowColor: Colors.deepOrange,
                      shape: const BeveledRectangleBorder(
                        borderRadius: BorderRadius.only(
                          bottomRight: Radius.circular(15),
                          topLeft: Radius.circular(15))),
                      backgroundColor: const Color.fromARGB(255, 158, 158, 158)),
                    onPressed: (){
                      if (_formKey.currentState!.validate()) {
                        if (HiveBoxs.getUsers().containsKey(email.text)) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: const Text("Account already exiest"),
                              behavior: SnackBarBehavior.floating,
                              backgroundColor: Colors.red,
                              shape:RoundedRectangleBorder(borderRadius:BorderRadius.circular(15)),
                              )
                          );
                        }else{
                          addUsers(name.text, email.text, password.text, []);
                          Navigator.push(context, MaterialPageRoute(builder: (context) => GalleryPage(userName: email.text),));
                        }
                      }
                    },
                    child:  const Text(
                      "Sign Up",
                      style: TextStyle(
                        color: Colors.deepOrange,
                        fontWeight: FontWeight.w400),)),
                ),
                Align(child: TextButton( onPressed: () { 
                  Navigator.push(context, MaterialPageRoute(builder: (context) => LogInPage(),));
                }, child: const Text("Already have an account?",style: TextStyle(color: Colors.grey),),),),
                
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future addUsers(String name,String email,String password,List<String> images) async {
    final users=Users()
    ..name=name
    ..email=email
    ..password=password
    ..images=images;

    final box=HiveBoxs.getUsers();
    box.put(email, users);
  }
}