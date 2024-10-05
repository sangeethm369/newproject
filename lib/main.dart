import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:newproject/controller/local_api_controller.dart';
import 'package:newproject/controller/obscure_controller.dart';
import 'package:newproject/controller/theme_controller.dart';
import 'package:newproject/firebase_options.dart';
import 'package:newproject/models/users.dart';
import 'package:newproject/screens/fire_base_login.dart';
import 'package:newproject/utilities/constants/image_controller.dart';
import 'package:provider/provider.dart';
Future main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
    );
  await Hive.initFlutter();
  Hive.registerAdapter(UsersAdapter());
  await Hive.openBox<Users>('userlist');
  runApp(
    ChangeNotifierProvider(create: (BuildContext context)=>ThemeController(),
  child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (BuildContext context)=>ImagePickerController(),),
        ChangeNotifierProvider(create: (BuildContext context)=>LocalApiController(),),
        ChangeNotifierProvider(create: (BuildContext context)=>ObscureController(),),
      ],
      child: MaterialApp(
        theme: Provider.of<ThemeController>(context).themeData,
        debugShowCheckedModeBanner: false,
        home: FireBaseLoginPage(),
      ),
    );
  }
}

