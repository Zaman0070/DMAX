// import 'package:dmax_app/commons/common_imports/common_libs.dart';
// import 'package:dmax_app/utils/constants/assets_manager.dart';
// import 'package:flutter_rating_bar/flutter_rating_bar.dart';
// import 'package:flutter_svg/flutter_svg.dart';

// class CommonRatingBar extends StatelessWidget {
//   const CommonRatingBar(
//       {super.key,
//       required this.initialRating,
//       this.size = 14,
//       required this.onRatingUpdate,
//       this.isEnable = false});
//   final double initialRating;
//   final double size;
//   final Function(double) onRatingUpdate;
//   final bool isEnable;

//   @override
//   Widget build(BuildContext context) {
//     return RatingBar(
//       ignoreGestures: isEnable,
//       initialRating: initialRating,
//       direction: Axis.horizontal,
//       allowHalfRating: true,
//       itemCount: 5,
//       itemSize: size.r,
//       ratingWidget: RatingWidget(
//         full: SvgPicture.asset(
//           AppAssets.starSvgIcon,
//           height: 5.h,
//           width: 5.w,
//         ),
//         empty: SvgPicture.asset(AppAssets.emptystarSvgIcon),
//         half: SvgPicture.asset(AppAssets.halfstarSvgIcon),
//       ),
//       itemPadding: const EdgeInsets.only(right: 8.0),
//       onRatingUpdate: (rating) {
//         print(rating);
//         onRatingUpdate(rating);
//       },
//     );
//   }
// }
