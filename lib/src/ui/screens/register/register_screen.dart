import 'package:combo_rest_api_laravel/src/functions/functions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:global_template/global_template.dart';

import '../../../providers/providers.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({
    Key key,
  }) : super(key: key);

  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final _formKey = GlobalKey<FormState>();
  final nameTextController = TextEditingController();
  final emailTextController = TextEditingController();
  final passwordTextController = TextEditingController();
  final passwordConfirmationTextController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
      padding: const EdgeInsets.all(14.0),
      child: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                'Form Pendaftaran',
                style: appTheme.headline6(context),
              ),
              SizedBox(height: 20),
              TextFormFieldCustom(
                controller: nameTextController,
                hintText: 'John Doe',
                labelText: 'Nama User',
                prefixIcon: Icon(Icons.supervised_user_circle),
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
                controller: passwordTextController,
                labelText: 'Password',
                hintText: '********',
                isPassword: true,
                keyboardType: TextInputType.visiblePassword,
              ),
              SizedBox(height: 20),
              TextFormFieldCustom(
                controller: passwordConfirmationTextController,
                labelText: 'Konfirmasi password',
                hintText: '********',
                isPassword: true,
                keyboardType: TextInputType.visiblePassword,
              ),
              SizedBox(height: 20),
              ProviderListener(
                provider: globalLoading,
                onChange: (context, loading) async {
                  if (loading.state) {
                    await GlobalFunction.showDialogLoading(context);
                  } else {
                    Navigator.of(context).pop();
                  }
                },
                child: ButtonCustom(
                  onPressed: () async => RequestFunction.register(
                    context,
                    formKey: _formKey,
                    nameTextController: nameTextController,
                    emailTextController: emailTextController,
                    passwordTextController: passwordTextController,
                    passwordConfirmationTextController: passwordConfirmationTextController,
                  ),
                  child: Text('Daftar'),
                ),
              ),
              SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
