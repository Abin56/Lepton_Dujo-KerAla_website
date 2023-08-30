import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import '../view/constant/constant.dart';

class ImagePickerHelper {
  static Future<Uint8List?> pickImage(BuildContext context) async {
    try {
      final ImagePicker picker = ImagePicker();
      XFile? pickedImage;

      pickedImage = await picker.pickImage(source: ImageSource.gallery);
      if (context.mounted) {
        Navigator.of(context).pop();
      }

      // Show an options dialog to choose between camera and gallery

      if (pickedImage != null) {
        return pickedImage.readAsBytes();
      } else {
        return null;
      }
    } catch (e) {
      showToast(msg: "Something went wrong");
    }
    return null;
  }
}
