import 'dart:convert';
import 'dart:io';
import 'package:dmax_app/commons/common_functions/crop_Image.dart';
import 'package:dmax_app/commons/common_imports/apis_commons.dart';
import 'package:dmax_app/commons/common_imports/common_libs.dart';
import 'package:dmax_app/core/extensions/color_extensions.dart';
import 'package:dmax_app/utils/loading.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';

class AddScreenShort extends ConsumerStatefulWidget {
  const AddScreenShort({
    super.key,
    required this.onBase64Ready,
    required this.isGenerating,
  });

  final Function(String base64Image) onBase64Ready;
  final bool isGenerating;

  @override
  ConsumerState<AddScreenShort> createState() => _AddScreenShortState();
}

class _AddScreenShortState extends ConsumerState<AddScreenShort> {
  File? imageFile;
  bool isLoading = false;

  Future<void> getLogo() async {
    setState(() => isLoading = true);

    try {
      XFile? picked = await ImagePicker().pickImage(
        source: ImageSource.gallery,
        imageQuality: 70,
      );

      if (picked == null) {
        setState(() => isLoading = false);
        return;
      }

      File? cropped = await cropImage(
        imageFile: File(picked.path),
        // ignore: use_build_context_synchronously
        context: context,
        cropStyle: CropStyle.rectangle,
      );

      if (cropped != null) {
        final bytes = await cropped.readAsBytes();
        final base64Image = base64Encode(bytes);

        setState(() {
          imageFile = cropped;
          isLoading = false;
        });

        widget.onBase64Ready(base64Image); // send base64 out
        print("Base64 Image: $base64Image");
      } else {
        setState(() => isLoading = false);
      }
    } catch (e) {
      print("Image picking error: $e");
      setState(() => isLoading = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: getLogo,
      child: Container(
        height: 180.h,
        width: imageFile != null ? 140.w : 361.w,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12.r),
          color: context.whiteColor,
          boxShadow: [
            BoxShadow(
              color: context.blackColor.withOpacity(0.1),
              blurRadius: 10,
              offset: const Offset(0, 1),
            ),
          ],
        ),
        child: isLoading
            ? const Center(child: LoadingWidget(size: 100))
            : ClipRRect(
                borderRadius: BorderRadius.circular(12.r),
                child: Container(
                  height: 150.h,
                  width: widget.isGenerating ? 140.w : 361.w,
                  color: context.whiteColor,
                  child: imageFile != null
                      ? Image.file(imageFile!, fit: BoxFit.fill)
                      : Padding(
                          padding: const EdgeInsets.all(60.0),
                          child: SvgPicture.asset(
                            AppAssets.chatSvg,
                            height: 40.h,
                            width: 36.w,
                          ),
                        ),
                ),
              ),
      ),
    );
  }
}
