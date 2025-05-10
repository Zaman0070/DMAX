import 'dart:io';
import 'package:image_picker/image_picker.dart';
import '../common_imports/common_libs.dart';
import '../common_widgets/show_toast.dart';

Future<File?> pickChatImageFromGallery(BuildContext context) async {
  File? image;
  try {
    final pickedImage = await ImagePicker()
        .pickImage(source: ImageSource.gallery, imageQuality: 70);

    if (pickedImage != null) {
      image = File(pickedImage.path);
    }
  } catch (e) {
    showSnackBar(context, e.toString());
  }

  return image;
}
