import 'package:flutter/material.dart';
import 'package:newproject/controller/local_api_controller.dart';
import 'package:provider/provider.dart';

class LocalApiLogin extends StatelessWidget {
  const LocalApiLogin({super.key});

  @override
  Widget build(BuildContext context) {
    var provider=Provider.of<LocalApiController>(context);
    return Scaffold(
      body:Consumer<LocalApiController>(builder: (BuildContext context, LocalApiController value, Widget? child) { 
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              TextFormField(controller:provider.email ,),
              TextFormField(controller:provider.phone ,),
              ElevatedButton(onPressed: (){
                Provider.of<LocalApiController>(context,listen: false).apiPostLogin();
              }, child: const Text("Login"))
            ],
          ),
        );
       },),
    );
  }
}