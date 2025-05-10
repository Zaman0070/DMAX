// import 'package:dmax_app/commons/common_functions/padding.dart';
// import 'package:dmax_app/commons/common_functions/validator.dart';
// import 'package:dmax_app/commons/common_imports/common_libs.dart';
// import 'package:dmax_app/commons/common_widgets/CustomTextFields.dart';
// import 'package:dmax_app/commons/common_widgets/custom_button.dart';
// import 'package:dmax_app/commons/common_widgets/show_toast.dart';
// import 'package:dmax_app/core/enums/signup_type/signup_type.dart';
// import 'package:dmax_app/features/auth/controller/auth_controller.dart';
// import 'package:dmax_app/features/auth/controller/auth_notifier_controller.dart';
// import 'package:dmax_app/features/vendor/orders/controller/order_controller.dart';
// import 'package:dmax_app/models/auth_model/user_model.dart';

// import 'package:dmax_app/utils/loading.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';

// class DeleteAccountDialog extends ConsumerStatefulWidget {
//   const DeleteAccountDialog({super.key, required this.isSeller});
//   final bool isSeller;

//   @override
//   ConsumerState<DeleteAccountDialog> createState() => _SignUpScreenState();
// }

// class _SignUpScreenState extends ConsumerState<DeleteAccountDialog> {
//   final TextEditingController passwordController = TextEditingController();
//   final TextEditingController codeController = TextEditingController();
//   bool passObscure = true;
//   bool isDeleteAccount = false;

//   final FirebaseAuth _auth = FirebaseAuth.instance;
//   String _verificationId = '';

//   Future<void> _verifyPhoneNumber({required String phone}) async {
//     verificationCompleted(PhoneAuthCredential phoneAuthCredential) async {
//       await _auth.signInWithCredential(phoneAuthCredential);
//     }

//     verificationFailed(FirebaseAuthException authException) {
//       print(
//           'Phone number verification failed. Code: ${authException.code}. Message: ${authException.message}');
//     }

//     codeSent(String verificationId, [int? forceResendingToken]) async {
//       setState(() {
//         _verificationId = verificationId;
//       });
//       print("Code sent to $phone");
//     }

//     codeAutoRetrievalTimeout(String verificationId) {
//       _verificationId = verificationId;
//     }

//     await _auth.verifyPhoneNumber(
//       phoneNumber: phone,
//       timeout: const Duration(seconds: 60),
//       verificationCompleted: verificationCompleted,
//       verificationFailed: verificationFailed,
//       codeSent: codeSent,
//       codeAutoRetrievalTimeout: codeAutoRetrievalTimeout,
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     final controller = ref.watch(authControllerProvider.notifier);

