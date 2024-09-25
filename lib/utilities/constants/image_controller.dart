import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:newproject/models/users.dart';
import 'package:newproject/utilities/constants/image_list.dart';

class ImagePickerController with ChangeNotifier{ 
  
  Future imagePicker(Users key)async{
    ImagePicker picker=ImagePicker();
    var xfiles=await picker.pickMultiImage();
    fileImages.addAll(xfiles.map((e) => File(e.path),).toList());
    print(fileImages);
    updateUser(key, fileImages);
    notifyListeners();
  }
  
}

void updateUser(Users users,List<File> images){
  List<String> stringList = images.map((file) => file.path).toList();
      users.images=stringList;
      users.save();
  }