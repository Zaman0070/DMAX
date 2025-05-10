import 'package:dmax_app/commons/common_imports/common_libs.dart';
import 'package:dmax_app/commons/common_shimmers/loading_images_shimmer.dart';
import 'package:cached_network_image/cached_network_image.dart';

class CachedRectangularNetworkImageWidget extends StatelessWidget {
  const CachedRectangularNetworkImageWidget({
    super.key,
    required this.image,
    required this.width,
    required this.height,
    this.fit,
    this.borderRadius = 16,
    this.radius,
    this.borderColor = Colors.transparent,
  });

  final String image;
  final int width;
  final int height;
  final BoxFit? fit;
  final double borderRadius;
  final BorderRadiusGeometry? radius;
  final Color borderColor;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width.w,
      height: height.h,
      child: CachedNetworkImage(
        imageUrl: image,
        imageBuilder: (context, imageProvider) => Container(
          decoration: BoxDecoration(
            shape: BoxShape.rectangle,
            borderRadius: radius ?? BorderRadius.circular(borderRadius.r),
            border: Border.all(color: borderColor, width: 1),
            image:
                DecorationImage(image: imageProvider, fit: fit ?? BoxFit.cover),
          ),
        ),
        placeholder: (context, url) => const Center(child: ShimmerWidget()),
        errorWidget: (context, url, error) => Center(
            child: SizedBox(
                width: 20.w, height: 20.h, child: const Icon(Icons.error))),
      ),
    );
  }
}
