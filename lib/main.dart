import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:newproject/firebase_options.dart';
import 'package:newproject/models/users.dart';
import 'package:newproject/utilities/my_themes/my-app_theme.dart';
import 'package:newproject/screens/local_api_login.dart';
import 'package:newproject/utilities/constants/image_controller.dart';
import 'package:newproject/utilities/controllers/local_api_controllers.dart';
import 'package:provider/provider.dart';
Future main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
    );
  await Hive.initFlutter();
  Hive.registerAdapter(UsersAdapter());
  await Hive.openBox<Users>('userlist');
  runApp(const MyApp());
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
      ],
      child: MaterialApp(
        theme: MyAppTheme.myLightTheme,
        darkTheme: MyAppTheme.myDarkThem,
        themeMode: ThemeMode.system,
        debugShowCheckedModeBanner: false,
        home: const LocalApiLogin(),
      ),
    );
  }
}

