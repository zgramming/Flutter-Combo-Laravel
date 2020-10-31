import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:global_template/global_template.dart';

import '../../network/model/models.dart';
import '../../providers/providers.dart';
import '../../ui/screens/welcome/welcome_screen.dart';
import '../functions.dart';

class RequestFunction {
  static Future<void> login(
    BuildContext context, {
    @required GlobalKey<FormState> formKey,
    @required TextEditingController emailTextController,
    @required TextEditingController passwordTextController,
  }) async {
    if (!formKey.currentState.validate()) {
      return;
    }
    context.read(globalLoading).state = true;

    try {
      final UserModel result = await context.read(userProvider).login(
            emailTextController.text,
            passwordTextController.text,
          );

      await context.read(userProvider).saveSessionUser(result);
      Future.delayed(Duration(milliseconds: 800), () {
        Navigator.of(context).pushReplacementNamed(WelcomeScreen.routeNamed);
      });
    } catch (e) {
      await GlobalFunction.showToast(message: e.toString(), toastType: ToastType.Error);
    }
    context.read(globalLoading).state = false;
  }

  static Future<void> register(
    BuildContext context, {
    @required GlobalKey<FormState> formKey,
    @required TextEditingController nameTextController,
    @required TextEditingController emailTextController,
    @required TextEditingController passwordTextController,
    @required TextEditingController passwordConfirmationTextController,
  }) async {
    if (!formKey.currentState.validate()) {
      return;
    }
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
      await GlobalFunction.showToast(message: e.toString(), toastType: ToastType.Error);
    }
    context.read(globalLoading).state = false;
  }

  static Future<void> updateProfilImage(
    BuildContext context, {
    @required bool isCameraSource,
  }) async {
    context.read(globalLoading).state = true;
    try {
      final image = await CommonFunction.pickImage(
        returnFile: ReturnFile.BASE64,
        isCameraSource: isCameraSource ? true : false,
      );
      if (image != null) {
        final user = context.read(userProvider.state);
        final result = await context.read(userProvider).updateImage(
              user.idUser,
              image: image,
            );
        await GlobalFunction.showToast(
          message: result,
          toastType: ToastType.Success,
        );
      }
    } catch (e) {
      await GlobalFunction.showToast(
        message: e.toString(),
        toastType: ToastType.Error,
      );
    }
    context.read(globalLoading).state = false;
  }

  static Future<void> addProduct(
    BuildContext context, {
    @required int idProduct,
    @required GlobalKey<FormState> formKey,
    @required TextEditingController nameTextController,
    @required TextEditingController priceTextController,
    @required TextEditingController stockTextController,
    @required TextEditingController summaryTextController,
    @required TextEditingController descriptionTextController,
    @required String imageBase64,
  }) async {
    if (!formKey.currentState.validate()) {
      return;
    }
    context.read(globalLoading).state = true;
    try {
      final product = ProductModel(
        idProduct: idProduct,
        name: nameTextController.text,
        price: double.tryParse(GlobalFunction.unFormatNumber(priceTextController.text)),
        stock: int.tryParse(stockTextController.text),
        summary: summaryTextController.text,
        description: descriptionTextController.text,
        imageProduct: imageBase64 ?? "",
      );

      String result;

      if (idProduct == null) {
        result = await context.read(productProvider).add(product);
      } else {
        result = await context.read(productProvider).update(
              product.idProduct,
              name: product.name,
              price: product.price,
              stock: product.stock,
              summary: product.summary,
              description: product.description,
            );
      }
      await GlobalFunction.showToast(message: result, toastType: ToastType.Success);
      Future.delayed(Duration(milliseconds: 800), () {
        Navigator.of(context).pop();
      });
    } catch (e) {
      await GlobalFunction.showToast(message: e.toString(), toastType: ToastType.Error);
    }
    context.read(globalLoading).state = false;
  }

  static Future<void> deleteProduct(BuildContext context, {@required int idProduct}) async {
    context.read(globalLoading).state = true;
    try {
      final result = await context.read(productProvider).delete(idProduct);

      await GlobalFunction.showToast(message: result, toastType: ToastType.Error);
      Future.delayed(Duration(milliseconds: 800), () {
        Navigator.of(context).pop();
      });
    } catch (e) {
      await GlobalFunction.showToast(
        message: e.toString(),
        toastType: ToastType.Error,
      );
    }
    context.read(globalLoading).state = false;
  }

  static Future<void> updateImageProduct(
    BuildContext context, {
    @required int idProduct,
    @required bool isCameraSource,
  }) async {
    context.read(globalLoading).state = true;
    try {
      final image = await CommonFunction.pickImage(
        returnFile: ReturnFile.BASE64,
        isCameraSource: isCameraSource ? true : false,
      );
      if (image != null) {
        final result = await context.read(productProvider).updateImage(
              idProduct,
              image: image,
            );
        await GlobalFunction.showToast(
          message: result,
          toastType: ToastType.Success,
        );
      }
    } catch (e) {
      await GlobalFunction.showToast(
        message: e.toString(),
        toastType: ToastType.Error,
      );
    }
    context.read(globalLoading).state = false;
  }
}
