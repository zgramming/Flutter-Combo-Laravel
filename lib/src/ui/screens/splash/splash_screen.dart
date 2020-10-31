import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:global_template/global_template.dart';

import '../../../providers/providers.dart';

import '../login/login_screen.dart';
import '../welcome/welcome_screen.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read(userProvider).readSessionUser();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer(
        builder: (_, watch, __) {
          final user = watch(userProvider.state);
          return SplashScreenTemplate(
            image: ShowImageAsset(
              imageUrl: appConfig.urlImageAsset + '/' + appConfig.urlLogoAsset,
            ),
            navigateAfterSplashScreen: (ctx) {
              if (user.idUser == null) {
                return LoginScreen();
              } else {
                return WelcomeScreen();
              }
            },
            copyRightVersion: CopyRightVersion(),
          );
        },
      ),
    );
  }
}
