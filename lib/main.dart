import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:fireapp/app/widgets/home/product_cart.dart';
import 'package:fireapp/auth/login.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';

import 'firebase_options.dart';

late bool islogin;

Future backgroudMessage(RemoteMessage message) async {
  print("=================== BackGroud Message ========================");
  print("${message.notification!.body}");
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  FirebaseMessaging.onBackgroundMessage(backgroudMessage);

  var user = FirebaseAuth.instance.currentUser;
  if (user == null) {
    islogin = false;
  } else {
    islogin = true;
  }
  runApp(MaterialApp(
      debugShowCheckedModeBanner: false,
      home: AnimatedSplashScreen(
          duration: 3000,
          splash: Icons.home,
          nextScreen: MyApp(),
          splashTransition: SplashTransition.rotationTransition,
          // pageTransitionType: PageTransitionType.rotate,
          backgroundColor: Colors.blue)));
}

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    ProductCard;

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Login(),
      // home: Test(),

      // routes: {
      //   "login": (context) => Login(),
      //   "signup": (context) => SignUp(),
      //   "homepage": (context) => HomePage(),
      // },
    );
  }
}
