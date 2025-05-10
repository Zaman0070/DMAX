import 'package:dmax_app/core/extensions/color_extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class LoadingWidget extends StatelessWidget {
  final Color? color;
  final double? size;
  final Color? backColor;
  const LoadingWidget({super.key, this.color, this.size, this.backColor});

  @override
  Widget build(BuildContext context) {
    return Container(
        alignment: Alignment.center,
        height: size ?? 200.h,
        width: size ?? 300.w,
        decoration: BoxDecoration(
            color: backColor ?? context.scaffoldBackgroundColor,
            borderRadius: BorderRadius.circular(12.r)),
        child: SpinKitCircle(
          duration: const Duration(seconds: 2),
          itemBuilder: (BuildContext context, int index) {
            return DecoratedBox(
              decoration: BoxDecoration(
                  color: color ?? context.primary,
                  borderRadius: BorderRadius.circular(50.r)),
            );
          },
        ));
  }
}

class DotLoading extends StatelessWidget {
  final Color? color;
  final double? size;
  final Color? backColor;
  const DotLoading({super.key, this.color, this.size, this.backColor});

  @override
  Widget build(BuildContext context) {
    return SpinKitThreeBounce(
      size: 20,
      duration: const Duration(seconds: 2),
      itemBuilder: (BuildContext context, int index) {
        return DecoratedBox(
          decoration: BoxDecoration(
              color: color ?? context.primary,
              borderRadius: BorderRadius.circular(50.r)),
        );
      },
    );
  }
}
