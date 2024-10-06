import 'package:flutter/material.dart';
import 'package:newproject/controller/theme_controller.dart';
import 'package:newproject/screens/fire_base_login.dart';
import 'package:newproject/utilities/custom_Elevated_button/custem_elevated_button.dart';
import 'package:newproject/utilities/custom_textformfield/custom_text_form_field.dart';
import 'package:provider/provider.dart';

class FireBaseSignup extends StatelessWidget {
  FireBaseSignup({super.key});
  final TextEditingController name=TextEditingController();
  final TextEditingController email=TextEditingController();
  final TextEditingController password=TextEditingController();

  @override
  Widget build(BuildContext context) {
    var themeProvider=Provider.of<ThemeController>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text("Firebase SignUp",style: TextStyle(fontSize: 28,fontWeight: FontWeight.bold),),
        centerTitle: true,
        actions: [
          Tooltip(
            message:themeProvider.light? "Switch to dark":"switch to light",
            child: IconButton(
              onPressed: (){
                Provider.of<ThemeController>(context,listen: false).setTheme();
              }, 
              icon: themeProvider.themeIcon),
          ),
        ],
        ),
      
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            const SizedBox(height: 30,),
            const Text("Name"),
            CustomTextFormField(controller: name, hint: "name", obscured: false,),
            const Text("Email"),
            CustomTextFormField(controller: email, hint: "email", obscured: false,),
            const Text("Password"),
            CustomTextFormField(controller: password, hint: "password", obscured: true,),
            const SizedBox(height: 30,),
            CustomLogSignButton(name: "SignUp", onTap: () {
              // Navigator.push(context, MaterialPageRoute(builder: (context) => const LogInPage(),));
             },),
             const SizedBox(height: 20,),
             TextButton(onPressed: (){
              Navigator.push(context, MaterialPageRoute(builder: (context) => FireBaseLoginPage(),));
             }, child: const Text("Already have an account?",style: TextStyle(color: Colors.grey)))
             
        
          ],
        ),
      ),
    );
  }
}