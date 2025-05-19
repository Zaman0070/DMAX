import 'package:dmax_app/commons/common_functions/padding.dart';
import 'package:dmax_app/commons/common_imports/common_libs.dart';
import 'package:dmax_app/core/extensions/color_extensions.dart';
import 'package:dmax_app/utils/constants/app_constants.dart';

class CommonBudgetWidget extends StatelessWidget {
  const CommonBudgetWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 16.h),
      padding: EdgeInsets.all(AppConstants.padding),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12.r),
        border: Border.all(color: context.blackColor.withOpacity(0.2)),
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Budget',
                  style: getSemiBoldStyle(
                      color: context.blackColor, fontSize: MyFonts.size18)),
              Text('Balance',
                  style: getRegularStyle(
                      color: context.blackColor, fontSize: MyFonts.size15)),
              Container(width: 10.w),
            ],
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 4),
            child: Divider(
              color: context.blackColor.withOpacity(0.2),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Budget',
                        style: getMediumStyle(
                            color: context.bodyTextColor,
                            fontSize: MyFonts.size15),
                      ),
                      padding8,
                      Text(
                        'Paid',
                        style: getMediumStyle(
                            color: context.bodyTextColor,
                            fontSize: MyFonts.size15),
                      ),
                      padding8,
                      Text(
                        'Pending',
                        style: getMediumStyle(
                            color: context.bodyTextColor,
                            fontSize: MyFonts.size15),
                      ),
                    ],
                  ),
                  padding16,
                  Container(
                    height: 76.h,
                    width: 2.w,
                    color: context.blackColor.withOpacity(0.2),
                  ),
                ],
              ),
              Column(
                children: [
                  Row(
                    children: [
                      CircleAvatar(
                        radius: 5.r,
                        backgroundColor: context.errorColor,
                      ),
                      padding8,
                      Text(
                        'Not Defined',
                        style: getMediumStyle(
                            color: context.bodyTextColor,
                            fontSize: MyFonts.size14),
                      )
                    ],
                  ),
                  padding8,
                  Row(
                    children: [
                      CircleAvatar(
                        radius: 5.r,
                        backgroundColor: context.primary,
                      ),
                      padding8,
                      Text(
                        'Not Defined',
                        style: getMediumStyle(
                            color: context.bodyTextColor,
                            fontSize: MyFonts.size14),
                      )
                    ],
                  ),
                  padding8,
                  Row(
                    children: [
                      CircleAvatar(
                        radius: 5.r,
                        backgroundColor: MyColors.purple,
                      ),
                      padding8,
                      Text(
                        'Not Defined',
                        style: getMediumStyle(
                            color: context.bodyTextColor,
                            fontSize: MyFonts.size14),
                      )
                    ],
                  ),
                ],
              ),
              Container(width: 10)
            ],
          ),
        ],
      ),
    );
  }
}