//     return Consumer(builder: (context, ref, child) {
//       UserModel? user = ref.watch(authNotifierCtr).userModel;
//       final orderExist = widget.isSeller
//           ? ref.watch(watchOrderSellerProvider)
//           : ref.watch(watchOrdersProvider);
//       return orderExist.when(data: (data) {
//         final orderExistList = data.where((element) {
//           return element.orderStatus == 'Ongoing' ||
//               element.orderStatus == 'Dispatched';
//         }).toList();
//         return Container(
//           height: isDeleteAccount ? 415.h : 300.h,
//           width: 320.w,
//           decoration: BoxDecoration(
//             color: context.whiteColor,
//             borderRadius: BorderRadius.circular(25.r),
//           ),
//           child: Scaffold(
//             resizeToAvoidBottomInset: false,
//             backgroundColor: Colors.transparent,
//             body: Padding(
//               padding: EdgeInsets.symmetric(vertical: 15.h, horizontal: 15.w),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.center,
//                 children: [
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.end,
//                     children: [
//                       InkWell(
//                         onTap: () {
//                           Navigator.pop(context);
//                         },
//                         child: Icon(
//                           CupertinoIcons.clear,
//                           color: context.bodyTextColor,
//                           size: 25.h,
//                         ),
//                       ),
//                     ],
//                   ),
//                   padding8,
//                   Image.asset(
//                     AppAssets.infoRound,
//                     height: 70.h,
//                     width: 70.w,
//                     color: context.primary,
//                   ),
//                   padding12,
//                   Text(
//                     'Are You Sure Want To Delete The Account Permanently?',
//                     textAlign: TextAlign.center,
//                     style: getRegularStyle(
//                         color: context.secondaryContainerColor,
//                         fontSize: MyFonts.size15),
//                   ),
//                   padding4,
//                   Text(
//                     'All your data will be lost.',
//                     textAlign: TextAlign.center,
//                     style: getMediumStyle(
//                         color: context.errorColor, fontSize: MyFonts.size14),
//                   ),
//                   isDeleteAccount
//                       ? user!.signupType.type == 'email'
//                           ? CustomTextField(
//                               controller: passwordController,
//                               hintText: 'Enter Password',
//                               label: 'Password',
//                               validatorFn: passValidator,
//                               obscure: passObscure,
//                               tailingIcon: passObscure == false
//                                   ? InkWell(
//                                       onTap: () {
//                                         setState(() {
//                                           passObscure = !passObscure;
//                                         });
//                                       },
//                                       child: Icon(
//                                         CupertinoIcons.eye,
//                                         color: context.bodyTextColor,
//                                         size: 20.h,
//                                       ))
//                                   : InkWell(
//                                       onTap: () {
//                                         setState(() {
//                                           passObscure = !passObscure;
//                                         });
//                                       },
//                                       child: Icon(
//                                         CupertinoIcons.eye_slash,
//                                         color: context.bodyTextColor,
//                                         size: 20.h,
//                                       )),
//                             )
//                           : Column(
//                               children: [
//                                 Text(
//                                     'Enter the code sent to your ${user.phoneNumber}',
//                                     style: getRegularStyle(
//                                         color: context.secondaryContainerColor,
//                                         fontSize: MyFonts.size14)),
//                                 CustomTextField(
//                                   controller: codeController,
//                                   hintText: 'Enter Code',
//                                   label: 'Code',
//                                 ),
//                               ],
//                             )
//                       : Container(),
//                   padding24,
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     children: [
//                       CustomButton(
//                           borderColor: context.secondaryContainerColor,
//                           backColor: context.whiteColor,
//                           buttonHeight: 38.h,
//                           buttonWidth: 135.w,
//                           onPressed: () {
//                             Navigator.pop(context);
//                           },
//                           textColor: context.secondaryContainerColor,
//                           buttonText: 'Cancel'),
//                       CustomButton(
//                           isLoading: ref.watch(authControllerProvider),
//                           backColor: context.primary,
//                           buttonHeight: 38.h,
//                           buttonWidth: 135.w,
//                           onPressed: () async {
//                             if (orderExistList.isNotEmpty) {
//                               showToast(
//                                   msg:
//                                       'You have ongoing orders, you can first cancel them and then delete the account.',
//                                   backgroundColor: context.errorColor,
//                                   textColor: context.whiteColor);
//                               return;
//                             } else {
//                               if (user!.signupType.type ==
//                                   SignupTypeEnum.phone.type) {
//                                 if (_verificationId == '') {
//                                   await _verifyPhoneNumber(
//                                       phone: user.phoneNumber!
//                                           .replaceAll('-', ''));
//                                   setState(() {
//                                     isDeleteAccount = true;
//                                   });
//                                 } else {
//                                   codeController.text.trim().isNotEmpty
//                                       ? await controller.deleteAccountPhone(
//                                           context: context,
//                                           verificationId: _verificationId,
//                                           sms: codeController.text.trim())
//                                       : showToast(
//                                           msg: 'Please enter the code',
//                                           backgroundColor: context.errorColor,
//                                           textColor: context.whiteColor);
//                                 }
//                               } else if (user.signupType.type ==
//                                   SignupTypeEnum.email.type) {
//                                 isDeleteAccount
//                                     ? passwordController.text.trim().isNotEmpty
//                                         ? await controller.deleteAccountEmail(
//                                             context: context,
//                                             password: passwordController.text)
//                                         : showToast(
//                                             msg: 'Please enter the password',
//                                             backgroundColor: context.errorColor,
//                                             textColor: context.whiteColor)
//                                     : setState(() {
//                                         isDeleteAccount = true;
//                                       });
//                               } else if (user.signupType.type ==
//                                   SignupTypeEnum.google.type) {
//                                 await controller.deleteAccountGoogle(
//                                   context: context,
//                                 );
//                               }
//                             }
//                           },
//                           textColor: MyColors.white,
//                           buttonText: 'Delete'),
//                     ],
//                   ),
//                 ],
//               ),
//             ),
//           ),
//         );
//       }, error: (e, s) {
//         return const SizedBox.shrink();
//       }, loading: () {
//         return const LoadingWidget();
//       });
//     });
//   }
// }
