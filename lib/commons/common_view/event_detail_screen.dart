// import 'package:dmax_app/commons/common_imports/apis_commons.dart';
// import 'package:dmax_app/commons/common_imports/common_libs.dart';
// import 'package:dmax_app/commons/common_widgets/cached_retangular_network_image.dart';
// import 'package:dmax_app/commons/common_widgets/custom_button.dart';
// import 'package:dmax_app/core/extensions/color_extensions.dart';
// import 'package:dmax_app/features/user/home/widget/u_event_detail_widget.dart';
// import 'package:dmax_app/features/user/home/widget/u_photo_video_widget.dart';
// import 'package:dmax_app/models/event_model/event_model.dart';
// import 'package:dmax_app/routes/route_manager.dart';

// class EventDetailScreen extends ConsumerStatefulWidget {
//   const EventDetailScreen(
//       {super.key, this.isSeller = false, required this.model});

//   final bool isSeller;
//   final EventModel model;

//   @override
//   ConsumerState<EventDetailScreen> createState() => _EventDetailScreen();
// }

// class _EventDetailScreen extends ConsumerState<EventDetailScreen> {
//   @override
//   Widget build(BuildContext context) {
//     // final homeCtr = ref.read(homeNotifierCtr);
//     return WillPopScope(
//       onWillPop: () async {
//         // homeCtr.setReview('All');
//         return true;
//       },
//       child: Scaffold(
//         body: Column(
//           children: [
//             Stack(
//               children: [
//                 CachedRectangularNetworkImageWidget(
//                   image: widget.model.thumbnail ?? '',
//                   width: 428,
//                   height: 365,
//                   borderRadius: 0,
//                 ),
//                 Positioned(
//                   top: 30,
//                   left: 10,
//                   child: IconButton(
//                     onPressed: () {
//                       Navigator.pop(context);
//                     },
//                     icon: Container(
//                       height: 50.h,
//                       width: 50.w,
//                       decoration: BoxDecoration(
//                           borderRadius: BorderRadius.circular(100.r),
//                           color: context.whiteColor),
//                       child: Padding(
//                         padding: const EdgeInsets.all(8.0),
//                         child: Image.asset(
//                           AppAssets.backArrowIcon,
//                           width: 20.w,
//                           height: 20.h,
//                           color: context.blackColor,
//                         ),
//                       ),
//                     ),
//                   ),
//                 )
//               ],
//             ),
//             Expanded(
//               child: SingleChildScrollView(
//                   physics: const BouncingScrollPhysics(),
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       UEventDetailWidget(
//                         isSeller: widget.isSeller,
//                         model: widget.model,
//                       ),
//                       UPhotoVideoWidget(
//                         model: widget.model,
//                       ),
//                       // const UReviewWidget(
//                       //     // model: widget.model,
//                       //     ),
//                     ],
//                   )),
//             ),
//           ],
//         ),
//         bottomNavigationBar: widget.isSeller == true
//             ? null
//             : Consumer(builder: (context, ref, child) {
//                 // UserModel? userModel = ref.watch(authNotifierCtr).userModel;
//                 return Container(
//                   height: 75.h,
//                   decoration: BoxDecoration(
//                     color: context.scaffoldBackgroundColor,
//                     boxShadow: [
//                       BoxShadow(
//                         color: context.blackColor.withOpacity(0.1),
//                         spreadRadius: 1,
//                         blurRadius: 5,
//                         offset: const Offset(0, 3),
//                       ),
//                     ],
//                   ),
//                   child: Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                     children: [
//                       CustomButton(
//                         onPressed: () async {
//                           // if (userModel == null) {
//                           //   showCustomDialog(
//                           //       context: context,
//                           //       content: const LoginToUserDialog());
//                           // } else
//                           //  {
//                           // final seller = await ref.read(
//                           //     fetchUserByIdProvider(widget.model.uid!)
//                           //         .future);
//                           Navigator.of(context)
//                               .pushNamed(AppRoutes.messageScreen, arguments: {
//                             'isAdmin': false,
//                             'name': 'seller.name',
//                             'uid': 'seller.uid',
//                             'profilePic': 'seller.profileImage',
//                           });
//                           // Navigator.pushNamed(context, AppRoutes.messageScreen);
//                           // }
//                         },
//                         buttonText: 'Message',
//                         buttonHeight: 55.h,
//                         buttonWidth: 170.w,
//                         borderColor: context.primary,
//                         textColor: context.primary,
//                       ),
//                       CustomButton(
//                         onPressed: () {
//                           // if (userModel == null) {
//                           //   showCustomDialog(
//                           //       context: context,
//                           //       content: const LoginToUserDialog());
//                           // } else {

//                           // widget.model.uid != userModel.uid
//                           //     ?
//                           Navigator.pushNamed(
//                             context,
//                             AppRoutes.userBookingScreen,
//                             // arguments: {
//                             //   'model': widget.model,
//                             // },
//                           );
//                           // : showToast(
//                           //     msg: 'You can not order your own service',
//                           //     backgroundColor: context.errorColor,
//                           //     textColor: context.whiteColor);
//                           // }
//                         },
//                         buttonText: 'Order Now',
//                         buttonHeight: 55.h,
//                         buttonWidth: 170.w,
//                         backColor: context.primary,
//                       ),
//                     ],
//                   ),
//                 );
//               }),
//       ),
//     );
//   }
// }
