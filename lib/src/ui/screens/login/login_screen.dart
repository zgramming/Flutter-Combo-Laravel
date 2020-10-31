import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:global_template/global_template.dart';

import '../../../functions/functions.dart';
import '../../../providers/providers.dart';
import 'widgets/new_user.dart';

class LoginScreen extends StatefulWidget {
  static const routeNamed = '/login-screen';
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();

  final emailTextController = TextEditingController();
  final passwordTextController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: _formKey,
        child: LoginScreenTemplate(
          logo: ShowImageAsset(
            imageUrl: appConfig.urlImageAsset + '/' + appConfig.urlLogoAsset,
            imageSize: 1,
            fit: BoxFit.cover,
          ),
          form: [
            Center(
              child: Text(
                'Login',
                style: appTheme.headline6(context).copyWith(
                      fontFamily: appConfig.headerFont,
                    ),
              ),
            ),
            SizedBox(height: 20),
            TextFormFieldCustom(
              controller: emailTextController,
              labelText: 'Email',
              hintText: 'John.doe@gmail.com',
              keyboardType: TextInputType.emailAddress,
              prefixIcon: Icon(Icons.email),
            ),
            SizedBox(height: 20),
            TextFormFieldCustom(
              labelText: 'Password',
              hintText: '********',
              isPassword: true,
              controller: passwordTextController,
              keyboardType: TextInputType.visiblePassword,
            ),
            SizedBox(height: 20),
            ProviderListener<StateController<bool>>(
              provider: globalLoading,
              onChange: (context, loading) async {
                if (loading.state) {
                  await GlobalFunction.showDialogLoading(context);
                } else {
                  Navigator.of(context).pop();
                }
              },
              child: ButtonCustom(
                onPressed: () async => await RequestFunction.login(
                  context,
                  formKey: _formKey,
                  emailTextController: emailTextController,
                  passwordTextController: passwordTextController,
                ),
                child: Text('Log-in'),
              ),
            ),
            SizedBox(height: 20),
            NewUser()
          ],
          formAlignment: Alignment.topCenter,
          copyRightVersion: CopyRightVersion(),
        ),
      ),
    );
  }
}
