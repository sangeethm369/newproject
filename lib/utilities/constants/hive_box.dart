import 'package:hive_flutter/hive_flutter.dart';
import 'package:newproject/models/users.dart';

class HiveBoxs {
  static Box<Users> getUsers()=>Hive.box<Users>('userlist');
  
}