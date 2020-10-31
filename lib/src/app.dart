import 'package:flutter/material.dart';
import 'package:global_template/global_template.dart';

import 'ui/screens/detail_product/detail_product_screen.dart';
import 'ui/screens/login/login_screen.dart';
import 'ui/screens/splash/splash_screen.dart';
import 'ui/screens/welcome/welcome_screen.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Combo Laravel',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: appConfig.defaultFont,
        accentColor: colorPallete.accentColor,
        primaryColor: colorPallete.primaryColor,
      ),
      home: SplashScreen(),
      routes: {
        WelcomeScreen.routeNamed: (ctx) => WelcomeScreen(),
        LoginScreen.routeNamed: (ctx) => LoginScreen(),
        DetailProduct.routeNamed: (ctx) => DetailProduct(
              idProduct: ModalRoute.of(ctx).settings.arguments,
            ),
      },
    );
  }
}
