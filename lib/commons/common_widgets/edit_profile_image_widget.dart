import 'dart:io';
import 'package:dmax_app/commons/common_functions/crop_Image.dart';
import 'package:dmax_app/commons/common_functions/padding.dart';
import 'package:dmax_app/commons/common_imports/common_libs.dart';
import 'package:dmax_app/commons/common_widgets/cached_circular_network_image.dart';
import 'package:dmax_app/core/extensions/color_extensions.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:image_picker/image_picker.dart';

class EditProfileImageWidget extends StatefulWidget {
  final String userImage;
  final Function(String imgPath) imgPath;
  final bool storeLogo;
  final String name;
  const EditProfileImageWidget({
    super.key,
    required this.userImage,
    required this.imgPath,
    this.storeLogo = false,
    required this.name,
  });

  @override
  State<EditProfileImageWidget> createState() => _EditProfileImageWidgetState();
}

class _EditProfileImageWidgetState extends State<EditProfileImageWidget> {
  File? imageFile;
  getPhoto() async {
    XFile? imgFile = await ImagePicker()
        .pickImage(source: ImageSource.gallery, imageQuality: 70);
    if (imgFile != null) {
      File? img =
          // ignore: use_build_context_synchronously
          await cropImage(imageFile: File(imgFile.path), context: context);
      if (img != null) {
        setState(() {
          imageFile = img;
        });
        widget.imgPath(imageFile!.path);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        height: 170.h,
        child: Stack(
          children: [
            Consumer(builder: (context, ref, child) {
              // UserModel userModel = ref.read(authNotifierCtr).userModel!;
              return CircleAvatar(
                radius: 75.r,
                backgroundColor: context.primary,
                child: CircleAvatar(
                  radius: 73.r,
                  backgroundColor: MyColors.lightBoarderColor,
                  backgroundImage:
                      imageFile != null ? FileImage(imageFile!) : null,
                  child: imageFile == null
                      ? widget.storeLogo
                          ? CircleAvatar(
                              radius: 73.r,
                              backgroundImage:
                                  const AssetImage(AppAssets.logoJpg))
                          : CachedCircularNetworkImageWidget(
                              name: widget.name,
                              image: widget.userImage,
                              size: 152)
                      : null,
                ),
              );
            }),
            Positioned(
                right: 3,
                bottom: 0.h,
                child: InkWell(
                  onTap: getPhoto,
                  child: Container(
                    height: 43.h,
                    width: 145.w,
                    decoration: BoxDecoration(
                      color: MyColors.imgCardColor,
                      borderRadius: BorderRadius.circular(8.r),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Change Image',
                          style: getBoldStyle(
                              color: context.whiteColor,
                              fontSize: MyFonts.size14),
                        ),
                        padding8,
                        SvgPicture.asset(
                          "AppAssets.galerySvgIcon",
                          width: 18.w,
                          height: 18.h,
                        ),
                      ],
                    ),
                  ),
                ))
          ],
        ),
      ),
    );
  }
}
