import 'package:app/provider/main_provider.dart';
import 'package:app/screens/auth/sign_up_gender_and_birthday.dart';
import 'package:app/screens/splash_screen.dart';
import 'package:app/utilites/constants.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Firebase.initializeApp();
  // SystemChrome.setSystemUIOverlayStyle(
  //     SystemUiOverlayStyle(statusBarColor: Colors.transparent));
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);

    return ScreenUtilInit(
      builder: (BuildContext context, Widget? child) {
        return ChangeNotifierProvider<MainProvider>(
          create: (context) => MainProvider(),
          builder: (context, child) => MaterialApp(
            title: "fish_masters",
            theme: ThemeData(
              splashColor: kMainColor,
              accentColor: kMainColor,
              scaffoldBackgroundColor: kMainColor,
              fontFamily: "Lato",
              primaryColor: Color(0xff1D2D61),
            ),
            debugShowMaterialGrid: false,
            debugShowCheckedModeBanner: false,
            home: SplashScreen(),
          ),
        );
      },
      designSize: const Size(390, 884),
    );
  }
}
