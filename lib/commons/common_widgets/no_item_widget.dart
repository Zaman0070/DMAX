import 'package:dmax_app/core/extensions/color_extensions.dart';
import 'package:flutter/material.dart';

import '../../utils/thems/styles_manager.dart';

class NoItemWidget extends StatelessWidget {
  final String text;
  const NoItemWidget({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        text,
        style: getSemiBoldStyle(color: context.bodyTextColor),
      ),
    );
  }
}
