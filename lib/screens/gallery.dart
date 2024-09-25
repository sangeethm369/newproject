import 'dart:io';

import 'package:flutter/material.dart';
import 'package:newproject/utilities/constants/hive_box.dart';
import 'package:newproject/utilities/constants/image_controller.dart';
import 'package:newproject/utilities/constants/image_list.dart';
import 'package:provider/provider.dart';

class GalleryPage extends StatefulWidget {
  const GalleryPage({super.key, required this.userName});
  final String userName;

  @override
  State<GalleryPage> createState() => _GalleryPageState();
}

class _GalleryPageState extends State<GalleryPage> {

  @override
  void initState() {
    var imagePaths=HiveBoxs.getUsers().get(widget.userName)!.images;
    fileImages=imagePaths.map((filePath) => File(filePath)).toList();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    
    var use=HiveBoxs.getUsers();
    print("hive:${use.get(widget.userName)!.images.length}");
    return Scaffold(
      floatingActionButton: FloatingActionButton(onPressed: (){
        Provider.of<ImagePickerController>(context,listen: false).imagePicker(use.get(widget.userName)!);
      },child: const Icon(Icons.add),),
      appBar: AppBar(actions: [IconButton(onPressed: (){
        Navigator.popUntil(context, (route) => route.isFirst);
      }, icon: const Icon(Icons.logout))],),
      body: Consumer<ImagePickerController>(builder: (BuildContext context, ImagePickerController value, Widget? child) { 
          if(fileImages.isEmpty){
            return const Center(child:Text("No Images\nplease add Images",textAlign: TextAlign.center,));
          }
          else{return GridView.builder(
          gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(maxCrossAxisExtent: 150), 
          itemCount: fileImages.length,
          itemBuilder: (context, index) {
            return Card(child: Image.file(fileImages[index],fit: BoxFit.fill,),);
          },);}
         },
      ),
    );
  }
}