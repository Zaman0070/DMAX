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
    required this.imgPath,
    required this.isGenerating,
  });
  final Function(String) imgPath;
  final bool isGenerating;

  @override
  ConsumerState<AddScreenShort> createState() => _AddScreenShortState();
}

class _AddScreenShortState extends ConsumerState<AddScreenShort> {
  File? imageFile;
  bool isLoading = false;
  getLogo() async {
    XFile? imgFile = await ImagePicker()
        .pickImage(source: ImageSource.gallery, imageQuality: 70);
    File? img =
        // ignore: use_build_context_synchronously
        await cropImage(
            imageFile: File(imgFile!.path),
            // ignore: use_build_context_synchronously
            context: context,
            cropStyle: CropStyle.rectangle);
    if (img != null) {
      setState(() {
        imageFile = img;
      });

      widget.imgPath(imageFile!.path);
    }
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: getLogo,
      child: Container(
        height: 180.h,
        width: 361.w,
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
                borderRadius: BorderRadius.all(Radius.circular(12.r)),
                child: Container(
                  height: 150.h,
                  width: widget.isGenerating ? 140.w : 361.w,
                  color: context.whiteColor,
                  child: imageFile != null
                      ? ClipRRect(
                          borderRadius: BorderRadius.circular(12.r),
                          child: Image.file(
                            File(imageFile!.path),
                            fit: BoxFit.cover,
                          ))
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
