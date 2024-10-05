
import 'package:flutter/material.dart';
import 'package:newproject/controller/obscure_controller.dart';
import 'package:provider/provider.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({
    super.key,
    
    required this.controller,
    required this.hint,
    required this.obscured,
  });
  final bool obscured;
  
  final TextEditingController controller;
  final String hint;

  @override
  Widget build(BuildContext context) {
    final obscureProvider=Provider.of<ObscureController>(context);
    return TextFormField(
     obscureText: obscured?obscureProvider.obscure:obscured,
     controller: controller,
     decoration: InputDecoration(
       suffixIcon: obscured? IconButton(onPressed: (){
         Provider.of<ObscureController>(context,listen: false).setObscure();
       }, icon: obscureProvider.icon):null,
       focusedBorder: const OutlineInputBorder(
         borderSide: BorderSide(color: Colors.green),
         borderRadius: BorderRadius.only(
           bottomLeft: Radius.circular(15),
           topRight: Radius.circular(15)
           )),
       hintText: hint,
       border: const OutlineInputBorder(
         borderRadius: BorderRadius.only(
           bottomLeft: Radius.circular(15),
           topRight: Radius.circular(15)
           )
         )
       
     ),
     );
  }
}