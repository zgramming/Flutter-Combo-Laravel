import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:global_template/global_template.dart';

import '../../register/register_screen.dart';

class NewUser extends StatelessWidget {
  const NewUser({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: RichText(
        text: TextSpan(
          style: appTheme.caption(context).copyWith(),
          text: 'Belum punya akun ? ',
          children: [
            TextSpan(
              text: 'Daftar disini',
              style: TextStyle(
                color: colorPallete.blue,
                decoration: TextDecoration.underline,
              ),
              recognizer: TapGestureRecognizer()
                ..onTap = () => showModalBottomSheet(
                      context: context,
                      enableDrag: false,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.vertical(
                          top: Radius.circular(30),
                        ),
                      ),
                      builder: (ctx) => RegisterScreen(),
                    ),
            )
          ],
        ),
      ),
    );
  }
}
