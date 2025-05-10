import 'package:dmax_app/commons/common_imports/common_libs.dart';
import 'package:dmax_app/core/extensions/color_extensions.dart';

class TextAnimation extends StatefulWidget {
  const TextAnimation({
    super.key,
    required this.text,
    required this.fontSize,
    required this.fontWeight,
    this.isDM = false,
    this.isToi = false,
  });

  final String text;
  final double fontSize;
  final FontWeight fontWeight;
  final bool? isDM;
  final bool? isToi;

  @override
  State<TextAnimation> createState() => _TextAnimationState();
}

class _TextAnimationState extends State<TextAnimation>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<int> _charCount;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: Duration(milliseconds: widget.text.length * 150),
      vsync: this,
    );

    _charCount = StepTween(begin: 0, end: widget.text.length).animate(
      CurvedAnimation(parent: _controller, curve: Curves.linear),
    );

    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _charCount,
      builder: (context, child) {
        int count = _charCount.value;
        if (count == 0) count = 1;

        String visibleText =
            widget.text.substring(0, count.clamp(0, widget.text.length));

        List<TextSpan> spans = [];

        // Match priority: Apprenons A, Connaître, Toi, DM, other text
        RegExp regex = RegExp(
          r"(Apprenons A)|(Connaître)|(Toi)|(DM)|([^ACTD]+|[ACTD](?!onnaître|oi|M))",
        );

        Iterable<RegExpMatch> matches = regex.allMatches(visibleText);

        for (var match in matches) {
          String? matchText = match.group(0);
          if (matchText == null) continue;

          bool isDM = matchText == "DM";
          bool isToi = matchText == "Toi";
          bool isApprenons = matchText == "Apprenons A";
          bool isConnaitre = matchText == "Connaître";

          Color color;
          if (isDM && widget.isDM == true) {
            color = context.primary;
          } else if (isToi && widget.isToi == true) {
            color = context.primary;
          } else if (isApprenons || isConnaitre) {
            color = Colors.black.withOpacity(0.6);
          } else {
            color = Colors.black;
          }

          spans.add(TextSpan(
            text: matchText,
            style: TextStyle(
              fontSize: widget.fontSize,
              fontWeight: widget.fontWeight,
              fontFamily: 'SF-Pro-Rounded',
              color: color,
            ),
          ));
        }

        return RichText(
          textAlign: TextAlign.center,
          text: TextSpan(children: spans),
        );
      },
    );
  }
}
