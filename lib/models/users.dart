import 'package:hive/hive.dart';

part 'users.g.dart';

@HiveType(typeId: 0)
class Users extends HiveObject {
  @HiveField(0)
  late String name;
  @HiveField(1)
  late String email;
  @HiveField(2)
  late String password;
  @HiveField(3)
  late List<String> images;

  
}