import 'package:flutter/material.dart';
import 'package:meowing/services/auth.dart';
import 'screens/wrapper.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:splash_screen_view/SplashScreenView.dart';
import 'package:provider/provider.dart';
import 'package:meowing/models/user.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:meowing/shared/constraints.dart';
import 'package:splash_screen_view/SplashScreenView.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  MobileAds.instance.initialize();
  runApp(
    const MyApp(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return StreamProvider<MyUser?>.value(
        value: AuthService().user,
        initialData: null,
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          home: SplashScreenView(
            pageRouteTransition: PageRouteTransition.CupertinoPageRoute,
            textType: TextType.TyperAnimatedText,
            navigateRoute: Wrapper(),
            duration: 2000,
            text: 'HappyTone',
            textStyle: tekoMyName.copyWith(fontSize: 50, color: Colors.white),
            backgroundColor: Colors.orangeAccent,
          ),
        )
//  Wrapper(),
        );
  }
}
