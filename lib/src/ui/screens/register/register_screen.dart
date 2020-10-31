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
            Consumer(
              builder: (_, watch, __) {
                final loading = watch(globalLoading).state;
                if (loading) {
                  return Center(child: CircularProgressIndicator());
                }
                return ButtonCustom(
                  onPressed: () async {
                    context.read(globalLoading).state = true;
                    try {
                      final result = await context.read(userProvider).register(
                            nameUser: nameTextController.text,
                            emailUser: emailTextController.text,
                            passwordUser: passwordTextController.text,
                            passwordConfirmation: passwordConfirmationTextController.text,
                          );
                      await GlobalFunction.showToast(
                        message: result.toString(),
                        toastType: ToastType.Success,
                        isLongDuration: true,
                      );
                      Navigator.of(context).pop();
                    } catch (e) {
                      await GlobalFunction.showToast(
                          message: e.toString(), toastType: ToastType.Error);
                    }
                    context.read(globalLoading).state = false;
                  },
                  child: Text('Daftar'),
                );
              },
            ),
            SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
