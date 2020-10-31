import 'dart:convert';
import 'dart:io';

import 'package:global_template/global_template.dart';
import 'package:image_picker/image_picker.dart';

enum ReturnFile { BASE64, FILE }

class CommonFunction {
  static Future pickImage({
    bool isCameraSource = true,
    ReturnFile returnFile = ReturnFile.FILE,
    double maxHeight = 600,
    double maxWidth = 480,
    int quality = 100,
    CameraDevice preferredCameraDevice = CameraDevice.rear,
  }) async {
    try {
      final picker = ImagePicker();
      final pickedFile = await picker.getImage(
        source: isCameraSource ? ImageSource.camera : ImageSource.gallery,
        maxHeight: maxHeight,
        maxWidth: maxWidth,
        imageQuality: quality,
        preferredCameraDevice: preferredCameraDevice,
      );
      if (pickedFile == null) {
        return;
      }
      if (returnFile == ReturnFile.BASE64) {
        var imageBytes = await pickedFile.readAsBytes();
        var base64Image = base64Encode(imageBytes);
        print('base64 image size ${await File(pickedFile.path).length()}');
        return base64Image;
      } else {
        print('File image size ${await File(pickedFile.path).length()}');
        return File(pickedFile.path);
      }
    } on IOException catch (err) {
      await GlobalFunction.showToast(message: err.toString(), toastType: ToastType.Error);
    } catch (e) {
      await GlobalFunction.showToast(message: e.toString(), toastType: ToastType.Error);
    }
  }
}
