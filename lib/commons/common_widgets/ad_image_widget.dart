import 'dart:io';
import 'package:dmax_app/commons/common_functions/crop_Image.dart';
import 'package:dmax_app/commons/common_functions/padding.dart';
import 'package:dmax_app/commons/common_imports/apis_commons.dart';
import 'package:dmax_app/commons/common_imports/common_libs.dart';
import 'package:dmax_app/core/extensions/color_extensions.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';

class AdImageWidget extends ConsumerStatefulWidget {
  const AdImageWidget({super.key, required this.imgPath, this.thumbnail});
  final Function(String imgPath) imgPath;

  final String? thumbnail;

  @override
  ConsumerState<AdImageWidget> createState() => _AdImageWidgetState();
}

class _AdImageWidgetState extends ConsumerState<AdImageWidget> {
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
        height: 122.h,
        width: 388.w,
        decoration: BoxDecoration(
          color: context.whiteColor,
          border: Border.all(color: context.blackColor.withOpacity(0.2)),
          borderRadius: BorderRadius.circular(8.r),
        ),
        child: widget.thumbnail != null &&
                imageFile == null &&
                widget.thumbnail!.isNotEmpty
            ? Image.network(
                widget.thumbnail!,
                fit: BoxFit.cover,
              )
            : imageFile != null
                ? ClipRRect(
                    borderRadius: BorderRadius.circular(12.r),
                    child: Image.file(
                      File(imageFile!.path),
                      fit: BoxFit.cover,
                    ))
                : Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SvgPicture.asset(
                        "AppAssets.gallerySvgIcon",
                        height: 45.h,
                        width: 45,
                      ),
                      padding12,
                      Text(
                        'Add an Image',
                        style: getMediumStyle(
                            color: context.blackColor,
                            fontSize: MyFonts.size16),
                      ),
                    ],
                  ),
      ),
    );
  }
}
