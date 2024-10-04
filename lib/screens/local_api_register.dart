import 'package:flutter/material.dart';
import 'package:newproject/utilities/controllers/local_api_controllers.dart';
import 'package:provider/provider.dart';

class LocalApiRegister extends StatelessWidget {
  const LocalApiRegister({super.key});

  @override
  Widget build(BuildContext context) {
    var provider=Provider.of<LocalApiController>(context);
    return Scaffold(
      body: Consumer<LocalApiController>(builder: (BuildContext context, LocalApiController value, Widget? child) { 
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text("Name",),
              TextFormField(controller:provider.name ,),
              Text("Email"),
              TextFormField(controller:provider.email ,),
              Text("Phone"),
              TextFormField(controller:provider.phone ,),
              ElevatedButton(onPressed: (){
                Provider.of<LocalApiController>(context,listen: false).apiPost();
              }, child: const Text("register"))
            ],
          ),
        );
       },),
       
    );
  }
}