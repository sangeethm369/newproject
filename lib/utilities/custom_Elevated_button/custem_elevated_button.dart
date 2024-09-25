import 'package:flutter/material.dart';

class CustomLogSignButton extends StatelessWidget {
  final String name;

  const CustomLogSignButton({
    super.key, required this.name
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(elevation: 3,shadowColor: Colors.deepOrange,
        shape: const BeveledRectangleBorder(
          borderRadius: BorderRadius.only(
            bottomRight: Radius.circular(15),
            topLeft: Radius.circular(15))),
        backgroundColor: const Color.fromARGB(255, 158, 158, 158)),
      onPressed: (){}, 
      child:  Text(name,style: const TextStyle(color: Colors.blue,fontWeight: FontWeight.w400),));
  }
}