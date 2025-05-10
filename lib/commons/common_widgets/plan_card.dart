import 'package:dmax_app/commons/common_functions/padding.dart';
import 'package:dmax_app/commons/common_imports/common_libs.dart';
import 'package:dmax_app/core/extensions/color_extensions.dart';

class PlanCard extends StatefulWidget {
  const PlanCard(
      {super.key,
      required this.price,
      required this.plan,
      required this.index,
      required this.onTap,
      required this.selectIndex});
  final String price;
  final String plan;
  final int index;
  final Function(int index) onTap;
  final int selectIndex;

  @override
  State<PlanCard> createState() => _PlanCardState();
}

class _PlanCardState extends State<PlanCard> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        setState(() {
          widget.selectIndex == widget.onTap(widget.index);
        });
      },
      child: Container(
        height: 100.h,
        width: 360.w,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12.r),
            color: widget.selectIndex == widget.index
                ? MyColors.green
                : context.whiteColor,
            border: Border.all(color: context.boarderColor.withOpacity(0.3))),
        child: Padding(
          padding: const EdgeInsets.all(14),
          child: Column(
            children: [
              Text.rich(
                TextSpan(
                  text: '\$${widget.price}/ ',
                  style: getSemiBoldStyle(
                    color: widget.selectIndex == widget.index
                        ? context.whiteColor
                        : context.blackColor,
                    fontSize: 24.sp,
                  ),
                  children: [
                    TextSpan(
                      text: widget.plan,
                      style: getSemiBoldStyle(
                        color: widget.selectIndex == widget.index
                            ? context.whiteColor
                            : context.blackColor,
                        fontSize: 12.sp,
                      ),
                    ),
                  ],
                ),
              ),
              padding8,
              Text(
                'Amet minim mollit non deserunt ullamco est sit aliqua dolor do amet sint. Velit officia consequat duis enim velit mollit',
                textAlign: TextAlign.center,
                style: getRegularStyle(
                    color: widget.selectIndex == widget.index
                        ? context.whiteColor
                        : context.boarderColor,
                    fontSize: MyFonts.size11),
              )
            ],
          ),
        ),
      ),
    );
  }
}
