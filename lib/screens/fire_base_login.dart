import 'package:flutter/material.dart';
import 'package:newproject/controller/theme_controller.dart';
import 'package:newproject/utilities/custom_Elevated_button/custem_elevated_button.dart';
import 'package:newproject/utilities/custom_textformfield/custom_text_form_field.dart';
import 'package:provider/provider.dart';


class FireBaseLoginPage extends StatelessWidget {
  FireBaseLoginPage({super.key});
  
  final TextEditingController email=TextEditingController();
  final TextEditingController password=TextEditingController();
  final String hint="fhgjk";

  @override
  Widget build(BuildContext context) {
    var themeProvider=Provider.of<ThemeController>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text("Firebase Login",style: TextStyle(fontSize: 28,fontWeight: FontWeight.bold),),
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
            const Text("Email"),
            CustomTextFormField(controller: email, hint: "email", obscured: false,),
            const Text("Password"),
            CustomTextFormField(controller: password, hint: "password", obscured: true,),
            const SizedBox(height: 30,),
            CustomLogSignButton(name: "Log In", onTap: () { 
              // Navigator.push(context, MaterialPageRoute(builder: (context) => const LogInPage(),));
             },),
             
        
          ],
        ),
      ),
    );
  }
}
